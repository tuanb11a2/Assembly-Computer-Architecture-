#ASSIGNMENT 02 lab 06
# a0 is the pointer to the first element in the unsorted part
# a1 is the pointer to the last element in unsorted part
# t0 is temporary place for value of the last element
# v0 pointer to max element in unsorted part
# v1 value of max element in unsorted part
.data
A: .word -5,4,1,-6,7,9,10,0,2
Aend: .word
.text
main:
	la $a0,A 			#the address of A
	la $a1,Aend
	addi $a1,$a1,-4	#a1 = address of A[n-1]
	j max			#find max element
max:
	addi $v0,$a0,0 	#init max pointer to first element
	lw $v1,0($v0)		#init max value to first value
	addi $t0,$a0,0		#init next pointer to first
loop:
	
	beq $t0,$a1,ret     #if next=last,return
	addi $t0,$t0,4		#advance to next element
	lw $t1,0($t0)		#value of next element to $t1
	slt $t2,$t1,$v1	#t2 = 1 if next < max
	bne $t2,$zero,loop	#if next < max =>repeat
	addi $v0,$t0,0		#next element is new max element
	addi $v1,$t1,0		#next value is new max value
	j loop
ret:
	j after_max
sort:
	beq $a0,$a1,done	#every element is sorted
	j max
after_max:
	lw $t0,0($a1)		#load last element into $t0
	sw $t0,0($v0)		#copy last element to max location
	sw $v1,0($a1)		#copy max value to last element
	addi $a1,$a1,-4	#n-1 
	j sort
done:
	j after_sort
after_sort:
	li $v0,10 		#exit
	syscall
end_main:
