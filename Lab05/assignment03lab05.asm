#ASSIGNMENT 03 LAB 05
.data
x: .space 1000
y: .space 1000
Message: .asciiz "Nhap 1 chuoi:"
.text
start:			#Get an input string and read it to a1
	li $v0, 54    
	la $a0, Message    
	la $a1, y    
	la $a2, 1000    
	syscall 
	
strcpy:
	add $s0,$zero,$zero    #s0 = i = 0
	la $a0,x
	la $a1,y
L1:
	add $t1,$s0,$a1		#t1 = s0 + a1 = i + y[0]
				# = address of y[i]
	lb $t2,0($t1)		#t2 = value of t1 = y[i]
	add $t3,$s0,$a0		#t3 = s0 + a0 = i + x[0]
				#   = address of x[i]
	sb $t2,0($t3)		#x[i]= t2 = y[i]
	beq $t2,$zero,end_of_strcpy  #if y[i]==0,exit
	nop
	addi $s0,$s0,1        #s0 = s0 + 1 <-> i = i + 1
	j L1			#next character
	nop
end_of_strcpy:		
