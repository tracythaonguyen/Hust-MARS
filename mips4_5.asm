#Laboratory Exercise 4, Assignment 5
.text
	li $s0, 7
	li $s1, 32	
	li $t1, 1	
loop: 
	slt $t2, $t1, $s1		#compare t1 and s1
	beq $t2, $zero, ENDLOOP		# if t1 >= s1 then ENDLOOP
	sll $t1, $t1, 1		# t1 = t1 * 2
	addi $t3, $t3, 1	# calculate number of bits needed shift
	j loop
ENDLOOP:
	sllv $s2, $s0, $t3	# implement multiply
