#ASSIGNMENT 1 LAB 03
#$t1=x
#$t2=y
#$t3 = z
#$s1 = i
#$s2 = j
.text
	# i = 0, j = 1 => i<j
	addi $s1,$zero,0
	addi $s2,$zero,1 
	start:
		slt $t0,$s2,$s1 # j<i
		bne $t0,$zero,else #go to else if $t0 = 1 means j<i if not $t0 = 0 
		addi $t1,$t1,1 #$t1 = $t1 + 1 = 1
		addi $t3,$zero,1 # z = 1
		j endif		#jump to endif, skip else part
	else:			#$t0 = 1 means j<i
		addi $t2,$t2,-1
		add $t3,$t3,$t3
	endif: