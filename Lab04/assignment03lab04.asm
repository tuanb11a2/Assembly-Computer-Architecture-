#ASSIGNMENT 03 lab 04
.text
start:	
	addi $s1,$zero,-5
	j partd
parta:
	bltz $s1,NEGATIVE
	add $s0,$zero,$s1
partb:
	add $s0,$zero,$s1
	or $s1,$s1,$s1
	j EXIT
partc:
	nor $s1,$zero,$s1
	j EXIT
partd:
	addi $s0,$zero,1
	slt $at, $s1, $s0
	beq $at, $zero, L
NEGATIVE:
	sub $s0,$zero,$t2
	j EXIT
L:
	addi $s2,$zero,3 #CHECK if partd can jump to here
EXIT: