#main program

	.data
n: 			.word 7			#intialized value
answer: 	.space 4		#reserve space for answer

	.text
	.globl main

main:
	lw $a0, n 			#store value n in register
	
	jal fib
	
	
	sw $v1, answer 			#saved answer
	
	
	li $v0, 10 #terminate program
	syscall
	
	.end main
#------------------------
#subroutine

	.globl fib
	.ent fib
	
	fib:
	
		subu $sp, $sp, 12	# create stack
		sw $ra, 0($sp) 		# return address
		sw $a0, 4($sp) 		# first register
		sw $v1, 8($sp)		# second register, answer
		
		
		move $v1, $a0		
		ble $a0, 1, end		#base case
		
		
		subu $a0, $a0, 1	# N-1
		jal fib				# call fib(n-1)
		sw $v1, 8($sp)		# saved for later
		
		lw $a0, 4($sp)		# Load new n
		subu $a0, $a0, 2	# N-2
		jal fib 			# call fib(n-2)
		
		lw $t0, 8($sp)		# t0 is fib(n-1)
		add $v1, $v1, $t0	# fib(n-1)+ fib(n-2)
		
		
		
	end:
	
			lw $ra, 0($sp)		
			addi $sp, $sp, 12	#delete stack
			jr $ra
			
			.end fib
		
		
		
	
		
	


