.data #DECLARE VARIABLE
X: .word 5
Y: .word -1
Z: .word 
.text #DECLARE INSTRUCTIONS
la $t8, X
la $t9,Y
lw $t1, 0($t8)
lw $t2, 0($t9)
#Calculate the Z = 2X + Y
add $s0, $t1, $t1
add $s0, $s0, $t2
#Store result from register to variable Z 
la $t7, Z
sw $s0,0($t7)

	