.data 
fmessage1:  	 .asciiz "Please choose the operation:-\n 1-Quick Sort\n 2-Insertion Sort\n 3-Merge Sort\n 4-Exit\n"
smessage2:  	 .asciiz "\nDo you want to search in your array ?\n 1-YES.\n 2-NO.\n"
errmsg: 	  	 .asciiz "ERROR\n"
message3:   	 .asciiz  "How many elements are you want to enter : \n"
testmsg2:   	 .asciiz "SS"
arr_sort:   	 .word 1024
prompt:	  	 .asciiz "Enter Elements for Sorting :- "
Element:    	 .asciiz "Element "
colon:	  	 .asciiz " : "
nxtline:  	 .asciiz "\n"
spacing: 	 	 .asciiz " "
Input: 	 	 .asciiz "Sorted Array  : "
num_search: 	 .asciiz "\nEnter the Element to be searched: "
found: 	  	 .asciiz "\nSearch Element  Found at Position : "
not_found: 	 .asciiz "\nSearch Element  NOT Found ."
Sorted_Array:	 .asciiz	"Sorted Array: ["
Space:		 .asciiz	", "
Bracket:		 .asciiz	"]"
c: 		 .word 0:100
	
.text 
.globl main 
 main:
	li $v0, 4
	la $a0, fmessage1		 #printing the first message
	syscall 
	
	li $v0 , 5 		 #Get the number of operation from the user
	syscall 
	move $s4 , $v0 		 #moving the number of operation to $s1

	c1_cond:  beq $s4,1,c1_body     #if user enter 1 the program is going to Quick Sort	
		 	
	c2_cond:  beq $s4,2,c2_body	 #if user enter 2 the program is going to Insertion Sort
	
	c3_cond:	beq $s4,3,c3_body	 #if user enter 3 the program is going to Merge Sort
	
	c4_cond:	beq $s4,4,Exit	 #if user enter 4 the program is going to exit
	
	defualt:
		li $v0 , 4
		la $a0 , errmsg
		syscall 	
		jal Exit
	c1_body:
		jal Gomma 
		jal exit_case1
	c2_body:
		jal bob
		jal exit_case1
	c3_body:
		jal bob
		jal exit_case1
	c4_body:
		jal Exit
	
	exit_case1:
	
	li $v0, 4
	la $a0, smessage2		 #printing the Secand message 
	syscall 
	
	li $v0 , 5 		 #Asking the user to do search or not 
	syscall
	
	move $s2 , $v0			 #moving the number of operation to $s2
	case5:	beq $s2,1,azza 	 #if user enter 1 the program is going to search in the sorted numbers
	case6:	beq $s2,2,Exit 	 #if user enter 2 the program is going to exit
	defualt1:
	li $v0 , 4
	la $a0 , errmsg
	syscall
	bge  $s2,2,Exit
	exit_case2:
	
	Exit:
 li $v0, 10                  # Terminate program run and
 syscall					# Exit
 

	#########################
	Gomma: #Quick Sort
	#######################
	li $v0 , 4
 	la $a0 , message3  		# show first message ask about number of elements
	syscall 
	
	li $v0 , 5
	syscall
	
	move $t5 , $v0
	mul $t6,$t5,4

 	add $t0,$t0,$t6
 	addi $t4,$t4,90
 	addi $t9,$t9,1 
 	
 	li $v0, 4
	la $a0, prompt
	syscall 

	li $v0, 4
	la $a0, nxtline 
	syscall 	
input:
	beq $t1,$t0,continue
	li $v0,4
	la $a0 , Element
	syscall 
	
	move $a0,$t9	
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, colon 
	syscall
	
	li $v0,5
	syscall 
	move $t2,$v0
	
	sw $t2 ,arr_sort($t1)
	addi $t1,$t1,4
	addi $t9,$t9,1
	j input
continue:
	move $t1,$zero
	move $t2,$zero
	addi $t2, $t2, 4
	move $s0,$zero
	addi $s0,$s0,1
	
