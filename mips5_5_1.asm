#Laboratory Exercise 5, Assignment 5
.data 
x: .space 20
.text
strcpy:
	add   $s0,$s0,$zero	# $s0=i=0
	la $s1, x
	while_loop:
	li $v0, 12
	syscall
	beq $v0, 10, exit_loop
	beq $s0, 20, exit_loop
	sb $v0, 0($a1)
	addi $s0, $s0, 1
	j while_loop
	exit_loop:
	
	move $t3, $a1
	add   $s0,$s0,$zero
L1:
	add   $t1,$s0,$t3	
    	lb    $t2,0($t1)	# $t2=value at $t1 = y[i]
      	
	beq $t2,$zero,print 
	nop
	addi $s0,$s0,1 		# $s0 = $s0 + 1 <-> i = i + 1 
	j L1 			# next character
	nop
print:
	sub $t1, $t1,1
	lb $t2,0($t1)
	
	li $v0, 11
	move $a0, $t2
	syscall
	
	sub $s0,$s0,1
	beq $s0,$zero,end
	j print
end:
