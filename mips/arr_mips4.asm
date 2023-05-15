.data
	arr: .space 64
	msg1: .asciiz "Nhap so phan tu cua mang: "
	msg2: .asciiz "arr["
	msg3: .asciiz "]"
	msg4: .asciiz ":"
	msg5: .asciiz "Phan tu am nho nhat cua mang: "
	msg6: .asciiz "index: "
	msg7: .asciiz "\n"
	msg8: .asciiz "Mang khong co so am"
	
.text
input:
	li $v0, 4
	la $a0, msg1
	syscall 
	
	li $v0, 5
	syscall 
	move $t0, $v0 # luu gia tri cua so phan tu vao t0
	
li $s0, 0 # con tro i
loop:
	beq $s0, $t0, endloop
	li $v0, 4 
	la $a0, msg2 
	syscall 
	
	li $v0, 1
	move $a0,$s0
	syscall
	
	li $v0, 4 
	la $a0, msg3
	syscall
	
	li $v0, 4 
	la $a0, msg4
	syscall
	
	li $v0, 5
	syscall 
	move $s1, $v0 #  luu gia tri nhap vao s1
	
	mul $s2, $s0, 4
	sw $s1, arr($s2) # luu vao mang 
	
	addi $s0, $s0, 1
	j loop
endloop:
	mul $t0, $t0, 4 # tong so phan tu(dia chi) cua mang
	li $t1, 0 # i 
	li $t2, 0 # dung de luu gia tri so am nho nhat
loop1:
	beq $t1, $t0,endloop1
	lw $s1, arr($t1)
	blt $s1, $t2, min
	nop
	j next
	nop
	min:
	move $t2, $s1
	div $s3, $t1, 4
	next:
	addi $t1, $t1, 4
	j loop1
endloop1:
	bne $t2, 0, label 
	
	li $v0, 4
	la $a0, msg8
	syscall
	
	li $v0, 10 
	syscall  
	
	label:
	li $v0, 4
	la $a0, msg5
	syscall 
	
	li $v0, 1
	move $a0, $t2
	syscall 
	
	li $v0, 4
	la $a0, msg7
	syscall 
	
	li $v0, 4
	la $a0, msg6
	syscall 
	
	li $v0, 1
	move $a0, $s3
	syscall 
	
	

	