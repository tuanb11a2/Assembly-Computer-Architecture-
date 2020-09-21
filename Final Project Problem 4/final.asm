# Assignment 4 Final Project - Le Anh Tuan -20184322

#------------------------------------------------------------------------------
#DEFINE for MarBots
#------------------------------------------------------------------------------
.eqv HEADING		0xffff8010 # int	: An angle between 0 and 359
.eqv MOVING		0xffff8050 # bool	: Whether or not to move 
.eqv LEAVETRACK	0xffff8020 # bool	: (0 or non-0) whether or not to leave a track 
.eqv WHEREX		0xffff8030 # int	: Current x-location of MarsBot 
.eqv WHEREY		0xffff8040 # int	: Current y-location of MarsBot 
#------------------------------------------------------------------------------
#DEFINE for Digital Lab Sim
#------------------------------------------------------------------------------
.eqv IN_ADRESS_HEXA_KEYBOARD 0xFFFF0012	#input address of lab sim
.eqv OUT_ADRESS_HEXA_KEYBOARD 0xFFFF0014 #output address of lab sim

#Scripts 1 is DCE
#Scripts 2 is VN with star shape
#Scripts 3 is some random pattern that i want to draw
.data
Scripts1: .word 115,3000,1,145,3000,1,155,3000,1,180,3000,1,205,3000,1,215,3000,1,245,3000,1,0,16000,1,90,14000,0,245,5000,1,200,7000,1,160,7000,1,115,5000,1,90,3000,0,90,5000,1,270,5020,0,0,8000,1,90,5000,1,270,5020,0,0,8000,1,90,5000,1
Scripts2:	.word 90,2000,0,162,8000,1,306,8000,1,90,8000,1,234,8000,1,18,8000,1,90,5000,0,162,8000,1,18,8000,1,90,2000,0,180,8000,1,0,8000,0,162,8300,1,0,8000,1
Scripts3:	.word 180,2500,1,45,3500,1,135,3500,1,45,3500,1,135,3500,1,0,2500,1,270,10000,1,135,3500,1,45,3500,1,135,3500,1,45,3500,1,180,2500,0,270,10000,1,0,2500,0
.text 
main:
	jal untrack				# go to middle without drawing										
	nop
go_middle:			
	li $a0,135				# rotate 135 and run to go to middle
	jal rotate
	nop
	jal go
	nop

sleep_go_middle: 
	li $v0, 32				# keep running by sleeping in 3000 ms 
	li $a0, 3000 
	syscall
	nop
	jal stop			#stop the first line to wait for the input scripts
	jal untrack		# keep old track
	nop				
	jal track			# draw new track 
	nop
	
	jal check_digital_input		#check input function

draw_by_postscipts:
	beq $t5,0,end_main			#if t5 = 0=>done
	lw $s1,0($s0)				#s1 = the angle of movement
	lw $s2,4($s0)				#s2 = time interval of movement
	lw $s3,8($s0)				#s3 = track condition:untrack or track
	beq $s3,0,untrack_condition	#check if track or not
	jal track
	nop
	j go_next
untrack_condition:
	jal untrack
	nop
go_next:
	addi $a0,$s1,0				#a0 = s1 for next procedure			
	jal rotate				#rotate at corner of a0
	nop
	jal go
	nop	
sleep: 
	li $v0, 32				# keep running by sleeping in t1 time interval
	add $a0,$s2,$zero
	syscall
	
	jal stop
	nop
	jal untrack				# keep old track
	nop
	jal track					# draw new track 
	nop
	
check_condition:
	add $s0,$s0,12				#ready for next drawing
	addi $t5,$t5,-1
	j draw_by_postscipts
	
end_main:

	jal stop
	nop
	li $v0, 10 
	syscall


