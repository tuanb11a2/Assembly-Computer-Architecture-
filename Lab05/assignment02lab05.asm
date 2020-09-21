#ASSIGNMENT 02 LAB 05
.data
Message1: .asciiz "The sum of "
Message2: .asciiz " and "
Message3: .asciiz " is "
.text
	li $s0,4  		#First number
	li $s1,5		#Second number
	add $s2,$s1,$s0		#The sum of them
	 	
	li $v0,4		
	la $a0,Message1
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,4
	la $a0,Message2
	syscall
	
	li $v0,1
	move $a0,$s1
	syscall
	
	li $v0,4
	la $a0,Message3
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	
	
	


