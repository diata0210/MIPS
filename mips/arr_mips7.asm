.data
A: .space 100  
	msg1: .asciiz "Nhap so phan tu cua mang: "
	msg2: .asciiz "arr["
	msg3: .asciiz "]"
	msg4: .asciiz ":"
	msg5: .asciiz "\n"
	msg6: .asciiz "Nhap so nguyen: "
	msg7: .asciiz "So phan tu khac nhau: "
.text
input:
	li $v0, 4
	la $a0, msg1
	syscall 
	li $v0, 5
	syscall 
	move $t0, $v0
li $s0, 0 # con tro i
loop_input:
	beq $s0, $t0, endloop_input
	
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
	sw $s1, A($s2)
	
	addi $s0, $s0, 1
	j loop_input
endloop_input:
    j sort              # Nh?y ??n hàm sort
after_sort:
    li $v0, 10          # L?nh exit program
    syscall
sort:
    li $s1, 0           # i 
    li $t1, 24          # 6*4
    li $s2, 0           # j 
    li $t2, 28          # 7*4
    loop:
        beq $s1, $t1, endloop
        lw $t3, A($s1)   # Load giá tr? t?i A[i] vào thanh ghi $t3
        addi $s2, $s1, 4  # Kh?i t?o j = i+1
        loop1:  
            beq $s2, $t2, endloop1  # N?u j ??n cu?i m?ng thì thoát loop1
            lw $t4, A($s2)  # Load giá tr? t?i A[j] vào thanh ghi $t4
            ble $t3, $t4, next    # N?u A[i] <= A[j] thì nh?y ??n next
            nop
            sw $t4, A($s1)  # ??i ch? ??a ch? trong m?ng A[i] và A[j]
            sw $t3, A($s2)  # ??i ??a ch? 
            move $t3, $t4    # Sau ?ó c?p nh?t l?i giá tr? trong $t3
        next:
            addi $s2, $s2, 4
            j loop1
        endloop1:
        addi $s1, $s1, 4
        j loop
    endloop:
    
    li $s1, 1 # luu so lan xuat hien
    li $s2, 0 # i
    li $s3, 4 # j
    mul $t0, $t0, 4
count:
    beq $s3, $t0, endcount
    lw $t2, A($s2)
    lw $t3, A($s3)
    beq $t2, $t3, nextt
    nop
    addi $s1, $s1, 1
    nextt:
    addi $s2, $s2, 4
    addi $s3, $s3, 4
    j count
endcount:
  li $v0, 4
  la $a0,msg7
   syscall
   
    li $v0, 1
    move $a0, $s1
    syscall 