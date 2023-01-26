# B. Mảng
# 1. Nhập mảng số nguyên từ bàn phím. 
# In ra số phần tử của mảng nằm trong đoạn (M, N) với M và N là 2 số nguyên nhập từ bàn phím.
# (“Nhập mảng số nguyên” bao gồm việc nhập số phần tử và các phần tử của mảng)
.data 
A: .word 100
M: .asciiz "M la: "
N: .asciiz "N la: "
char: .asciiz "\n"
SoPhanTu: .asciiz "So phan tu cua mang: "
NhapMang: .asciiz "Nhap mang: "

.text
	# nhap hai so nguyen M - t1, N - t2, SoPhanTu - t3, A - t4 (dia chi cua mang)
	# t7 - so phan tu cua mang tu M -> N
	li $t7, 0	# t7 = 0
	
	# print string
	li $v0,4		
	la $a0,M
	syscall
	
	# nhap M
	li $v0, 5
	syscall
	add $t1, $zero, $v0
	
	# print string
	li $v0,4		
	la $a0,N
	syscall
	
	# nhap N
	li $v0, 5
	syscall
	add $t2, $zero, $v0
	
	# kiem tra so nhap vao co hop le hay k (M < N)
	slt $a2, $t1, $t2
	beq $a2, $zero, Quit # neu nhap so khong hop le (M >=N) thi thoat chuong trinh
	
	# print string
	li $v0,4		
	la $a0,SoPhanTu
	syscall
	
	# nhap SoPhanTuMang
	li $v0, 5
	syscall
	add $t3, $zero, $v0
	
	# print string
	li $v0,4		
	la $a0,NhapMang
	syscall
	
	# nhap mang
	la $t4,A #t4 - dia chi cua mang
	add $t6, $t4, $zero
	li $t5, 0 # index t5
	
inputArray:	
	beq $t5, $t3, endOfInputArray
	li $v0, 5
	syscall
	sw $v0,0($t6)
	addi $t6, $t6, 4
	addi $t5, $t5, 1
	j inputArray

endOfInputArray:

	# print "\n"
	li $v0,4		
	la $a0,char
	syscall

# bat dau duyet array tim so trong doan (M,N)	
	
	li $t5, 0
	add $t6, $t4, $zero
	
duyetArray:
	beq $t5, $t3, endOfDuyetArray
	lw $a0,0($t6)
	
	sle $a3, $a0, $t1 # a0 <= M
	bne $a3, $zero, end
	
	sge $a3, $a0, $t2 # a0 >= N
	bne $a3, $zero, end
	
	addi $t7, $t7, 1
	
end:	
	addi $t6, $t6, 4
	addi $t5, $t5, 1
	j duyetArray

endOfDuyetArray:

	# print "\n"
	li $v0,4		
	la $a0,char
	syscall
	
	# print t7
	add $a0, $t7, $zero # $a0 = $t7 (tong so phan tu trong doan (M,N))
	li $v0, 1
	syscall

Quit:
	li $v0, 10	#terminate
	syscall







	
	
