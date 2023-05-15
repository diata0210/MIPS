.data
	msg: .asciiz "N = "
	msg1: .asciiz " "
	
.text 
main:
	li $v0, 4
	la $a0, msg 
	syscall 
	
	li $v0, 5
	syscall 
	move $s2, $v0
	
	li $s1, 5
	addi $s2, $s2, -1
	li $t0, 5
	li $t1, 7
loop:
	beq $s1, $s2, endloop
	
	div $s1, $t0
	mfhi $s3
	beq $s3, 0, print
	nop
	
	div $s1, $t1
	mfhi $s3
	beq $s3, 0, print
	nop
	addi $s1, $s1, 1
	j loop
endloop:
li $v0, 10 
syscall 
	
print:
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, msg1
	syscall 
	
	addi $s1, $s1, 1
	j loop
	
	
	
	