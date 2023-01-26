# A. Số nguyên
# 4. Số hoàn hảo là số có giá trị bằng tổng các ước số không kể chính nó. 
# Nhập số nguyên dương N từ bàn phím, in ra các số hoàn hảo nhỏ hơn N.
.data
char: .asciiz " "

.text
# nhap so tu ban phim
	li $v0, 5
	syscall
	
# kiem tra so nhap vao co hop le hay k (so nguyen duong)
	sgt $a2, $v0, $zero
	beq $a2, $zero, Quit # neu nhap so khong hop le thi thoat chuong trinh
	
	
	add $t2, $zero, $v0 # gan so vua nhap vao t2
	li $t1, 1
	
Loop1:	addi $t1, $t1, 1	# t1 = t1 + 1
	beq $t2, $t1, Quit
	j KiemTraSoHoanHao

# kiem tra 1 so co la hoan hao hay khong
KiemTraSoHoanHao:

	li $t3, 0 # sum 
	li $t4, 1 # index 1 -> (so $t1)
	
Loop2:	
	beq $t4, $t1, EndOfLoop2 # neu index = $t1 thi dung vong lap
	div $t1, $t4 
	mfhi $t5 # so du
	bne $t5, $zero, KhongChiaHet
	
	add $t3, $t3, $t4 # neu la uoc so thi cong them vao sum
	
KhongChiaHet:
	addi $t4, $t4, 1
	j Loop2

EndOfLoop2:	
	beq $t3, $t1, Resutl
	j Loop1

Resutl:
		
	# print so hoan hao ra man hinh
	add $a0, $t1, $zero # $t1 la so hoan hao
	li $v0, 1
	syscall
	
	# print " "
	li $v0,4		
	la $a0,char
	syscall
	
	j Loop1

Quit:
	li $v0, 10	#terminate
	syscall
