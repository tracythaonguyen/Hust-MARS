# Lab 6 - Assignment 4
# Insertion sort

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
	addi $t3,$zero,1
	addi $v0,$a0,4
	j sort
	nop	# de lenh branch duoc thuc hien trong 2 chu ky
	
after_sort: 	li $v0, 10 	#exit
		syscall
end_main: 
 
# t3 tang dan tu 1 den so cuoi cung
sort:		beq $t3,$a1,after_sort 	# neu duyet het thi dung
		j start

# voi moi gia tri t3, khoi tao t2 = t3 - 1
start:		add $t2,$t3,$zero
		add $t5,$v0,$zero
		lw $t0,0($t5)	# luu tam $v0 vao $t0
		add $v1,$v0,$zero

L1:		beq $t2,$zero,L3	# t2=0  thi chuyen sang vong lap moi
		sub $v1,$v1,4
		lw $t1, 0($v1)
		slt $t4, $t0, $t1
		beq $t4, $zero, L3
# doi cho voi so truoc no neu nho hon
swap:		
		addi $a2,$v1,4		# swap
		sw $t1,0($a2)
		
L2:		
		addi $t2,$t2,-1
		j L1	
						
L3:		
		addi $v1,$v1,4		# dua t0 ve vi tri sau khi da duyet het mot luot
		sw $t0, 0($v1)
		sub $v1,$v1,4
		addi $t3,$t3,1
		addi $v0,$v0,4
		
# ----
		add $a3, $a0, $zero
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
		li $v0,4		# print \n
		la $a0,print_sort
		syscall
		
		add $a0, $a3, $zero
		add $v0, $t6, $zero
		add $t0, $t7, $zero
		add $t1, $t8, $zero
		add $a1, $t9, $zero
		
		j sort

		



