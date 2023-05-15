.data
A: .word 2, 3, 3, 3,3, 3, 2, 1, 4, 2
msg: .asciiz "Phan tu xuat hien nhieu nhat: "
msg1: .asciiz ", "

.text
    # in ra m?ng
    li $s0, 0       # i = 0
    la $s1, A       # s1 = ??a ch? c?a m?ng A
    li $s2, 10      # ?? dài m?ng
print_loop:
    beq $s0, $s2, count
    lw $a0, ($s1)
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, msg1
    syscall
    addi $s1, $s1, 4
    addi $s0, $s0, 1
    j print_loop

count:
    # tìm ph?n t? xu?t hi?n nhi?u nh?t
    li $s0, 0       # l?u s? l?n xu?t hi?n l?n nh?t
    li $s1, -1      # l?u ph?n t? có s? l?n xu?t hi?n l?n nh?t
    li $s2, 0       # i
    li $s3, 4       # j
    li $s4, 40      # ?? dài m?ng A = 10 * 4 bytes
count_loop:
    beq $s2, $s4, print_max
    lw $t0, A($s2)
    li $s5, 0       # ??m s? l?n xu?t hi?n c?a ph?n t? t?i A[i]
    move $s6, $s3   # j = i + 1
count_loop1:
    beq $s6, $s4, next_count
    lw $t1, A($s6)
    bne $t0, $t1, next_count1
    addi $s5, $s5, 1
next_count1:
    addi $s6, $s6, 4
    j count_loop1
next_count:
    blt $s5, $s0, next_count2
    move $s0, $s5
    move $s1, $t0
next_count2:
    addi $s2, $s2, 4
    j count_loop

print_max:
    # in ra ph?n t? xu?t hi?n nhi?u nh?t
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 1
    move $a0, $s1
    syscall

    li $v0, 10
    syscall
