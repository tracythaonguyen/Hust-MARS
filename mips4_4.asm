#Laboratory Exercise 4, Assignment 4
.text 
	addi $s1, $zero, 1
	addi $s2, $zero, 0x7fffffff
start:
	li $t0, 0		#No Overflow is default status
	addu $s3, $s1, $s2	# s3 = s1 + s2
	xor $t1, $s1, $s2	# test $s1, $s2 have same sign
				#t1 > 0 if same sign
	bltz $t1, EXIT 		# if not, exit
	xor $t3, $s3, $s1	# test s3, s1 has the same sign
				# s3 > 0 if same sign
	bltz $t3, OVERFLOW	# not same sign -> overflow
	slt $t2, $s3, $s1	
	bltz $s1, NEGATIVE	#Test if $s1 and $s2 is negative?
	beq $t2, $zero, EXIT	#$1 and $2 are positive
		# if $s3 > $s1 then the result is not overflow
	j OVERFLOW
NEGATIVE: 
	bne $t2, $zero, EXIT	#s1 and $s2 are negative
		# if $s3 < $s1 then the result is not overflow
OVERFLOW:
	li $t0, 1		#the result is overflow
EXIT:
