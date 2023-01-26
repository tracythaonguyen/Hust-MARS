#Laboratory Exercise 3, Assignment 4-d
.text
start:
	addi $s1, $zero, 1	# i = 1
	addi $s2, $zero, 1	# j = 1
	addi $t1, $zero, 0	# x = 0
	addi $t2, $zero, 1	# y = 1
	addi $t3, $zero, 2	# z = 2
	
	addi $t4, $zero, 2	# m = 2
	addi $t5, $zero, 3	# n = 3
	add $t6, $t4, $t5	# m + n
	
	add $s1,$s1,$s2		# x = x + y
	sle $t0,$s1,$t6		# i+j <= m+n
	bne $t0,$zero,else 	# branch to else if j<i
	addi $t1,$t1,1		#     then part: x=x+1
	addi $t3,$zero,1	# z = 1
	j endif			# skip “else” part
else: 
	addi $t2,$t2,-1 	# begin else part: y=y-1
	add $t3,$t3,$t3		# z=2*z
endif: