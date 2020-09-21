#ASSIGNMENT 01 lab 06
# a0 is the address of array A
# a1 is the length of array A = n
# v0 is the length of max_sum sub array of A
# v1 is the max_sum value
# t0 is the index i
# a2 is the current sum
.data
A: .word 2,-1,1,3,-4
.text
main:
	la $a0,A
	addi $a1,$zero,5
	j msf
msf:
	addi $v0,$zero,0	#the length of sub-array = 0
	addi $v1,$zero,0	#the max-sum value =0
	addi $t0,$zero,0	#the index i =0
	addi $t1,$zero,0	#the current sum = 0
loop:
	add $t2,$t0,$t0	#2i
	add $t2,$t2,$t2	#4i
	add $t3,$t2,$a0     #Adress of A[i]
	lw $t4,0($t3)		#value of A[i]
	add $t1,$t1,$t4	#current sum += A[i]
	slt $t5,$v1,$t1	#t5 = 1 if max_sum<current_sum => modify
	bne $t5,$zero,mdfy
	j test
mdfy:
	addi $v0,$v0,1		#add sub_array length +1
	add $v1,$zero,$t1	#max_sum = new_sum
test:
	add $t0,$t0,1		#i=i+1
	slt $t5,$t0,$a1	#t5 =1 if i<n-> repeat
	bne $t5,$zero,loop
done: j continue
continue:
lock:
	nop
end_of_main:
	
	
	
	
	