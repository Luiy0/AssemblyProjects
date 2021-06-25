##########################################################################################
# dotproduct.asm
# By Luis A. Flores (841-10-2500)
# Programa que calcula el producto punto de dos vectores del mismo tamaño 
#
# Register use:
# $t0 - counter
# $t1 - length
# $t2 - vectorA
# $t3 - vectorB
# $t5 - current element in vectorA
# $t6 - current element in vectorB
# $t9 - acummulator
# $v0 - system call code
# $a0 - system call argument
######################################## DATA #############################################
.data
prompt1:	.asciiz "Enter the length of the vectors: "
prompt2:	.asciiz "Enter an element: "
msgA:		.asciiz "\nReading vector A...\n"
msgB:		.asciiz "\nReading vector B...\n"
dotmsg:		.asciiz "\nThe dot product of A and B is: "
errormsg:	.asciiz "\nInvalid length.\n"
vectorA:	.space 40	# reserve space for 10 integers
vectorB:	.space 40	# reserve space for 10 integers
######################################## CODE ##############################################
.text
.globl main 
	  
main:	li $v0, 4    			# code for printing string
	la $a0, prompt1			# load string base address
	syscall				# print prompt1 message
	    
	li $v0, 5   			# code for reading an integer
	syscall	  	  		# read integer
	move $t1, $v0			# copy the length to $t1
	
	bltz $t1, error			# branch if $t1 is less than zero
	bgt $t1, 10, error		# branch if $t1 is greater than 10
		
	li $v0, 4    			# code for printing string
	la $a0, msgA			# load string base address
	syscall				# print msgA message
	
	li $t0, 0			# counter initialized to 0
	la $t2, vectorA			# load vectorA to register $t2
	
array1:	beq $t0, $t1, next		# branch if counter($t0) equals length($t1)
	
	li $v0, 4    			# code for printing a string
	la $a0, prompt2			# load string base address
	syscall				# print prompt2 message
	
	li $v0, 5   			# code for reading an integer
	syscall	  	  		# read integer
	sw $v0, ($t2) 			# store integer from $v0 to address in vectorA($t2)
		
	add $t2, $t2, 4			# next position in vectorA
	add $t0, $t0, 1			# increment counter	
	b array1			# branch to test loop
		
next:	li $v0, 4    			# code for printing a string
	la $a0, msgB			# load message B to $a0
	syscall				# print message
	
	la $t3, vectorB			# load vectorB to register $t3
	li $t0, 0			# counter initialized to 0 (same register)
	
array2:	beq $t0, $t1, counter		# branch if counter equals length
	
	li $v0, 4    			# code for printing string
	la $a0, prompt2			# load string base address
	syscall				# print message
	
	li $v0, 5     	  		# code for reading integer value
	syscall	 	  	  	# read integer
	sw $v0, ($t3)			# store word from $v0 to address in vectorB($t3)
	
	add $t3, $t3, 4			# points to next position in vectorB
	add $t0, $t0, 1			# increment counter	
	b array2			# branch to test loop
	
counter:	li $t0, 0		# initialize same counter register to 0
address_sub: 	beq $t0, $t1, counter2	# branch if counter equals length
	 	sub $t2, $t2, 4		# substract a word to the address of vectorA
	 	sub $t3, $t3, 4		# substract a word to the address of vectorB
	 	add $t0, $t0, 1		# increment counter
	 	b address_sub		# branch to test loop
	
counter2: li $t0, 0			# counter initialized to 0		
	  li $t9, 0			# acummulator - to hold the dot product
		
multi:	beq $t0, $t1, end		# branch if counter equals length
		 	  
	lw $t5, ($t2)			# load word from address in vectorA to register $t5
	lw $t6, ($t3)			# load word from address in vectorA to register $t5
	
	mul $t7, $t5, $t6		# multiply both vectors values and store them in $t7
	add $t9, $t9, $t7 		# add the values to the acummulator
	
	add $t2, $t2, 4			# next address in vectorA
	add $t3 $t3, 4			# next address in vectorB
	add $t0, $t0, 1			# increment counter		
	b multi				# branch to test loop
	
end:	li $v0, 4               	# code for printing string
        la $a0, dotmsg        		# load base address 
        syscall   			# print string
        
        li $v0, 1              		# set system call code to print integer
        move $a0, $t9           	# prepare integer for printing
        syscall                 	# print integer (dotproduct) 

	li $v0, 10 			# code for exit
	syscall				# exit
	
error:	li $v0, 4    			# code for printing string
	la $a0, errormsg		# load base address
	syscall				# print error message
	
	li $v0, 10 			# code for exit
	syscall				# exit