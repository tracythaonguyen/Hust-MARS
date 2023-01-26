#Laboratory 3, Assigment 6
.data
A: .word 1,13,0,5,9
.text
	la $s2, A 	#luu mang vao thanh ghi
	lw $s5, 0($s2)	# max = A[0]
	addi $s1, $zero, 0	# i = 0
	addi $s4, $zero, 1	# step = 1
	addi $s3, $zero, 5	# n = 5
loop: 
	slt $t2, $s1, $s3	# $t2 = i < n ? 1: 0
	beq $t2, $zero, endloop

	add $t1,$s1,$s1		#$t1=2*$s1
	add $t1,$t1,$t1 	#$t1=4*$s1
	add $t1, $t1, $s2 	# $t1 store the address of A[i]
	lw $t0, 0($t1) 		# load value of A[i] in $t0
	add $s1,$s1,$s4 	 #i=i+step
	
	sgt $t3, $t0, $s5	# $t3 = A[i] > max ? 1: 0
	beq $t3, $zero, loop	
	add $s5, $zero, $t0	# max
	j loop			# goto loop
endloop: