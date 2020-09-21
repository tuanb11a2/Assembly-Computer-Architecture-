#HOME ASSIGNMENT 2 LAB 03
.text
loop: 
	add $s1,$s1,$s4
	add $t1,$s1,$s1
	add $t1,$t1,$t1
	add $t1,$t1,$s2
	lw $t0,0($t1)
	add $s5,$s5,$t0
	bne $s1,$s3,loop
