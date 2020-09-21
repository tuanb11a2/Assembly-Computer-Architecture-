#Assignment 05 lab 07
# t0 is index i
#v0 is the max
#t1 is the position of max
#v1 is the min
#t2 is the position of min
#t3 is next value
.text
main:
	li $t0,0		#index i = 0
	
	li $s0,1		#8 input number
	li $s1,3
	li $s2,3
	li $s3,9
	li $s4,5
	li $s5,0
	li $s6,7
	li $s7,8
	
	add $sp,$sp,-64	#allocate memory for 8 input and their position
	sw $s0,60($sp)		#in stack
	sw $t0,56($sp)
	addi $t0,$t0,1
	sw $s1,52($sp)
	sw $t0,48($sp)
	addi $t0,$t0,1
	sw $s2,44($sp)
	sw $t0,40($sp)
	addi $t0,$t0,1
	sw $s3,36($sp)
	sw $t0,32($sp)
	addi $t0,$t0,1
	sw $s4,28($sp)
	sw $t0,24($sp)
	addi $t0,$t0,1
	sw $s5,20($sp)
	sw $t0,16($sp)
	addi $t0,$t0,1
	sw $s6,12($sp)
	sw $t0,8($sp)
	addi $t0,$t0,1
	sw $s7,4($sp)
	sw $t0,0($sp)
	addi $t0,$t0,1
	
	jal MAX
	
	nop
	
	j end_of_main

#Procedure MAX: find max-min element
MAX:
	lw $v0,4($sp)	#set the max value = s7
	lw $v1,4($sp)	#set the min value = s7
	lw $t1,0($sp)		#set the position of max = s7
	lw $t2,0($sp)		#set the position of min = s7
loop:
	addi $sp,$sp,8		#adjust stack pointer
	lw $t0,0($sp)		#i = posistion of the next element
	lw $t3,4($sp)		#next value t3
	slt $t5,$v0,$t3	#t5 = 1 if max < next element =>modify
	bne $t5,$zero,mdfymax
continue1:
	slt $t5,$t3,$v1	#t5 = 1 if next element < min =>modify
	bne $t5,$zero,mdfymin
continue2:
	beq $t0,$zero,done	#if index i =0 => done
	j loop
mdfymax:
	add $v0,$t3,$zero
	add $t1,$t0,$zero
	j continue1
mdfymin:
	add $v1,$t3,$zero
	add $t2,$t0,$zero
	j continue2
done:
	jr $ra
	
end_of_main:
	
	
	
	

	
