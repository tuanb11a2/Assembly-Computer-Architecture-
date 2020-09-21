#Assignment 1 lab2
.text
	addi $s0, $zero, 0x211003d  #I-type instruction
	add $s0, $zero, $0  	 #R-type instruction
	
#Assignment2 lab2
	lui $s0, 0x2110		#put upper half of pattern in $s0
	ori $s0,$s0,0x003d	#put lower half of pattern in $s0
	       
#assignment 3 lab2
	li $s0,0x2110003d #pseudo instruction = 2 basic instructions
	li $s1,0x2 #but if the immediate value is small, one ins
#Assignment 4 lab2
	#Assign X, Y
	addi $t1,$zero,5
	addi $t2,$zero,-1
	#Expression Z = 2X + Y
	add $s0, $t1, $t1
	add $s0,$s0,$t2