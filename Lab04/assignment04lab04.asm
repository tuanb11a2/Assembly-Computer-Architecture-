#ASSIGNMENT 04 lab 04
.text
start:
	addi $s1,$zero,-2
	addi $s2,$zero,-1
	li $t0,0		#No Overflow is default status
	addu $s3,$s1,$s2	#s3 = s1 + s2
	xor $t1,$s1,$s3		#Test if $s1 and $s3 have the same sign
	
	bltz $t1,OVERFLOW #if s1 and s3 are not have the same sign then jump overflow
	j EXIT 
OVERFLOW:
	li $t0,1		#the result is overflow
EXIT: