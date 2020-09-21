#ASSIGNMENT 05 lab 05
.data
input_string: 	.space 20
reverse_string: .space 20
Message1:	.asciiz "Nhap xau:"
Message2: 	.asciiz "Chuoi dao nguoc: "
.text
main:
	la $a3,reverse_string
get_string:
	li $v0, 8   
	la $a0, input_string    
	la $a1, 20    
	syscall
get_length:
	la $a0,input_string	#a0 = Address(string[0])
	addi $v0,$zero,-1  #v0 = length = -1 because at the end of string there always have \n
	xor $t0,$zero,$zero  #t0= i = 0
check_char:
	add $t1,$a0,$t0		#t1 = address(string[0] + i)
	lb $t2,0($t1)		#t2= string[i]
	beq $t2,$zero,end_of_str  #Is null char?
	addi $v0,$v0,1		#v0 = v0 + 1->length + 1
	addi $t0,$t0,1		#i = i+1
	j check_char
end_of_str:
end_of_get_length:
	move $s0,$v0
	xor $t0,$zero,$zero
reverse_string_function:
	add $t1,$a0,$t0		#t1 = address(string[0]+i)
	lb $t2,0($t1)		#t2 = value of string[0]+i
	sub $t4,$s0,$t0		#t4 = s0 - v0
	addi $t4,$t4,-1		#since the first char of the string is at position 0
	add $t3,$a3,$t4 		#t3 = address(string[0]+s0-i-1)
	sb $t2,0($t3)		#load value of t2
	beq $t0,$s0,output	#the last character of string?
	addi $t0,$t0,1
	j reverse_string_function
output:
	li $v0,59
	la $a0,Message2
	la $a1,reverse_string
	syscall
