.data
	msg1: .asciiz "Nhap so nguyen duong N: "
	msg2: .asciiz "Chu so lon nhat: "
.text 
    li $v0, 4
    la $a0, msg1
    syscall
N_loop:
    li $v0, 5
    syscall
    move $a1, $v0
    bgt $a1, 9, N_endloop
    j N_loop
N_endloop:

    li $s0, 0
    li $s2, 10 
findMax:
    beq $a1, 0, endFindMax
    div $a1, $a1, $s2
    mfhi $s3
    bgt $s3, $s0, max
    nop
    j findMax
    nop
    max:
    	move $s0, $s3
    	j findMax
endFindMax:
    li $v0, 4
    la $a0, msg2
    syscall 
    li $v0, 1
    move $a0, $s0
    syscall 
    