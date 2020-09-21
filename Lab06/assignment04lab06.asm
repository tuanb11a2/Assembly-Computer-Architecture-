#ASSIGNMENT 04 lab 06
# a0 is the address of array A
# a1 is the length of array A = n
#v0 is the next unsorted element 
#v1 is the value of next unsorted element
# t0 is the index i
#s0 is the index j
.data
A: .word -2,9,7,6,4
.text
main:
	la $a0,A			#address of A
	addi $a1,$zero,5	#length of the array
	addi $t0,$zero,0	#the index i
	addi $s0,$zero,0	#the index j
	j insertion_sort
shift:
	sw $s4,0($v0)
	addi $v0,$v0,-4
	addi $s0,$s0,-1	#j-1
	slt $t5,$s0,$zero	#j<0 =>t5 =1
	bne $t5,$zero,continue
	j shift_loop
insertion_sort:
	addi $a2,$a1,-2
	slt $t5,$a2,$t0	#if n<i	=>t5 = 1 => end of sort
	bne $t5,$zero,end_of_sort
	add $t1,$t0,$t0	#2i
	add $t2,$t1,$t1	#4i
	add $t3,$a0,$t2	#address of the last sorted element 
	add $v0,$t3,4		#address of the next unsorted element
	lw $v1,0($v0)		#value of the next unsorted element
shift_loop:
	add $s1,$s0,$s0	#2j
	add $s2,$s1,$s1	#4j
	add $s3,$a0,$s2	#address of A[j]
	lw $s4,0($s3)		#value of A[j]
	slt $t5,$v1,$s4	#if value of v1< A[j] => t5 =1
	bne $t5,$zero,shift
continue:
	sw $v1,0($v0)
	addi $t0,$t0,1		#i+1
	add $s0,$t0,$zero	#j =i for the next unsorted element
	j insertion_sort
end_of_sort:
end_of_main:
	

	

	
	
	
	
	

