# C. Xâu ký tự
# 4. Nhập vào xâu ký tự. In ra ký tự đầu tiên có số lần xuất hiện ít nhất trong xâu.
.data
string: .space 100
char: .asciiz "\n"
arr: .space 104
count: .space 104

.text
	# nhap chuoi
	
	li $v0, 8
 	la $a0, string
 	li $a1, 100
 	syscall
 	
 
 
 	
printString:
	add $t1, $a0, $zero
	add $t2, $a0, $zero
	
loop:	lb $a0,0($t2)
	beq $a0, $zero, endString
	
	add $t2,$t0,$t0 
	add $t2,$t2,$t2 
	add $t3,$t2,$a0
	lw $t4,0($t3)
	
	addi $t2, $t2, 1
	j loop

endString:
 
Quit:
	li $v0, 10	#terminate
	syscall
	
