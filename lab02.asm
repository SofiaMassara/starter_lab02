
# lab02.asm - Pairwise swap in an array of 32bit integers
#   coded in  MIPS assembly using MARS
# for MYΥ-505 - Computer Architecture, Fall 2021
# Department of Computer Science and Engineering, University of Ioannina
# Instructor: Aris Efthymiou

        .globl swapArray # declare the label as global for munit
        
###############################################################################
        .data
array: .word 5, 6, 7, 8, 1, 2, 3, 4

###############################################################################
        .text 
# label main freq. breaks munit, so it is removed...
        la         $a0, array
        li         $a1, 8


swapArray:
###############################################################################
# Write you code here.
# Any code above the label swapArray is not executed by the tester! 
###############################################################################
   addi $t6 , $zero, 4		# $t6=4
	addi $t2 , $zero, 2		# $t2=2
	div $a1 , $t2			# to find size/2
	mflo $t3			# is size/2
	
	add $t5 , $zero, $zero		# $t5 will be i, initialize just to be sure
	add $t0, $a0 ,$zero		# $t0 points to array[0] , $a0
	
	add $t1 , $zero ,$zero		# initialize $t1 just to be sure
	
	
	loop: 
		beq $t5, $t3, exit		# if i = size/2 : exit loop
		mult $t3 , $t6			# multiply size/2 with 4 
		mflo $t7 			# this many bytes i need to move from current position on the array to find the item to swap with
		
		add $t1, $t0, $t7		# $ti is the element to swap with $t0
		
		lw $t8 , 0($t0)			# swap proccess
		lw $t9 , 0($t1)			# I used $t9 , $t8 to store temporary values.
		sw $t9 , 0($t0)			#
		sw $t8 , 0($t1)			#
		
		
		addi $t0, $t0, 4		# $t0 now points to the next word than before and in line 43 so wiil $t1
		addi $t5, $t5, 1		# t5 = t5 + 1 or i++
				
		j loop

	

###############################################################################
# End of your code.
###############################################################################
exit:
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.