sort:
	beq $t3,$t4,calculation
	beq $t2,$t0,continue
	
	lw $t5, arr_sort($t1)
	lw $t6, arr_sort($t2)
	
	addi $t3,$t3,1
	
	slt $t7,$t6,$t5
	beq $t7,$s0,swap
	
	addi $t1,$t1,4
	addi $t2,$t2,4
	
	j sort
	
swap:
	sw $t5,arr_sort($t2)
	sw $t6,arr_sort($t1)
	
	addi $t1,$t1,4 
	addi $t2,$t2,4
	
	j sort	
	
calculation:
	move $t1,$zero
	move $t2,$zero
	move $t3,$zero
	move $t4,$zero
	addi $t4,$t4,36
	move $t5,$zero
	move $t6,$zero
	move $t7,$zero
	
output:
	li $v0, 4
	la $a0, nxtline 
	syscall 
	
	lw $t5, arr_sort($t3)
	lw $t6, arr_sort($t4)
	
	li $v0,4
	la $a0,Input
	syscall
element:
	beq $t7,$t0,next
	lw   $t8, arr_sort($t7)
	addi $t7,$t7, 4
	
	move $a0,$t8
	li $v0,1
	syscall
	
	beq $t7,$t0,element
	
	li $v0,4
	la $a0, spacing
	syscall
	
	j element
	
next: 
	li $v0,4
	la $a0, nxtline
	syscall
	
jr $ra
	jal exit_case1
		
	
	bob: #Merge Sort
	################
	li $v0 , 4
 	la $a0 , message3  		# show first message ask about number of elements
	syscall 
	
	li $v0 , 5
	syscall
	
	move $t5 , $v0
	mul $t6,$t5,4

 	add $t0,$t0,$t6
 	addi $t4,$t4,90
 	addi $t9,$t9,1 
 	
 	li $v0, 4
	la $a0, prompt
	syscall 

	li $v0, 4
	la $a0, nxtline 
	syscall 
input_1:
	beq $t1,$t0,continue
	
	li $v0,4
	la $a0 , Element
	syscall 
	
	move $a0,$t9	
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, colon 
	syscall
	
	li $v0,5
	syscall 
	move $t2,$v0
	
	sw $t2 ,arr_sort($t1)
	addi $t1,$t1,4
	addi $t9,$t9,1
	j input
	
continue_1:
	move $t1,$zero
	move $t2,$zero
	addi $t2, $t2, 4
	move $s0,$zero
	addi $s0,$s0,1
element_1:
	beq $t7,$t0,next
	lw $t8, arr_sort($t7)
	addi $t7,$t7, 4
	
	move $a0,$t8
	li $v0,1
	syscall
	
	beq $t7,$t0,element
	
	li $v0,4
	la $a0, spacing
	syscall
	
	j element
	
next_1: 
	li $v0,4
	la $a0, nxtline
	syscall
	
	la $a0, arr_sort		# load address of array to $a0 as an argument
	addi $a1, $zero, 0 		# $a1 = low
	subi $t4,$t5,1	
	add $a2, $zero,$t4
	jal Mergesort		# Go to MergeSort 
	la  $a0, Sorted_Array	# Print prompt: "Sorted Array: ["
	li  $v0, 4		# MIPS call for printing prompts
	syscall     		
	jal Print		# Go to Print to print the sorted array
	la  $a0, Bracket	# Prints the closing bracket for the array
	li  $v0, 4		# MIPS call for printing prompts
	syscall
	li  $v0, 10		# Done!
	syscall
	
