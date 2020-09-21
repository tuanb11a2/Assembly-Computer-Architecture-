#ASSIGNMENT 2 LAB 03
# $s1 = i
# $s2 = A
# $s3 = n
# $s4 = step
# $s5 = sum
.data
	A: .word 1,2,3,4
.text
	addi $s1,$zero, -1 	# i = -1 because +1 step at the beginning
	la $s2,A	#starting addess of A
	addi $s3,$zero, 5 # n=3
	addi $s4,$zero, 1 #step = 1
	addi $s5,$zero,	0 #sum = 0
	
loop: 
	add $s1,$s1,$s4 # i = i+step
	add $t1,$s1,$s1 # $t1 = 2 * i
	add $t1,$t1,$t1 # $t1 = 4 * i
	add $t1,$t1,$s2 # $t1 = $t1 + A
	lw $t0,0($t1)	#$ $t0 = value of A[i]
	add $s5,$s5,$t0 #sum = sum + value of A[i]
	bne $s1,$s3,loop