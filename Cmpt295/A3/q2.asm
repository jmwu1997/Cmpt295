
			.data
arg1:	.word 0x80000001	# this is the first argument
n:		.word 6		# n = user input
x:		.word 1		# x = first value
y:		.word 1		# y = second value
counter: .word 2		# counter start at 2
ans:    .space 4		# reserve space for counter

	

			.text
			.globl main				
											
main:										
			lw $t0,n		# load t0 = 6 = n
			lw $t1,x		# load t1 = 1 = x
			lw $t2,y		# load t2 = 1 = y
			lw $t4,counter 		# load t6 = counter starts at 2
			beq $t0,$t1,L1  	# if n = 1 go L1
			beq $t0,$t4,L1		# if n = 2 go L1
			bgt $t0,$t4,loop	# if n > 2 go Loop


	loop:	
			add $t3, $t1, $t2	# put t1 + t2 -> t2
			sw $t3,ans		# saved answer t3 -> ans, will update every loop*
			move $t1,$t2		# moved t2 back to t1 
			move $t2,$t3		# moved the result of t1 add t2 back to t2 
			addi $t4,$t4,1		# counter ++
			bne $t4,$t0,loop	# if counter != n value, go back to loop
				
		
	L1:
			sw $t1,ans		# saved answer t1 -> ans, which is 1
			


			li $v0,10
			syscall