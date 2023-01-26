# summary knowledges for mid term exam
.data
X: word 5
Y: word 
A: .space 32 # array of 8 ints (8*4 = 32)
char: .asciiz " "

.text
	# cong so 16-bit
	addi $s0, $zero, 0x3007 # $s0 = 0 + 0x3007 = 0x3007 ;I-type 
	add $s0, $zero, $0 # $s0 = 0 + 0 = 0 ;R-type
	
	# gan so 32-bit
	lui $s0,0x2110 #put upper half of pattern in $s0 
	ori $s0,0x003d #put lower half of pattern in $s0
	
	# ngoai ra con sub, mul
	
	mflo $s1 # gan gia tri thanh ghi low vao $s1
	
	div $t1, $t2
	mflo $t6 # thuong
	mfhi $t7 # so du
	
# -----------------------------------------------------------------------

	# dung lenh la, lw, sw, li
	la $t9, X # get add of X to $t9
	lw $t1, 0($t9) # $t1 = X
	# hoac viet thang nn cung duoc
	lw $t1, X # lay gia tri cua label X gan vao $t1
	
	la $t8, Y # get add of Y to $t8
	sw $t1, 0($t8) # gan Y = $t1 = X
	
	li $t2, 19 # gan $t2 = 19
	
# -----------------------------------------------------------------------

	# branch
	seq $t1, $s1, $s2 # (s1 == s2)
	slt $t1, $s1, $s2 # (s1 < s2)
	sle $t1, $s1, $s2 # (s1<= s2)
	sgt $t1, $s1, $s2 # (s1 > s2)
	sge $t1, $s1, $s2 # (s1 >= s2)
	
	beq $t1,$t2, label # (t1 == t2)
	bne $t1, $t2, label # (t1 != t2)
	
label:

# -----------------------------------------------------------------------

	# syscall (w5)

quit:
	li $v0, 10	#terminate
	syscall

print:	
	# truoc khi in thi phai gan gia tri $v0, $v1 sang so khac 
	add $a1, $v0, $zero
	add $a2, $v1, $zero
	
	# print string
	li $v0,4		
	la $a0,char
	syscall
	
	# gan $a0
	# print int
	add $a0, $a1, $zero # $a1 = max from $v0
	li $v0, 1
	syscall
	
read:
	# input int, $v0 = value inputted
	li $v0, 5
	syscall
	
# -----------------------------------------------------------------------

	# array & pointer (week 6)
	# xu ly chuoi theo array (a+i*4)/ pointer (cong dia chi +4)
	
# -----------------------------------------------------------------------

	# tinh MSB, LSB (w4)