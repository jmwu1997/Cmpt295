
			.data
arg1:	.word 0x10000008	# this is the first argument
arg2:	.word 0x80000001	# this is the second argument
sum:    .space 4		# reserve space for sum (and and xor to make or)

			.text
			.globl main				
												
main:										

			lw $t0, arg1		#load first argument into t0			
			lw $t1, arg2		#load second argument into t1
						# x or y = (x and y) xor (x xor y)
			and $t2, $t1,$t0	#t2 =  t0 and t1 
			xor $t3, $t1,$t0	#t3 =  t0 xor t1
			xor $t4, $t3,$t2	#t4 =  t2 xor t3
			sw $t4,sum		#t4 is the result from and and xor to make or, saved into sum



			li $v0,10
			syscall