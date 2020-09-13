.data 

num1:     .word 33
num2:     .word 55
num3:     .word 44
p:        .word 1	       #0 or 1
ans1:		.space 4
ans2:		.space 4
ans3:		.space 4

    .text
    .globl main

main:
    addi $sp, $sp,-20 #create stack
    lw $s0,p      #s0 0 or 1
    lw $s1,num1   #s1 num1 33
    lw $s2,num2   #s2 num2 55
    lw $s3,num3   #s2 num3 44

    bne $s0, 0 ,Else    # if p = 0 case
    sw $s0,4($sp)		# push s0 to stack
    sw $s1,8($sp)		# push s1 to stack
    sw $s2,12($sp)		# push s2 to stack
	jal swap
	lw $s1,8($sp)		
    lw $s2,12($sp)	

    
    j L1

Else:                   # if p = 1
    sw $s0,4($sp)			# push s0 to stack
    sw $s2,8($sp)			# push s2 to stack
    sw $s3,12($sp)			# push s3 to stack
    jal swap
    lw $s2,8($sp)		
    lw $s3,12($sp)		
    
L1:
    sw $s1, ans1
    sw $s2, ans2
    sw $s3, ans3

    addi $sp,$sp,20     #delete stack
    li $v0, 10          #terminate program
    syscall

    .end main
#------------------------
#subroutine

.globl fib
.ent fib

swap:
	beq $s0, 0, L1
    lw $t1, 8($sp)
    lw $t2, 12($sp)
    sw $t2, 8($sp)
    sw $t1, 12($sp)
    jr $ra
    
