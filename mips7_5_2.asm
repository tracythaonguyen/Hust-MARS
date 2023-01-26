#Laboratory Exercise 7, Assignment 4
# Cach nay dang bi hoi dan

.data
A: .word
Max: .asciiz "Largest: "
Min: .asciiz "Smallest: "
newline: .asciiz "\n"
char: .asciiz " "

.text
	li $t6, 0
	li $t7, 0
	
	li $s0, 3
	li $s1, -6
	li $s2, 4
	li $s3, -1
	li $s4, 7
	li $s5, 8
	li $s6, 9
	li $s7, 1
main: jal FIND


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
#Procedure FIND to max, min
# s0 -> s7 int
# v0 max value
# v1 min value
#--------------------------------------------------------------------- -

FIND: 	add 	$v0,$s0,$zero 	#copy (s0) in v0; largest so far
	addi $t6, $zero, 0
	
	sub 	$t0,$s1,$v0 	#compute (s1)-(v0)
	bltz 	$t0,L1	#if (s1)-(v0)<0 then no change
	nop
	add 	$v0,$s1,$zero	#else (s1) is largest thus far
	addi $t6, $zero, 1
	
L1: 	sub 	$t0,$s2,$v0	#compute (s2)-(v0)
	bltz	$t0,L2 	#if (s2)-(v0)<0 then no change
	nop
	add 	$v0,$s2,$zero	#else (s2) is largest overall
	addi $t6, $zero, 2
	
L2: 	sub 	$t0,$s3,$v0	#compute (s3)-(v0)
	bltz	$t0, L3	#if (s3)-(v0)<0 then no change
	nop
	add 	$v0,$s3,$zero	#else (s3) is largest overall
	addi $t6, $zero, 3
	
L3: 	sub 	$t0,$s4,$v0	#compute (s4)-(v0)
	bltz	$t0, L4	#if (s4)-(v0)<0 then no change
	nop
	add 	$v0,$s4,$zero	#else (s4) is largest overall
	addi $t6, $zero, 4
	
L4: 	sub 	$t0,$s5,$v0	#compute (s5)-(v0)
	bltz	$t0, L5	#if (s5)-(v0)<0 then no change
	nop
	add 	$v0,$s5,$zero	#else (s5) is largest overall
	addi $t6, $zero, 5
	
L5: 	sub 	$t0,$s6,$v0	#compute (s6)-(v0)
	bltz	$t0, L6	#if (s6)-(v0)<0 then no change
	nop
	add 	$v0,$s6,$zero	#else (s6) is largest overall
	addi $t6, $zero, 6
	
L6: 	sub 	$t0,$s7,$v0	#compute (s7)-(v0)
	bltz	$t0, L	#if (s7)-(v0)<0 then no change
	nop
	add 	$v0,$s7,$zero	#else (s7) is largest overall
	addi $t6, $zero, 7
	
L:	add 	$v1,$s0,$zero 	#copy (s0) in v1; smallest so far
	addi $t7, $zero, 0
	sub 	$t0,$v1,$s1 	#compute (v1)-(s1)
	bltz 	$t0,La	#if (v1)-(s1)<0 then no change
	nop
	add 	$v1,$s1,$zero	#else (s1) is smallest thus far
	addi $t7, $zero, 1
	
La: 	sub 	$t0,$v1,$s2	#compute (v1)-(s2)
	bltz	$t0,Lb 	#if (v1)-(s2)<0 then no change
	nop
	add 	$v1,$s2,$zero	#else (s2) is smallest overall
	addi $t7, $zero, 2
	
Lb: 	sub 	$t0,$v1,$s3	#compute (v1)-(s3)
	bltz	$t0, Lc	#if (v1)-(s3)<0 then no change
	nop
	add 	$v1,$s3,$zero	#else (s3) is smallest overall
	addi $t7, $zero, 3
	
Lc: 	sub 	$t0,$v1,$s4	#compute (v1)-(s4)
	bltz	$t0, Ld	#if (v1)-(s4)<0 then no change
	nop
	add 	$v1,$s4,$zero	#else (s4) is smallest overall
	addi $t7, $zero, 4
	
Ld: 	sub 	$t0,$v1,$s5	#compute (v1)-(s5)
	bltz	$t0, Le	#if (v1)-(s5)<0 then no change
	nop
	add 	$v1,$s5,$zero	#else (s5) is smallest overall
	addi $t7, $zero, 5
	
Le: 	sub 	$t0,$v1,$s6	#compute (v1)-(s6)
	bltz	$t0, Lf	#if (v1)-(s6)<0 then no change
	nop
	add 	$v1,$s6,$zero	#else (s6) is smallest overall
	addi $t7, $zero, 6
	
Lf: 	sub 	$t0,$v1,$s7	#compute (v1)-(s7)
	bltz	$t0, done	#if (v1)-(s7)<0 then no change
	nop
	add 	$v1,$s7,$zero	#else (s7) is smallest overall
	addi $t7, $zero, 7	
	
done: jr	$ra		#return to calling program
