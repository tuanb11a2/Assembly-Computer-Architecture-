#String Common Character Problem
#----------------------------------------------------------
# @brief      Kiem tra va dem so phan tu trung nhau cua 2 string tinh ca trung nhau
# @param[in]  2 input string from user 
# @return 	$v0 = so character trung nhau
# @note 	  co dialog box the hien output va nhap input
#-----------------------------------------------------------
#Registers:
#$v0: syscall service
#$a0:Message
#$a1:Input string
#$a2: Max character acceppted
.data
Message1: .asciiz "Enter the first string(<=100 characters): "
String1: .space 101
Message2: .asciiz "Enter the second string(<=100 characters): "
String2: .space 101
Message3:	.asciiz "The result is: "
Store: .space 101
.text
input:
	li  $v0, 54    		#Syscall service for user to input the first string
	la  $a0, Message1    	
	la  $a1, String1
	li  $a2,100   
	syscall
	
	li  $v0, 54    		#Syscall service for user to input the second string
	la  $a0, Message2    
	la  $a1, String2
	li  $a2, 100   
	syscall
main:
	la $a1, String1	#a1 = address of String1
	jal verifyString	#call the verifyString function
	la $a1, String2	#a1 = address of string2
	jal verifyString	#call the verifyString function
	
	la $a1,String1		#a1 = address of String1
	la $a2,String2		#a2 = address of String2
	jal commonCharacterCount	#after verify, call the function to count the common characters
	j end_main
end_main:
	add $a1,$zero,$v0	#syscall service for dialog box for output the result
	li $v0,56			
	la $a0,Message3	
	syscall
	
	li $v0,10			#terminate
	syscall

#----------------------------------------------------------
# @function verifyString Kiem tra va loai bo phan tu '\n' cua 1 string neu co
# @param[in]  $a1: string input thu nhat,
#		    $a2: string input thu hai
# @return     $a1,$a2: 2 string sau khi verify 
# @note 	  use pointers in this function
#-----------------------------------------------------------
#Registers:
#$t0: value of '\n'
#$a1:Input string
#$s0: = a1[0] 
verifyString:
	li $t0,10			#value of '\n'
check_loop:
	lbu $s0, 0($a1)   	#load value of a1 to s0
	addiu $a1, $a1, 1	#increase the address of the first string
	beq $s0,$t0,modify	#if found '\n' =>modify
	bnez $s0, check_loop # Search the NULL char code
	j skip
modify:
	addi $a1,$a1,-1	
	sb $0, 0($a1)     	# and put a NULL instead
skip:
	jr $ra
#----------------------------------------------------------
# @function duplicateCharacter Kiem tra 1 character xuat hien bao nhieu lan trong string
# @param[in]  $s0: need to check character
#		    $a1: string input de kiem tra
# @return     $v0: the number of times this appear in string 
#-----------------------------------------------------------
#Registers:
#$s0: need to check character
#$v0: the number of times this appear in string
#$a1:Input string
#$t1: = a1[0] 
duplicateCharacter:
	lb $t1,0($a1)					#get the value of a1	
	addiu $a1, $a1, 1				#increase the address of the first string
	beq $s0,$t1,count_char			#count_char ++	
	bne $t1,$zero,duplicateCharacter	#if meet the end of string =>done
	j done_check
count_char:
	addi $v0,$v0,1
	j duplicateCharacter
done_check:
	jr $ra
#----------------------------------------------------------
# @function repeatChar Kiem tra 1 character da duoc count tu truoc hay chua
# @param[in]  $s0: need to check character
#		    $a3: string input de kiem tra
# @return     $v0: boolean if v0 = 0=> haven't count yet and v0 =1 if y
#-----------------------------------------------------------
#Registers:
#$t5: = a3[0]
#$s0: need to check character
#$v0: boolean return
#$a3:Input string
repeatChar:
	lb $t5,0($a3)		#t5 = a3[]
	beq $t5,$zero,done_repeatChar
	beq $t5,$s0,already
	addi $a3,$a3,1
	j repeatChar
already:
	li $v0,1			#return value = 1
	jr $ra
done_repeatChar:
	sb $s0,0($a3)		#add the character to the store string for next comparison
	jr $ra
	
	
#----------------------------------------------------------
# @function commonCharacterCount Kiem tra va dem so phan tu trung nhau cua 2 string
# @param[in]  $a1: string input thu nhat,
#		    $a2: string input thu hai
# @return     $v0: Thanh ghi chua so common characters cua 2 string input
# @note 	  2 for loop in this function
#-----------------------------------------------------------
#Registers:
#$t0: count variable = output temporary
#$s0: = a1[]
#$s1: = a2[]
#$sp: stack pointer
#$v0: output when using function
#$a1:Input string 1
#$a2:Input string 2
#$s3,s4: output value of function duplicateCharacter
#$t5:comparison variable for slt instruction
commonCharacterCount:
	li $t0,0 			#t0 =count
first_loop:
	lb $s0,0($a1)		#s0 = value at a1
	addi $sp,$sp,-4
	sw $ra,0($sp)
	la $a3,Store		#a3 = address of Store
	li $v0,0
	jal repeatChar		#Check if the character has count before or not
	lw $ra,0($sp)		#return the return address of commonCharacterCount
	addi $sp,$sp,4		#return the address of stack pointer
	bne $v0,$zero,set	#if this character haven appear before => break the loop
	beq $s0,$zero,done	#if s0 = 0 mean the end of the first string =>done
	j second_loop
second_loop:
	lb $s1,0($a2)		#s1 = value at a2
	beq $s1,$zero,set	#if s1 = 0 mean the end of the second string =>set to the next loop
	beq $s0,$s1,count	#if found a common characters, count++
	addi $a2,$a2,1		#a2 = a2 +1
	j second_loop
after_check:
	beq $s3,$zero,set	#this will prevent repeat character to be count and go to the next first loop
	beq $s4,$zero,set
	addi $a2,$a2,1		#a2 = a2 +1
	j second_loop
count:
	addi $sp,$sp,-8	#adjust the stack pointer to store current address of a1 and return address
	sw $a1,4($sp)
	sw $ra,0($sp)
	li $v0,0
	la $a1,String1		#set address of string 1 for count function
	jal duplicateCharacter
	add $s3,$v0,$zero
	add $v0,$zero,$zero
	la $a1,String2		#set address of string 2 for count function
	jal duplicateCharacter
	add $s4,$v0,$zero
	add $v0,$zero,$zero
	lw $a1,4($sp)		#return address of a1
	lw $ra,0($sp)		#return ra of the commoncheck function
	addi $sp,$sp,8		#return the value of stack pointer
	slt  $t5,$s3,$s4
	beq $t5,$zero,change
	add $t0,$t0,$s3
	addi $s3,$zero,0
	j after_check
change:
	add $t0,$t0,$s4		#count++
	addi $s4,$zero,0
	j after_check
set:
	la $a2,String2		#reset address of second string
	addi $a1,$a1,1		#move to next character of first string
	j first_loop
done:
	add $v0,$zero,$t0	#set the result to v0
	lw $a1,4($sp)		#restore address of 2 strings
	lw $a2,0($sp)
	addi $sp,$sp,8		#restore the stack pointers address
	jr $ra			#jump back to the main

	
	
	
	
	
	
	


