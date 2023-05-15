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

#lay ra ki tu dau tien:
	lb $t1, string($t0)
	blt $t1, 97, nxt
	nop
	bgt $t1, 122, nxt
	nop
	addi $t1, $t1, -32
	sb $t1, string($t0)
	nxt:
	addi $t3, $t0, 1 #i = 1
# doi cac ki tu cua cac tu dau tien thanh chuoi
loop1:
	lb $t1, string($t0)
	lb $t2, string ($t3)
	beq $t2, 0, endloop1
	bne $t1, 32, isLower
	nop
	blt $t2, 97, next
	nop
	bgt $t2, 122, next
	nop
	addi $t2, $t2, -32
	sb $t2, string($t3)
	j next

	isLower:
	blt  $t2, 65, next
	nop
	bgt  $t2, 90, next
	nop
		addi $t2, $t2, 32
		sb $t2, string($t3)
	next:
	addi $t0, $t0, 1
	addi $t3, $t3, 1
	j loop1
endloop1:
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
	
