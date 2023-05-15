.data
    	msg1: .asciiz "Nhap so nguyen duong N: "
    	msg2: .asciiz "Tong cac chu so cua N trong he nhi phan la: "
.text
main:
    	li $v0, 4
    	la $a0, msg1
    	syscall
    	
	li $v0, 5
	syscall
	
	move $s0, $v0
	li $s1, 2 
	li $s2, 0 # tong cua cac chu so trong bieu dien nhi phan
loop:
	beq $s0, 0 , endloop
  	div $s0, $s0, $s1
  	mfhi $s3
  	add $s2, $s2, $s3
 	j loop
endloop:
	li $v0, 4
    	la $a0, msg2
    	syscall
    	li $v0, 1
    	move $a0, $s2
    	syscall 
    	
  	
