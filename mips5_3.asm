#Laboratory Exercise 5, Assignment 3
.data
x: .space 32		# destination string x, empty
y: .asciiz "Hello"	# source string y
.text
	la $a0, x	# $a0 = x[0]
	la $a1, y	# $a1 = y[0]
strcpy:
	 add   $s0,$s0,$zero	# $s0=i=0    ??
L1:
	 add   $t1,$s0,$a1	# $t1=$s0+$a1=i+y[0]
				# = add of y[i]
    	lb    $t2,0($t1)	# $t2=value at $t1 = y[i]
      	add   $t3,$s0,$a0	# $t3=$s0 + $a0 = i + x[0]
      				#	= add of x[i]
      	sb $t2,0($t3)		# x[i] = $t2 = y[i]
	beq $t2,$zero,end_of_strcpy 	# if y[i] == 0, exit
	nop
	addi $s0,$s0,1 		# $s0 = $s0 + 1 <-> i = i + 1 
	j L1 			# next character
	nop
end_of_strcpy:
