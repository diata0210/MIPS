.data
    msg1: .asciiz "Nhap so nguyen duong N: "
    msg2: .asciiz " la so chinh phuong "
    msg3: .asciiz " ko phai la so chinh phuong"
    msg4: .asciiz "Cac so tim duoc: "
    msg5: .asciiz " "
    msg6: .asciiz "\n"
.text
main:
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $a1, $v0

    li $s0, 0
    li $t0, 0 
loop:
	mul $s1, $s0, $s0
	bgt $s1, $a1, endloop
	beq $s1, $a1, next
	nop
	li $t0, 1
	next:
	addi $s0, $s0, 1
	j loop
endloop:
	li $v0, 1
	move $a0, $a1
	syscall 
	beq $t0, 1, isCP
	nop
	li $v0, 4
	la $a0, msg3
	syscall 
	j findCP
	isCP:
	li $v0, 4
	la $a0, msg2
	syscall 
findCP:
	li $s0, 0
	li $v0, 4
	la $a0, msg6
	syscall 
	
	li $v0, 4
	la $a0, msg4
	syscall 
loop1:
	mul $s1, $s0, $s0
	bge $s1, $a1, endloop1
	li $v0, 1
	move $a0, $s1
	syscall 
	
	li $v0, 4
	la $a0, msg5
	syscall 
	
	addi $s0, $s0, 1
	j loop1
endloop1:
	
	
	

	
	
	
	
	
	
	
	
	
	
	
