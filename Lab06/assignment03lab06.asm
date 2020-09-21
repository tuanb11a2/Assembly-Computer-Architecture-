#ASSIGNMENT 03 lab 06
# a0 is the address of array A
# a1 is the length of array A = n
# t0 is the index i
.data
A: .word 1,3,2,5,4
.text
main:
	la $a0,A			#address of A
	addi $a1,$zero,5	#length of the array
	addi $t0,$zero,0	#the index i
	j sort
sort:
	slt $t5,$a1,$t0	#t5 =1 if i<n
	bne $t5,$zero,done_sort	#if i>n=> done sort
	add $t1,$t0,$t0	#2i
	add $t2,$t1,$t1	#4i
	add $t3,$a0,$t2	#address of A[i]
	addi $t4,$t3,4		#address of A[i+1]
	lw $a2,0($t3)		#value of A[i]
	lw $a3,0($t4)		#value of A[i+1]
	slt $t5,$a3,$a2	#if A[i+1]<A[i] => t5 =1
	bne $t5,$zero,swap	#if t5=1 => swap
loop:
	addi $t0,$t0,1		#increase index i to next pair
	addi $t6,$a1,-1	#the index of last element of array
	slt $t5,$t0,$t6	#if i < n - 1 => i+1 < n => t5 =1
	bne $t5,$zero,sort
	addi $a1,$a1,-1	#the length of unsorted part - 1
	addi $t0,$zero,0	#set the index = 0 again
	j sort
swap:
	sw $a2,0($t4)	
	sw $a3,0($t3)
	j loop
done_sort:
end_of_main:
	
	

	
	
	
