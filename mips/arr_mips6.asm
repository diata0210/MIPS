.data
	arr: .space 64
	msg1: .asciiz "Nhap so phan tu cua mang: "
	msg2: .asciiz "arr["
	msg3: .asciiz "]"
	msg4: .asciiz ":"
	msg5: .asciiz "\n"
	msg6: .asciiz "Nhap so nguyen: "
	
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
	li $v0, 4
	la $a0, msg6
	syscall 
	
	li $v0, 5
	syscall 
	move $t1,$v0
#t0 => tong so phan tu 
#t1 => so nguyen k 
	
	li $s0, 0 # i 
	mul $t0 ,$t0, 4
loop1:
	
endloop1: