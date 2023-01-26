#Laboratory Exercise 7, Assignment 4
# k lam theo kieu recursive dung stack ma
# lam theo kieu vong lap
# cho cac so can tim vao trong 1 array roi lap tim MAX, MIN
# lam xong roi hehehe

.data
A: .space 32 # array of 8 ints (8*4 = 32)
Max: .asciiz "Largest: "
Min: .asciiz "Smallest: "
newline: .asciiz "\n"
char: .asciiz " "


.text
	li $t6, 0 # pos of MAX
	li $t7, 0 # pos of MIN
	li $t5, 7 # bien dem
	
	li $s0, 3
	li $s1, -6
	li $s2, 4
	li $s3, -1
	li $s4, 7
	li $s5, 8
	li $s6, 9
	li $s7, 1
	
INPUT_ARRAY:
	la $a0,A
	sw $s0,0($a0)
	addi $a0, $a0, 4
	sw $s1,0($a0)
	addi $a0, $a0, 4
	sw $s2,0($a0)
	addi $a0, $a0, 4
	sw $s3,0($a0)
	addi $a0, $a0, 4
	sw $s4,0($a0)
	addi $a0, $a0, 4
	sw $s5,0($a0)
	addi $a0, $a0, 4
	sw $s6,0($a0)
	addi $a0, $a0, 4
	sw $s7,0($a0)
	
main: jal FIND


# v0 - max, v1 - min, t6 - pos of Max, t7 - pos of Min
print:	
	add $a1, $v0, $zero
	add $a2, $v1, $zero
	
	# print max
	li $v0,4		
	la $a0,Max
	syscall
	
	add $a0, $a1, $zero # $a1 = max from $v0
	li $v0, 1
	syscall
	
	li $v0,4		# print " "
	la $a0,char
	syscall
	
	add $a0, $t6, $zero # vi tri
	li $v0, 1
	syscall
	
	li $v0,4		# print \n
	la $a0,newline
	syscall
	
	# print min
	
	li $v0,4		# print \n
	la $a0,Min
	syscall
	
	add $a0, $a2, $zero # $a1 = min from $v1
	li $v0, 1
	syscall
	
	li $v0,4		# print " "
	la $a0,char
	syscall
	
	add $a0, $t7, $zero # vi tri
	li $v0, 1
	syscall
	
quit:
	li $v0, 10	#terminate
	syscall
endmain:


#--------------------------------------------------------------------- -
#Procedure FIND: find max and min 
#--------------------------------------------------------------------- -

FIND:	
	lw $t4,0($a0)
	add $v0,$t4,$zero
	
MAX:	
	beq $t5,$zero,F2
	sub $t5, $t5, 1
	sub $a0, $a0, 4
	lw $t4,0($a0)
	
	sub 	$t0,$t4,$v0 	#compute (t4)-(v0)
	bltz 	$t0,MAX	#if (t4)-(v0)<0 then no change
	nop
	add 	$v0,$t4,$zero	#else (s1) is largest thus far
	add	$t6, $zero, $t5
	
	j	MAX
	nop
	
F2: 
	lw $t4,0($a0)
	add $v1,$t4,$zero
	
MIN:
	addi $t5, $t5, 1
	beq $t5,8,END
	addi $a0, $a0, 4
	lw $t4,0($a0)
	
	sub 	$t0,$v1,$t4	#compute (v1)-(t4)
	bltz 	$t0,MIN	#if (v1)-(t4)<0 then no change
	nop
	add 	$v1,$t4,$zero	#else (s1) is largest thus far
	add	$t7, $zero, $t5
	
	j	MIN
	nop
	
END:	
	jr $ra
	

