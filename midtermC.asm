# C. Xâu ký tự
# 4. Nhập vào xâu ký tự. In ra ký tự đầu tiên có số lần xuất hiện ít nhất trong xâu.
.data
 	string: .space 100
 	appear: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 	# mang 27 chua so lan xuat hien cua chu trong string
 	
.text
 	# nhap string
 	li $v0, 8
 	la $a0, string
 	li $a1, 100
 	syscall
 	
 	li $t0, 0		#i = 0
	la $a1, appear		#a1 = address of appear
	li $v0, 99		#so lan xuat hien cua 1 ky tu (gan bang 1 so rat lon)
	li $v1, 0		#index cua ky tu xuat hien it nhat
loop1:
 	add $s0, $a0, $t0	#address of string[i]
 	add $t6, $t0, $t0	#2i
 	add $t6,$t6, $t6	# t6 = 4i
 	add $s1, $a1, $t6	#address of appear[i]
 	
 	lb $t2, 0($s0)		#string[i] - # lay tung chu trong string vua nhap vao
 	li $t1, 0		#j = 0
 	beq $t2, $zero, endloop1 #end of inputed string - print the result
loop2:
	add $s2, $a0, $t1	#address of string[j]
	lb $t3, 0($s2)		#value of string[j]
	beq $t3, $zero, endloop2	#string[j] = '\0' endloop
	bne $t2, $t3, update	#string[i] = string[j] update A[i]++
	lw $t4, 0($s1)		#A[i]
	addi $t4, $t4, 1	#A[i]++
	sw $t4, 0($s1)
update:				# update A[i]++
	addi $t1, $t1, 1
	j loop2
	
endloop2:
	lw $t4, 0($s1)			#update v0, v1
	ble $v0, $t4, continue		#v0 so lan xuat hien it nhat cua ky tu
	move $v0, $t4			#update so lan xuat hien it nhat
	move $v1, $t0			#update index cua so do
continue:
	addi $t0, $t0, 1
	j loop1
	
endloop1:
	add $t6, $a0, $v1	# in ra so can tim
	lb $a0, 0($t6)
	li $v0, 11
	syscall 

quit:
	li $v0, 10	#terminate
	syscall
	
	
# t2 - gia tri cua string i (a, b, c,...)
# t3 - gia tri cua string j
# t4 - gia tri cua mang appear (so lan xuat hien cua cac chu so)


