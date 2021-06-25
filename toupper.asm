#####################################################################
# toupper.asm
# By Luis A. Flores (841-10-2500)
# Program that converts a string into upperCase
#
# Register use:
# $t0 - counter
# $t1 - pointer to current characer
# $t2 - current character (in low order byte)
# $t3 - upper variable address
# $v0 - system call code
# $a0 - system call argument
#####################################################################
# Data Segment
#####################################################################
.data
prompt:   	.asciiz "Enter string: "
uppermsg:	.asciiz "The uppercase equivalent: "
string:      	.space 81
upper:		.space 81
#####################################################################
# Text (Code) Segment
#####################################################################
.text
.globl main

main:	     	li $v0, 4               	# set system call code to print string
   	        la $a0, prompt          	# load string base address
 		syscall                 	# print prompt message

		li $v0, 8               	# set system call code to read string
          	la $a0, string          	# load string base address
          	li $a1, 31              	# load buffer length
          	syscall                 	# read string         
          	
          	move $t1, $a0           	# point to first character, $t1 now has the string
          	la   $t3, upper			# load upper to $t3 - to pass the converted string to upper

character:  	lb $t2, ($t1)           	# load byte character from memory - $t2 has the first char
         	beqz $t2, end_str 		# exit loop when character == '\0'                    
          	blt	$t2, 'a', store		# no change - its already in upperCase no substraction needed 
	  	bgt	$t2, 'z', store
	  	addiu	$t2, $t2, -32		# add -32 to the character for the upperCase equivalent
	  	          
store:		sb  $t2, ($t3)			# store byte - already in upperCase
		add $t1, $t1, 1         	# point to next the character
		add $t3, $t3, 1			# move the pointer to store the next char		
		j character			# jump to the test loop - next character
				                           
end_str:	li $v0, 4               	# set system call code to print string
   	        la $a0, uppermsg        	# load string base address
 		syscall                 	# print prompt message
 		
 		li $v0, 4               	# set system call code to print string
   	        la $a0, upper           	# load string base address
 		syscall  

		li $v0, 10              	# set system call code to exit program
          	syscall                 	# exit program
