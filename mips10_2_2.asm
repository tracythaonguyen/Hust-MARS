#Laboratory Exercise 10_2, Assignment 2

.eqv KEY_CODE   0xFFFF0004	# ASCII code from keyboard, 1 byte
.eqv KEY_READY  0xFFFF0000	# =1 if has a new keycode ?
				# Auto clear after lw
.eqv DISPLAY_CODE   0xFFFF000C	# ASCII code to show, 1 byte
.eqv DISPLAY_READY  0xFFFF0008	# =1 if the display has already to do
				# Auto clear after sw

.text
	li $k0, KEY_CODE 
	li $k1, KEY_READY
	li $s0, DISPLAY_CODE 
	li $s1, DISPLAY_READY
	
	li $s7, 1
		
loop:	nop

# input

WaitForKey:
	lw $t1, 0($k1)			# $t1 = [$k1] = KEY_READY
	beq $t1,$zero,WaitForKey	# if $t1 == 0 then Polling
ReadKey:
	lw $t0,0($k0)			# $t0 = [$k0] = KEY_CODE
	
# check exit
	beq $s7, 1, first
	beq $s7, 2, second
	beq $s7, 3, third
	beq $s7, 4, fourth

first:
	bne $t0, 'e', notEnd
	addi $s7, $s7, 1
	j lower

second:
	bne $t0, 'x', notEnd
	addi $s7, $s7, 1
	j lower

third:
	bne $t0, 'i', notEnd
	addi $s7, $s7, 1
	j lower

fourth:
	bne $t0, 't', notEnd
	j Exit

notEnd:
	li $s7, 1

# check - t0

lower:
	li $s3, 'a'
	li $s2, 'z'
	sge $t3, $t0, $s3
	beqz $t3, upper
	sge $t3, $s2, $t0
	beqz $t3, upper
	
	subi $t0, $t0, 32		# change input key
	j ShowKey
	
upper:
	li $s3, 'A'
	li $s2, 'Z'
	sge $t3, $t0, $s3
	beqz $t3, number
	sge $t3, $s2, $t0
	beqz $t3, number
	
	addi $t0, $t0, 32		# change input key
	j ShowKey
	
number:
	li $s3, '0'
	li $s2, '9'
	sge $t3, $t0, $s3
	beqz $t3, other
	sge $t3, $s2, $t0
	beqz $t3, other
	
	j ShowKey

other:
	addi $t0, $zero, '*'

# output

WaitForDis:
	lw $t2,0($s1)			# $t2 = [$s1] = DISPLAY READY
	beq $t2,$zero,WaitForDis	# if $t2 == 0 then Polling		


# print

ShowKey:
	sw $t0, 0($s0)			# show key
	nop
	
	j loop

Exit:
	li    $v0, 10
	syscall