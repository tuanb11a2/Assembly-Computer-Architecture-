# Assignment 6 lab 03
.data
A: 		.word 0, 1, 2, 3, 4, 5, -27, 6, 7, 8, 9, -6, 4, -22
sizeA:	.word 14

.text
init:
	li $s1, 0			# i
	la $s2, A			# A
	la $t0, sizeA	
	lw $s3, 0($t0)		# n = sizeA
	li $t0, 0
	li $s4, 1			# step
	li $s5, 0			# max absolute value
	li $s6, -1			# value index

loop:
	slt $t8, $s1, $s3			# t8 = i < n
	beq $t8, $zero, end			# end if !t8
	add $t1, $s1, $s1			# t1 = 4 * i
	add $t1, $t1, $t1
	add $t1, $s2, $t1			# t1 = A + 4 * i
	lw $t0, 0($t1)				# t0 = A[i]
	abs $t0, $t0				# t0 = abs(t0)
	slt $t8, $s5, $t0			# t8 = max < abs(A[i])
	beq $t8, $zero, continue	# continue if !t8
	add $s5, $zero, $t0			# max = abs(A[i])
	add $s6, $zero, $s1			# index = i
continue:
	add $s1, $s1, $s4			# i += step
	j loop
	
end: