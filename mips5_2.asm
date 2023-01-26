#Laboratory Exercise 5, Assignment 2
.data
mess1: .asciiz "The sum of ("
mess2: .asciiz ") and ("
mess3: .asciiz ") is "
.text
	addi $s0, $s0, 3
	addi $s1, $s1, 4
	add $s2, $s1, $s0
	
   	la $a0, mess1		#calculate and print out the result
    	li $v0, 4
    	syscall
    	
    	move $a0, $s0
    	li $v0, 1
    	syscall
  
    	la $a0, mess2
    	li $v0, 4
    	syscall
    	
    	move $a0, $s1
    	li $v0, 1
    	syscall
    	
    	la $a0, mess3
    	li $v0, 4
    	syscall
    	
    	move $a0, $s2
    	li $v0, 1
    	syscall
    	
    	li $v0, 10		    	# exit program
    	syscall
