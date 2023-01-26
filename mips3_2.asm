#Laboratory 3, Home Assigment 2
.data
A: .word 4, 8, 2, -4, 2
.text
	la $s2, A 	#luu mang vao thanh ghi
	addi $s5, $zero, 0 
	addi $s1, $zero, 0
	addi $s4, $zero, 1
	addi $s3, $zero, 5
loop: 
	slt $t2, $s1, $s3
	beq $t2, $zero, endloop
	add $t1,$s1,$s1 
	add $t1,$t1,$t1 
	add $t1, $t1, $s2 
	lw $t0, 0($t1) 
	add $s5, $s5, $t0 
	add $s1,$s1,$s4 
	j loop
endloop: