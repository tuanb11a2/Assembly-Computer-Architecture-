#ASSIGNMENT 2 LAB 03
# $s2 = a
# $s3 = b
.data
test: .word 1
.text
	addi $s2,$zero,1 # a = 1
	addi $s3,$zero,2 # b = 2
	la $s0,test    #load the address of test variable
	lw $s1,0($s0)  #load the value of test to $s1
	li $t0,0       #load value for test case
	li $t1,1
	li $t2,2
	beq $s1,$t0,case_0
	beq $s1,$t1,case_1
	beq $s1,$t2,case_2
	j default
case_0: addi $s2,$s2,1
	j continue
case_1: sub $s2,$s2,$t1
	j continue
case_2: add $s3,$s3,$s3
	j continue
default:
continue: