#Laboratory 3, Assigment 5-d
.data
A: .word 1,2,0,5,4
.text
	la $s2, A 	#luu mang vao thanh ghi
	addi $s5, $zero, 0 	# sum = 0
	addi $s1, $zero, 0	# i = 0
	addi $s4, $zero, 1	# step = 1
	addi $s3, $zero, 5	# n = 5
loop: 
	slt $t2, $s1, $s3	# $t2 = i < n ? 1: 0
	beq $t2, $zero, endloop
	#sge $t3, $s5, $zero	# $t3 = sum >= 0 ? 1 : 0
	#beq $t3, $zero, endloop
	add $t1,$s1,$s1		#$t1=2*$s1
	add $t1,$t1,$t1 	#$t1=4*$s1
	add $t1, $t1, $s2 	# $t1 store the address of A[i]
	lw $t0, 0($t1) 		 # load value of A[i] in $t0
	beq $t0, $zero, endloop	# if A[i] == 0 then endloop
	add $s5, $s5, $t0 	 #sum=sum+A[i]
	add $s1,$s1,$s4 	 #i=i+step
	j loop			# goto loop
endloop: