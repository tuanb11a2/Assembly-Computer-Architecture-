#Assignment 1 lab 09
.eqv SEVENSEG_LEFT 0xFFFF0011		#Dia chi cua den led 7 ben trai
							#Bit 0 = doan a
							#Bit 1 = doan b
							#...
							#Bit 7 = dau .
.eqv SEVENSEG_RIGHT 0xFFFF0010	#Dia chi cua den led 7 ben phai

.text
main:
	li $a0,0x1		#set value for segments
	jal SHOW_7SEG_LEFT	#show
	li $a0,0x1F		#set value for segments
	jal SHOW_7SEG_RIGHT	#show
	nop
exit:
	li $v0,10
	syscall
#-----------------------------------------------------
#Function: SHOW_7SEG_LEFT: show the 7-seg left led
#param in: $a0 = value
#remark $t0 changed
#-----------------------------------------------------
SHOW_7SEG_LEFT:
	li $t0,SEVENSEG_LEFT	#address of left led
	sb $a0,0($t0)			#store value
	nop
	jr $ra
	nop
#-----------------------------------------------------
SHOW_7SEG_RIGHT:
	li $t0,SEVENSEG_RIGHT
	sb $a0,0($t0)
	nop
	jr $ra
#-----------------------------------------------------
	