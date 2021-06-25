#####################################################################
# sumArray.asm
# By Antonio F. Huertas
# Computes the sums of the positive and negative elements in an 
# array of integers.
#
# Register use:
# $t0 - counter
# $t1 - sum of postive elements
# $t2 - sum of negative elements
# $t3 - array length
# $t4 - pointer to current element
# $t5 - current element
# $v0 - system call code
# $a0 - system call argument
#####################################################################

#####################################################################
# Data Segment
#####################################################################
.data
len:      .word 5
arr:      .word 2, -14, 1, -6, 15
pos_msg:  .asciiz "The sum of the positive elements is "
neg_msg:  .asciiz "\nThe sum of the negative elements is "

#####################################################################
# Text (Code) Segment
#####################################################################
.text
.globl main

main:
          li $t0, 0               # initialize counter
          li $t1, 0               # initialize sum of positives
          li $t2, 0               # initialize sum of negatives
          
          lw $t3, len             # load array length from memory
          la $t4, arr             # point to first element
          
test_lp:  beq $t0, $t3, end_lp    # exit loop when counter == length
          lw $t5, ($t4)           # load element from memory
          
test_if:  blt $t5, $zero, neg_el  # go to neg_el label if number < 0

          add $t1, $t1, $t5       # update sum of positives
          b end_if                # skip negative branch
          
neg_el:   add $t2, $t2, $t5       # update sum of negatives

end_if:   add $t0, $t0, 1         # increment counter by 1
          add $t4, $t4, 4         # point to next element
          b test_lp               # go back to loop test

end_lp:   li $v0, 4               # set system call code to print string
          la $a0, pos_msg         # load string base address
          syscall                 # print sum-of-positives message
          
          li $v0, 1               # set system call code to print integer
          move $a0, $t1           # prepare integer for printing
          syscall                 # print sum of positives
          
          li $v0, 4               # set system call code to print string
          la $a0, neg_msg         # load string base address
          syscall                 # print sum-of-negatives message
          
          li $v0, 1               # set system call code to print integer
          move $a0, $t2           # prepare integer for printing
          syscall                 # print sum of negatives

          li $v0, 10              # set system call code to exit program
          syscall                 # exit program