#Assignment 4 lab2
.text
	#Assign X, Y
	addi $t1,$zero,5
	addi $t2,$zero,-1
	#Expression Z = 2X + Y
	add $s0, $t1, $t1
	add $s0,$s0,$t2