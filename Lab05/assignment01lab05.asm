#ASSIGNMENT 01 LAB 05
.data
test: .asciiz "Hello World" #Input the test string
.text
	li $v0,4	#4 is the printf function
	la $a0,test	#load the address of test string to a0
	syscall		#execute