#Laboratory Exercise 5, Assignment 5
.data 
x: .space 20
.text
strcpy:
	add   $s0,$s0,$zero	# $s0=i=0
	li $v0, 8
	la $a0, x
	li $a1, 20
	syscall
	
	move $t3, $a0
	
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
