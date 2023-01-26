#Laboratory Exercise 4, Assignment 3
.text
start:
	addi $s1, $zero, -7
	addi $s2, $zero, 8
	addi $s3, $zero, 9
	addi $s4, $zero, 10
	
ABS:
	or $t0, $zero, $s1
	slt $t1, $t0, $zero
	beq $t1, $zero, POS
	sub $t0, $zero, $t0
	POS: add $s0, $zero, $t0
MOVE:	
	add $s5, $zero, $s2
NOT:	
	nor $s6, $s3, $s3
BLE: 	
	sle $t2, $s6, $s4
	bne $t2, $zero, LABEL
LABEL:
 	addi $s7, $zero, 100

	
