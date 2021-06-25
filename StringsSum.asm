#####################################################################
# strlenIO.asm
# By Antonio F. Huertas
# Computes the length of a string.
#
# Register use:
# $t0 - counter
# $t1 - pointer to current characer
# $t2 - current character (in low order byte)
# $v0 - system call code
# $a0 - system call argument
#####################################################################

#####################################################################
# Data Segment
#####################################################################
.data
prompt:   .asciiz "Enter string: "
str:      .space 81
len_msg:  .asciiz "Length of string is "

#####################################################################
# Text (Code) Segment
#####################################################################
.text
.globl main

main:
          li $v0, 4               # set system call code to print string
          la $a0, prompt          # load string base address
          syscall                 # print prompt message

          li $v0, 8               # set system call code to read string
          la $a0, str             # load string base address
          li $a1, 81              # load buffer length
          syscall                 # read string
          
          li $t0, 0               # initialize counter
          move $t1, $a0           # point to first character

next_ch:  lb $t2, ($t1)           # load characer from memory

          beq $t2, $zero, end_str # exit loop when character == '\0'
          add $t0, $t0, 1         # increment counter by 1
          add $t1, $t1, 1         # point to next character
          b next_ch               # load next character

end_str:  sub $t0, $t0, 1         # discount '\n' from counter

          li $v0, 4               # set system call code to print string
          la $a0, len_msg         # load string base address
          syscall                 # print length message
          
          li $v0, 1               # set system call code to print integer
          move $a0, $t0           # prepare integer for printing
          syscall                 # print length

          li $v0, 10              # set system call code to exit program
          syscall                 # exit program