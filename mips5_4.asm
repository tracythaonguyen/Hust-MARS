#Laboratory Exercise 5, Assignment 4
.data
string:      .space   50
Message1:	.asciiz "Nhap xau: "
Message2:	.asciiz "Do dai xau la: "
.text
main:
get_string:	
		li $v0, 54
		la $a0, Message1
		la $a1, string
		li $a2, 50
		syscall

get_length: 	
		la   $a0,string		# $a0 = address(string[0])
		add  $t0,$zero,$zero	# $t0 = i = 0
		
check_char:	
		add $t1,$a0,$t0		# $t1 = $a0 + $t0
					# = address(string[i])
		lb $t2, 0($t1) # $t2 = string[i]
		beq $t2, $zero, end_of_str # is null char?
		addi $t0, $t0, 1 # $t0 = $t0 + 1 -> i = i + 1 
		j check_char
		nop
end_of_str:
end_of_get_length:

print_length: 	
		li $v0, 56
		la $a0, Message2
		sub $t0, $t0, 1 #subtract by endline character
		la $a1, ($t0)
		syscall



