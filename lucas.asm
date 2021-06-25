##########################################################################################
# lucas.asm
# By Luis A. Flores (841-10-2500)
# Programa que muestra la suceción de lucas utilizando los terminos entrados por el usuario 
#
# Register use:
# $t0 - first term
# $t1 - second term
# $t2 - number of terms
# $t9 - counter
# $v0 - system call code
# $a0 - system call argument
#
############################ DATA SEGMENT ###############################
.data
prompt1:	.asciiz "Enter the first term:"
prompt2:	.asciiz "Enter the second term:"
prompt3:	.asciiz "Enter the number of terms:"
lucasmsg1: 	.asciiz "The first "
lucasmsg2: 	.asciiz " terms: "
space:		.asciiz " "

########################### CODE SEGMENT ################################
.text
.globl main 
	  
main:	li $v0, 4    			# set system call code to print string
	la $a0, prompt1 		# load string base address
	syscall				# print prompt1 message
	    
	li $v0, 5   			# set system call code to read integer
	syscall	  	  		# read integer
	move $t0, $v0 			# store integer to $t0
	  
	li $v0, 4   			# set system call code to print string
	la $a0, prompt2 		# load string base address
	syscall				# print prompt2 message
	    
	li $v0, 5  			# set system call code to read integer
	syscall 	   	  	# read integer
	move $t1, $v0 			# store integer to $t1 (first term)
	  
	li $v0, 4   			# set system call code to print string
	la $a0, prompt3 		# load string base address
	syscall				# print prompt3 message
	    
	li $v0, 5   			# set system call code to read integer
	syscall  	  		# read integer
	move $t2, $v0 			# store integer to $t2 (second term)
	  
	li $v0, 4   			# set system call code to print string
	la $a0, lucasmsg1 		# load string base address
	syscall				# print lucasmsg1 message
	  
	li $v0, 1               	# set system call code to print integer
        move $a0, $t2          		# prepare integer for printing
        syscall  			# print number of terms
	    	  	  
	li $v0, 4   			# set system call code to print string
	la $a0, lucasmsg2 		# load string base address
	syscall				# print lucasmsg2 message
	
	li $v0, 1               	# set system call code to print integer
        move $a0, $t0           	# prepare integer for printing
        syscall 			# print first term
	
	li $v0, 4    			# set system call code to print string
	la $a0, space 			# load string base address
	syscall				# print a space
	
	li $v0, 1               	# set system call code to print integer
        move $a0, $t1           	# prepare integer for printing
        syscall 			# print second term
	
	li $v0, 4    			# set system call code to print string
	la $a0, space 			# load string base address
	syscall				# print a space
	
	li $t9, 0			# counter initialized to 0	
	sub $t8, $t2, 2			# substract the first two terms to the total amount of terms
loop:	beq $t9, $t8, end		# exit loop if $t9(counter) = $t2(number of terms)
	
	add $t3, $t0, $t1 		# adds the first and the second term	
	
	li $v0, 1               	# set system call code to print integer
        move $a0, $t3           	# prepare integer for printing
        syscall 			# print term
	
	li $v0, 4    			# set system call code to print string
	la $a0, space 			# load string base address
	syscall				# print a space
	
	move $t0, $t1			# copy the first term register contents to the second term register content
	move $t1, $t3			# copy the sum of the terms to the first term register
	
	add $t9, $t9, 1			# increments counter
	b loop		  		# go back to loop test
	  	  	  
end:    li $v0, 10             		# set system call code to exit program
        syscall                 	# exit program
	  	 
