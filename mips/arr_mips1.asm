.data
	msg1: .asciiz "N = "
	msg2: .asciiz "M = "
	msg3: .asciiz "\n"
	msg4: .asciiz " "
.text 
	li $v0, 4
	la $a0, msg1
	syscall 
	
	li $v0, 5
	syscall 
	move $a1, $v0
	
	li $v0, 4
	la $a0, msg2
	syscall 
	
	li $v0, 5
	syscall 
	move $a2, $v0

	bgt $a1, $a2, nToM
	nop
	j loop
	nop
	nToM:
	move $s1, $a1
	move $a1, $a2
	move $a2, $s1
	
loop:
	addi $a1, $a1, 1
	beq $a1, $a2, endloop
	li $v0, 1
	move $a0, $a1
	syscall 
	
	li $v0, 4
	la $a0, msg4
	syscall
	j loop
endloop:
	
	
	
	
	
	
	
	
	
		
	 
	
	
	
	