#Laboratory Exercise 10.1, Assignment 5
# toa do (x,y) 
# 0-index
# vi tri = k + (32x + 4y)

.eqv MONITOR_SCREEN 0x10010000
.eqv GREEN	0x6FEDD6
.eqv RED	0xFF4A4A

.data
m1: .asciiz "Input x1, y1: "
m2: .asciiz "Input x2, y2: "

.text

main:
	li $t8, RED
	li $t9, GREEN

input: 
	li $v0, 4
	la $a0, m1
	syscall

	li $v0, 5
	syscall # nhap x1
	addi $t1, $v0, 0
	
	li $v0, 5
	syscall # nhap y1
	addi $t2, $v0, 0
	
	li $v0, 4
	la $a0, m2
	syscall

	li $v0, 5
	syscall # nhap x2
	addi $t3, $v0, 0
	
	li $v0, 5
	syscall # nhap y2
	addi $t4, $v0, 0
	
draw:
	addi $a1, $t1, 0	#initial i
loop2:
	sub $a3, $t3, $a1
	addi $a3, $a3, 1
	beq $a3, $zero, exit	#end of loop2

	addi $a2, $t2, 0	#initial j

loop1:	
#(a1, a2)

check_edge:
	beq $a1, $t1, red
	beq $a1, $t3, red
	beq $a2, $t2, red
	beq $a2, $t4, red

green:
	li $k0, MONITOR_SCREEN
	mul $t6, $a1, 32
	mul $t7, $a2, 4
	add $t5, $t6, $t7
	add $k0, $k0, $t5
	sw  $t9, 0($k0)
	j cont

red:
	li $k0, MONITOR_SCREEN
	mul $t6, $a1, 32
	mul $t7, $a2, 4
	add $t5, $t6, $t7
	add $k0, $k0, $t5
	sw  $t8, 0($k0)	

cont:		
	addi $a2, $a2, 1	#j++
	
	sub $a3, $t4, $a2
	addi $a3, $a3, 1
	bne $a3, $zero, loop1	#end of loop1
	
	addi $a1, $a1, 1	#i++
	j loop2

exit:
    li    $v0, 10
    syscall 
	
	