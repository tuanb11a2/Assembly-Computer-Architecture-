.text 
	addi $t1, $zero, 1234566
	addi $t2,$zero , 5431266
	mul $s0,$t1,$t2
	mul $s0, $s0, 3
	
	mflo $s1
	mfhi $s2
	
	