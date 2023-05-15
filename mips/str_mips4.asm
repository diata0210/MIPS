.data
	string: .space 100
	msg1: .asciiz "Nhap chuoi: "
	msg2: .asciiz " "
	msg4: .asciiz "Chuoi moi: "
.text
	li $v0, 4
	la $a0, msg1
	syscall 

	li $v0, 8
	la $a0, string
	li $a1, 100
	syscall 

	li $t0, 0 # i
loop:
	lb $t2, string($t0)
	beq $t2, 0 , endloop
	blt  $t2, 97, next
	nop
	bgt  $t2, 122, next
	nop
	addi $t2, $t2, -32
	sb $t2, string($t0)
	next:
	addi $t0, $t0, 1
	j loop
endloop:
 	li $t0, 0
 	
 	li $v0, 4
	la $a0, msg4
	syscall 
loop2:
	lb $t1, string($t0)
	beq $t1, 0, endloop2
	
	li $v0,11
	move $a0, $t1
	syscall 
	
	addi $t0, $t0, 1
	j loop2
endloop2: