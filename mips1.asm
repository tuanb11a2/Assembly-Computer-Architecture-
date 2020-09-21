.data
x: .word 0x01020304  #variable x with initial value
mesg: .asciiz "Bo Mon Ky Thuat May Tinh"
.text
	la $a0, mesg #load address of mesg to register a0
	li $v0, 4 #assign v0 = 4
	syscall
	
	
	addi $t1, $zero , 2  #t1 = 2
	addi $t2, $zero , 3 
	add  $t0, $t1, $t2
	