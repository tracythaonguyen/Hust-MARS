#Laboratory Exercise 3, Home Assignment 1
.text
start:
	addi $s1, $zero, 1
	addi $s2, $zero, 3
	addi $t1, $zero, 0
	addi $t2, $zero, 1
	addi $t3, $zero, 2
	slt $t0,$s2,$s1 	
	bne $t0,$zero,else 
	addi $t1,$t1,1
	addi $t3,$zero,1
	j endif
else: 
	addi $t2,$t2,-1 
	add $t3,$t3,$t3
endif: