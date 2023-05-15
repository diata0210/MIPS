.data
string1: .space 100
string2: .space 100
msg1: .asciiz "Nhap vao xau 1: "
msg2: .asciiz "Nhap vao xau 2: "
msg3: .asciiz "Hai xau giong nhau."
msg4: .asciiz "Hai xau khong giong nhau."
.text
# Nhap xau thu nhat
li $v0, 4
la $a0, msg1
syscall

li $v0, 8
la $a0, string1
li $a1, 100
syscall

# Nhap xau thu hai
li $v0, 4
la $a0, msg2
syscall

li $v0, 8
la $a0, string2
li $a1, 100
syscall

li $t0, 0
loop1:
	lb $t1, string1($t0)
	lb $t2, string2($t0)
	beq $t1,0 , endloop1
	nop
	beq $t2, 0, endloop1
	nop
	bne $t1, $t2, checkLU
	nop
	j next
	checkLU:
		sub $t3, $t1, $t2
		abs $t3, $t3
		bne $t3, 32, isNSol
		nop
		add $t4, $t1, $t2
		blt $t4, 162, isNSol
		nop
		bgt $s4, 212, isNSol
		nop
	next:
	addi $t0, $t0, 1
	j loop1
	isNSol:
	li $v0, 4
	la $a0, msg4
	syscall 
	
	li $v0, 10 
	syscall 
endloop1:
li $v0, 4
la $a0, msg3
syscall 


	
	
