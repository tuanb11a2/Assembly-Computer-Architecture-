#ASSIGNMENT 02 lab 04
.text
start:
	li $s0,0x0563
	j partd
parta:
	andi $t0,$s0,0xf00
	j EXIT
partb:
	andi $t0,$s0,0xff0
	j EXIT
partc:
	ori $t0,$s0,0xff
	j EXIT
partd:
	andi $s0,$s0,0x000
EXIT: