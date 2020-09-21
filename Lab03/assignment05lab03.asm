# Assignment 5 lab 03
.data
A: .word 0, 1, 2, 3, 4, 5, 6

.text
	addi $s1,$zero, -1		# i = -1
	la $s2, A			# A
	addi $s3,$zero, 7		# n = 7
	addi $s4,$zero, 1		#step = 1
	addi $s5,$zero, 0		# sum = 0		

loop:
	add $s1, $s1, $s4		# i += step
	add $t1, $s1, $s1		# t1 = 4 * i
	add $t1, $t1, $t1
	add $t1, $s2, $t1		# t1 = A + 4 * i
	lw $t0, 0($t1)			# t0 = A[i]
	add $s5, $s5, $t0		# sum += A[i]

	j check_a
	
check_o:
	# loop if i != n
	bne $s1, $s3, loop
	j end
check_a:
	# loop if i < n
	slt $t8, $s1, $s3		# t8 = i < n
	bne $t8, $zero, loop	# loop if t8
	j end
check_b:
	# loop if i <= n
	slt $t8, $s3, $s1		# t8 = i > n
	beq $t8, $zero, loop	# loop if !t8
	j end
check_c:
	# loop if sum >= 0
	slt $t8, $s5, $zero		# t8 = sum < 0
	beq $t8, $zero, loop	# loop if !t8
	j end
check_d:
	# loop if A[i] == 0
	beq $t0, $zero, loop	# loop if A[i] == 0
	j end

end:
