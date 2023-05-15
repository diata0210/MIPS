.data
	string: .space 100
	msg1: .asciiz "Nhap chuoi: "
	msg2: .asciiz " "
	msg4: .asciiz "So lan xuat hien: "
.text
	li $v0, 4
	la $a0, msg1
	syscall 

	li $v0, 8
	la $a0, string
	li $a1, 100
	syscall 

	li $t0, 0 # i
	li $t1, 1 # j = i+1
	li $s0, 0 # den so lan xuat hien
	lb $t2, string($t0) 
	lb $t3, string($t1)
	bne $t2, 84, next
	nop
	bne $t3, 104, next
	nop 
	addi $s0, $s0, 1
	next:
	move $s1, $t0 # i 
	addi $t0, $t0, 1 # i = i+1
	addi $t1, $t1, 1 # j = j+1
	
loop:
	lb $s2, string ($s1)
	lb $t2, string($t0) 
	lb $t3, string($t1)
	beq $t3, 0 endloop
	bne $s2, 32, nextt
	nop
	bne $t2, 84, nextt
	nop
	bne $t3, 104, nextt
	nop 
	addi $s0, $s0, 1
	nextt:
	addi $t0, $t0, 1 # i = i+1
	addi $t1, $t1, 1 # j = j+1
	addi $s1, $s1, 1
	j loop
	
endloop:

li $v0, 4
la $a0,  msg4
syscall 

li $v0, 1
move $a0, $s0
syscall 












	