.data
	arr: .space 64
	msg: .asciiz "Nhap so phan tu cua mang: "
	msg1: .asciiz "Nhap phan tu thu "
	msg2: .asciiz ":"
.text
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 5
	syscall
	move $s1, $v0
	move $s2, $zero

	li $s0, 1
	
loop1:
	slt $t0, $s1, $s0
	bne $t0, $zero, endloop1
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 5
	syscall 
	move $a2, $v0	
	
	addi $s3, $s0, -1
	mul $s3, $s3, 4
	sw $a2, arr($s3)
	
	addi $s0, $s0, 1
	j loop1						
endloop1:
	li $s0, -9 # max tong 2 phan tu lien tiep
	li $s3, 4 # con tro i 
	li $s2, 0 #con tro j 
	div $s1, $t0
loop2:
	lw $t1, arr($s2)
	lw $t2, arr($s3)
	add $t3, $t1, $t2
	blt  $t3, $s0, next
	nop
	move $s0, $t3
	next:
	addi $s3, $s3, 4
	addi $s2, $s2, 4	
	addi $s1, $s1, -1
	bne $s1, $zero, loop2
endloop2:
