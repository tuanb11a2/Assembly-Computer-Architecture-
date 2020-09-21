#Assignment 03 lab 07
.text
main:
	li $s0,1
	li $s1,2
push:
	addi $sp,$sp,-8	#adjust the stack pointer
	sw $s0,4($sp)		#push the $s0 to stack
	sw $s1,0($sp)		#push the $s1 to stack
work:
	nop
	nop
	nop
pop:
	lw $s0,0($sp)		#pop from stack to s0
	lw $s1,4($sp)		#pop from stack to s1
	addi $sp,$sp,8		#adjust the stack pointer
	
