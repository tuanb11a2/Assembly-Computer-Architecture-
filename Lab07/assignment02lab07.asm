#Assignment 02 lab 07
.text
main:
	li $a0,3	#load test input
	li $a1,9
	li $a2,2
	jal max		#call max procedure
	nop
	j endmain
max:
	add $v0,$a0,$zero #copy (a0) in v0;largest so far
	sub $t0,$a1,$v0   # t0 = a1- max
	bltz $t0,continue	
	nop
	add $v0,$a1,$zero #a1>a0 => change the max to a1
continue:
	sub $t0,$a2,$v0   #t0 = a2 - max
	bltz $t0,done
	nop
	add $v0,$a2,$zero #max = a2 if a2> max
done:
	jr $ra	#done procedure and v0 has max value from 3 input
endmain:
