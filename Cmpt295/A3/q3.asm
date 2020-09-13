

			.data
ans:	.space 4		#reserve space for answer
counter: .word 0		#set counter at 0
arg1:	.asciiz "Hello, World!"	#this is the first argument

	

			.text
			.globl main				
									
main:										
			la $t0, arg1		#load address of first argument into t0, t0 is head pointer of arg1
			lw $t2, counter		#load 0 into t2, counter start at 0
		
	Loop:		
			addi $t2,$t2,1		#counter ++ everytime loop run
			addi $t0,$t0,1		#the pointer ++ to point to next letter
			lbu $t1,($t0)		#Loads a byte (unsigned) from memory to a t1.
			bne $t1,0,Loop		#if t1 != 0, run loop one more 
			sw $t2,ans		#saved t2 - > answer
				
				
				

			li $v0,10
			syscall