#------------------------------------------------------------------------------
# Function			check_digital_input
# @brief			Check which button is pressed and choose the corresponding
#				postscripts for the MarBot
# @parameter		$s0 :hold the address of choosen postscripts
#				$t1 :input address
#				$a0 :value of output
#				$t2 :output address
#				$t3 :number of row 			
#				$t5 :number of step of that postscripts 			
#------------------------------------------------------------------------------
check_digital_input:
	li $t1, IN_ADRESS_HEXA_KEYBOARD
	li $t2, OUT_ADRESS_HEXA_KEYBOARD
	
	li $t3, 0x01		#First row 0,1,2,3
	sb $t3, 0($t1) 	# must reassign expected row
	lb $a0, 0($t2) 	# read scan code of key button
	beq $a0,0x11,choose_zero

	li $t3, 0x02		#Second row 4,5,6,7
	sb $t3, 0($t1) 	# must reassign expected row
	lb $a0, 0($t2) 	# read scan code of key button
	beq $a0,0x12,choose_four

	li $t3, 0x04		#Third row 8,9,a,b
	sb $t3, 0($t1) 	# must reassign expected row
	lb $a0, 0($t2) 	# read scan code of key button
	
	beq $a0,0x14,choose_eight
	
	li $v0, 32 
	li $a0, 100 		# sleep 100ms
	syscall
	nop
	
	j check_digital_input
	
choose_zero:
	la $s0,Scripts1
	li $t5,21
	j end_check_digital_input
choose_four:
	la $s0,Scripts2
	li $t5,14
	j end_check_digital_input
choose_eight:
	la $s0,Scripts3
	li $t5,14
end_check_digital_input:
	jr $ra
#------------------------------------------------------------------------------
# Function			go
# @brief			Change state to move			
#------------------------------------------------------------------------------
go:
	li $t0, MOVING
	li $t1, 1
	sb $t1, 0($t0)
	jr $ra 
# End of go -------------------------------------------------------------------
#------------------------------------------------------------------------------
# Function			stop
# @brief			Change state to stop			
#------------------------------------------------------------------------------
stop:
	li $t0, MOVING
	li $t1, 0
	sb $t1, 0($t0)
	jr $ra 
# End of stop -----------------------------------------------------------------	
#------------------------------------------------------------------------------
# Function			track
# @brief			Enable tracking			
#------------------------------------------------------------------------------
track:
	li $t0, LEAVETRACK
	li $t1, 1
	sb $t1, 0($t0)
	jr $ra
# End of track ----------------------------------------------------------------
#------------------------------------------------------------------------------
# Function			untrack
# @brief			Disable tracking			
#------------------------------------------------------------------------------
untrack:
	li $t0, LEAVETRACK
	li $t1, 0
	sb $t1, 0($t0)
	jr $ra
# End of untrack --------------------------------------------------------------
#------------------------------------------------------------------------------
# Function			rotate
# @brief			Rotate
#
# @param[in]	a0	Rotate angle (0-359)			
#------------------------------------------------------------------------------
rotate:	
	li $t0, HEADING
	sw $a0, 0($t0)	
	jr $ra
# End of rotate ---------------------------------------------------------------
#--------------------------------------------------------
# ktext for external interrupts error by using Digital LabSim
#--------------------------------------------------------
.ktext 0x80000180
#--------------------------------------------------------
#Processing
#--------------------------------------------------------
get_cod:
	li $t1, IN_ADRESS_HEXA_KEYBOARD
	li $t3, 0x28 # check row 4 and re-enable bit 7
	sb $t3, 0($t1) # must reassign expected row
	li $t1, OUT_ADRESS_HEXA_KEYBOARD
	lb $a0, 0($t1)
prn_cod:
	li $v0,34 
	syscall
next_pc:
	mfc0 $at, $14 # $at <= Coproc0.$14 = Coproc0.epc
	addi $at, $at, 4 # $at = $at + 4 (next instruction)
	mtc0 $at, $14 # Coproc0.$14 = Coproc0.epc <= $at
return: 
	eret # Return from exception
