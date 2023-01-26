# Lab 6 - Assignment 3
# Bubble sort

.data
A: .word -2, 6, -1, 3, -2
Aend: .word
space: .asciiz " "
print_sort: .asciiz "\n"

.text
# khoi tao ban dau
main: 			
	la $a0,A 	# address of array
	li $a1,5 	# length of array
	add $t3, $a1, $zero
	j sort
	nop
after_sort: 	li $v0, 10 	#exit
		syscall
end_main: 

# t3 giam dan tu a1 ve 0
sort:		beq $t3,$zero,after_sort 	# neu duyet het thi dung
		j start

start:		addi $t2,$zero,1
		addi $v0,$a0,0
		
L1:		beq $t2,$t3,L3		# neu t2=t3 thi chuyen sang vong lap moi
				 		
		lw $t0,0($v0)
		addi $v1,$v0,4
		lw $t1, 0($v1)
		sgt $t4, $t0, $t1
		beq $t4, $zero, L2	# A[n] < A[n+1] thi k doi cho
swap:		
		sw $t1,0($v0)		# swap
		sw $t0,0($v1) 		
		
L2:		addi $t2,$t2,1
		addi $v0, $v0, 4
		j L1
		
L3:		sub $t3,$t3,1
# -----
		add $t5, $a0, $zero
		add $t6, $v0, $zero
		add $t7, $t0, $zero
		add $t8, $t1, $zero
		add $t9, $a1, $zero
		la $t1,A
		la $a1,Aend
		
		j print

print:		
		beq $t1,$a1,out		# print result after loop
		
		li $v0,1
		lw $t0,0($t1)
		move $a0,$t0
		syscall
		
		li $v0,4		# print space
		la $a0,space
		syscall
		
		addi $t1,$t1,4
		j print
		
out:					
		li $v0,4
		la $a0,print_sort	# print \n
		syscall
		
		add $a0, $t5, $zero
		add $v0, $t6, $zero
		add $t0, $t7, $zero
		add $t1, $t8, $zero
		add $a1, $t9, $zero
		
		j sort	


