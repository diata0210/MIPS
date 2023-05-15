.data
	msg1: .asciiz "Nhap so nguyen duong N: "
	msg2: .asciiz "N theo chieu nguoc lai: "
	msg3: .asciiz " "
	arr: .word 0:100

.text 
    # Nh?p và l?u giá tr? c?a N vào m?ng arr
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
    li $s3, 10
    
rever:
    beq $a1, 0, endRever
    div $a1, $a1, $s3
    mfhi $s2
    mul $s1, $s0, 4
    sw $s2, arr($s1)  # luu vao mang
    addi $s0, $s0, 1
    j rever
    
endRever:
    # In các giá tr? c?a m?ng arr
    li $v0, 4
    la $a0, msg2
    syscall 

    la $t0, arr # l?u ??a ch? ??u tiên c?a m?ng vào $t0
    print:
        lw $a0, ($t0) # l?y giá tr? c?a m?ng t? ??a ch? trong $t0
        beq $a0, 0, endprint
        li $v0, 1
        syscall 
        li $v0, 4 # in ký t? xu?ng dòng
        la $a0, msg3
        syscall
        
        addi $t0, $t0, 4 # t?ng con tr? c?a m?ng ?? l?y giá tr? ti?p theo
        j print
        
endprint:
    # K?t thúc ch??ng trình
    li $v0, 10
    syscall