Mergesort: 
	slt $t0, $a1, $a2 	# if low < high then $t0 = 1 else $t0 = 0  
	beq $t0, $zero, Return	# if $t0 = 0, go to Return
	
	addi, $sp, $sp, -16 	# Make space on stack for 4 items
	sw, $ra, 12($sp)	# save return address
	sw, $a1, 8($sp)	       	# save value of low in $a1
	sw, $a2, 4($sp)        	# save value of high in $a2

	add $s0, $a1, $a2	# mid = low + high
	sra $s0, $s0, 1		# mid = (low + high) / 2
	sw $s0, 0($sp) 		# save value of mid in $s0
				
	add $a2, $s0, $zero 	# make high = mid to sort the first half of array
	jal Mergesort		# recursive call to MergeSort
	
	lw $s0, 0($sp)		# load value of mid that's saved in stack 
	addi $s1, $s0, 1	# store value of mid + 1 in $s1
	add $a1, $s1, $zero 	# make low = mid + 1 to sort the second half of array
	lw $a2, 4($sp) 		# load value of high that's saved in stack
	jal Mergesort 		# recursive call to MergeSort
	
	lw, $a1, 8($sp) 	# load value of low that's saved in stack
	lw, $a2, 4($sp)  	# load value of high that's saved in stack
	lw, $a3, 0($sp) 	# load value of mid that's saved in stack and pass it to $a3 as an argument for Merge
	jal Merge		# Go to Merge 	
				
	lw $ra, 12($sp)		# restore $ra from the stack
	addi $sp, $sp, 16 	# restore stack pointer
	jr  $ra

Return:
	jr $ra 			# return to calling routine
	
Merge:
	add  $s0, $a1, $zero 	# $s0 = i; i = low
	add  $s1, $a1, $zero 	# $s1 = k; k = low
	addi $s2, $a3, 1  	# $s2 = j; j = mid + 1

While1: 
	blt  $a3,  $s0, While2	# if mid < i then go to next While loop
	blt  $a2,  $s2, While2	# if high < j then go to next While loop
	j  If			# if i <= mid && j <=high
	
If:
	sll  $t0, $s0, 2	# $t0 = i*4
	add  $t0, $t0, $a0	# add offset to the address of a[0]; now $t2 = address of a[i]
	lw   $t1, 0($t0)	# load the value at a[i] into $t1
	sll  $t2, $s2, 2	# $t1 = j*4
	add  $t2, $t2, $a0	# add offset to the address of a[0]; now $t2 = address of a[j]
	lw   $t3, 0($t2)	# load the value of a[j] into $t3	
	blt  $t3, $t1, Else	# if a[j] < a[i], go to Else
	la   $t4, c		# Get start address of c
	sll  $t5, $s1, 2	# k*4
	add  $t4, $t4, $t5	# $t4 = c[k]; $t4 is address of c[k]
	sw   $t1, 0($t4)	# c[k] = a[i]
	addi $s1, $s1, 1	# k++
	addi $s0, $s0, 1	# i++
	j    While1		# Go to next iteration
	
Else:
	sll  $t2, $s2, 2	# $t1 = j*4
	add  $t2, $t2, $a0	# add offset to the address of a[0]; now $t2 = address of a[j]
	lw   $t3, 0($t2)	# $t3 = whatever is in a[j]	
	la   $t4, c		# Get start address of c
	sll  $t5, $s1, 2	# k*4
	add  $t4, $t4, $t5	# $t4 = c[k]; $t4 is address of c[k]
	sw   $t3, 0($t4)	# c[k] = a[j]
	addi $s1, $s1, 1	# k++
	addi $s2, $s2, 1	# j++
	j    While1		# Go to next iteration
	
While2:
	blt  $a3, $s0, While3 	# if mid < i
	sll $t0, $s0, 2		# # $t6 = i*4
	add $t0, $a0, $t0	# add offset to the address of a[0]; now $t6 = address of a[i]
	lw $t1, 0($t0)		# load value of a[i] into $t7
	la  $t2, c		# Get start address of c
	sll $t3, $s1, 2         # k*4
	add $t3, $t3, $t2	# $t5 = c[k]; $t4 is address of c[k]
	sw $t1, 0($t3) 		# saving $t7 (value of a[i]) into address of $t5, which is c[k]
	addi $s1, $s1, 1   	# k++
	addi $s0, $s0, 1   	# i++
	j While2		# Go to next iteration
	

