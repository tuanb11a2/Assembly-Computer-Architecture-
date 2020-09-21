#Assignment 4 lab 03 
#$t1=x
#$t2=y
#$t3 = z
#$s1 = i
#$s2 = j
.text
	addi $s1,$zero,0 # i = 0
	addi $s2,$zero,1 # j = 1
	addi $t1,$zero,0 # z = 0
	addi $t2,$zero,2 # y = 2
	addi $t3,$zero,3 # z = 3
	start:
		j compare_a
	compare_a:
		#if i< j 
		slt $t0,$s1,$s2 # i< j => $t0 = 1
		beq $t0,$zero,else #go to else if $t0 = 1 means i<j
		j then 
	compare_b:
		#if i>=j
		slt $t0,$s1,$s2 # i< j => $t0 = 1
		bne $t0,$zero,else #go to else if $t0 = 0 means i>=j
		j then
	compare_c:
		#if i + j <= 0
		add $t4,$s1,$s2 # $t4 = i + j
		slt $t0,$zero,$t4 #$t0 = 0 if i+ j <=0
		bne $t0,$zero,else #go to else if $t0 = 0 means i+j<=0
		j then	
	compare_d:
		#if i + j > m + n
		add $t4,$s1,$s2 # $t4 = i + j
		add $t5,$s3,$s4 # $t5 = m + n
		slt $t0,$t5,$t4 
		beq $t0,$zero,else
		j then
	else:			
		addi $t2,$t2,-1 #y = y-1
		add $t3,$t3,$t3 #z= 2* z
		j endif
	then:
		addi $t1,$t1,1 	#x = x + 1
		addi $t3,$zero,1 # z = 1
	endif: