.data
	arr: .space 64
	msg1: .asciiz "Nhap so phan tu cua mang: "
	msg2: .asciiz "arr["
	msg3: .asciiz "]"
	msg4: .asciiz ":"
	msg5: .asciiz "Tong chan: "
	msg6: .asciiz "Tong le: "
	msg7: .asciiz "\n"
	
.text
input:
	li $v0, 4
	la $a0, msg1
	syscall 
	
	li $v0, 5
	syscall 
	move $t0, $v0
	
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
	move $s1, $v0
	
	mul $s2, $s0, 4
	sw $s1, arr($s2)
	
	addi $s0, $s0, 1
	j loop
endloop:
	li $t1, 0 #luu tong so chan 
	li $t2, 0 # luu tong so le
	li $t3, 0 # i 
	mul $t4, $t0, 4 #t0 tong so phan tu 
	
loop1:
	beq $t3, $t4, endloop1
	lw $s1, arr($t3)
	div $s2, $s1, 2
	mfhi $s2
	beq $s2, 0 , isOdd
	nop
	add $t1, $t1, $s1
	j next 
	nop
	isOdd:
	add $t2, $t2, $s1
	next:
	addi $t3, $t3, 4
	j loop1
endloop1:
	
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
move $a0, $t1
syscall 







	
	