While3:
	blt  $a2,  $s1, For_Initializer	#if high < j then go to For loop
	sll $t2, $s2, 2    	# $t6 = j*4
	add $t2, $t2, $a0  	# add offset to the address of a[0]; now $t6 = address of a[j]
	lw $t3, 0($t2)     	# $t7 = value in a[j]
	
	la  $t4, c		# Get start address of c
	sll $t5, $s1, 2	   	# k*4
	add $t4, $t4, $t5  	# $t5 = c[k]; $t4 is address of c[k]
	sw $t3, 0($t4)     	# $t4 = c[k]; $t4 is address of c[k]
	addi $s1, $s1, 1   	# k++
	addi $s2, $s2, 1   	# j++
	j While3		# Go to next iteration

For_Initializer:
	add  $t0, $a1, $zero	# initialize $s5 to low for For loop
	addi $t1, $a2, 1 	# initialize $t3 to high+1 for For loop
	la   $t4, c		# load the address of array c into $s7	
	j    For
For:
	slt $t7, $t0, $t1  	# $t4 = 1 if $s5 < $s2
	beq $t7, $zero, sortEnd	# if $t4 = 0, go to sortEnd
	sll $t2, $t0, 2   	# $s5 * 4 to get the offset
	add $t3, $t2, $a0	# add the offset to the address of a => a[$t7]
	add $t5, $t2, $t4	# add the offset to the address of c => c[$t5]
	lw  $t6, 0($t5)		# loads value of c[i] into $t6
	sw $t6, 0($t3)   	# save the value at c[$t0] to a[$t0]; a[i] = c[i]
	addi $t0, $t0, 1 	# increment $t0 by 1 for the i++ part of For loop
	j For 			# Go to next iteration

sortEnd:
	jr $ra			# return to calling routine		
Print:
	add $t0, $a1, $zero 	# initialize $t0 to low
	add $t1, $a2, $zero	# initialize $t1 to high
	la  $t4, arr_sort		# load the address of the array into $t4
	
Print_Loop:
	blt  $t1, $t0, Exit_1	# if $t1 < $t0, go to exit
	sll  $t3, $t0, 2	# $t0 * 4 to get the offset
	add  $t3, $t3, $t4	# add the offset to the address of array to get array[$t3]
	lw   $t2, 0($t3)	# load the value at array[$t0] to $t2
	move $a0, $t2		# move the value to $a0 for printing
	li   $v0, 1		# the MIPS call for printing the numbers
	syscall
	
	addi $t0, $t0, 1	# increment $t0 by 1 for the loop 
	la   $a0, Space		# prints a comma and space between the numbers
	li   $v0, 4		# MIPS call to print a prompt
	syscall
	j    Print_Loop		# Go to next iteration of the loop
	
Exit_1:
	jr $ra			# jump to the address in $ra; Go back to main
	
	#############
	
	
	
	azza: #Binary Search ######
	li $v0, 4
	la $a0, num_search
	syscall
	li $v0, 5
	syscall

	addi $a3, $v0, 0
	#a0 array
	la $a0, arr_sort
	#a1=low
	addi $a1, $zero, 0
	#a2=high
	addi $a2, $t0, -1
	#function call
	jal binary_search
	#back to the main from funtion
	addi $t7, $zero, -1
	beq $v1, $t7, nott
	li $v0, 4
	la $a0, found
	syscall
	li $v0, 1
	addi $a0, $v1, 0
	syscall
	li $v0, 10
	syscall
 nott:
	li $v0, 4
	la $a0, not_found
	syscall
	
	jal exit_case2

#Function
	
	binary_search:
	#$s2=mid
	la $a0, arr_sort
	addi $s2, $zero, 0
	slt $t1, $a2, $a1
	beq $t1, $zero, if1
	addi $v1, $zero, -1
	jr $ra
	if1:
	add $s2, $a2, $a1
	#t9=2 so that i could divide mid with by 2
	addi $t9, $zero, 2
	div $s2, $t9
	mflo $s2 
	mflo $s3
	mul $s3, $s3, 4 
	add $a0, $a0, $s3
	lw $s4, 0($a0)
	bne $s4, $a3, if2
	addi $v1, $s2, 1
	jr $ra 
	if2:
	slt $t5, $a3, $s4
	beq $t5, $zero, else
	addi $a2, $s2, -1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal binary_search

	j exit
else:
	addi $a1, $s2, 1
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal binary_search
	j exit
	exit:
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

	
	
