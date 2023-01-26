#Laboratory Exercise 4, Assignment 2
.text
	li $s0, 0x12345678 	#load test value for these function 
	andi $t0, $s0, 0xff000000 #Extract the MSB of $s0
	srl $t1,$t0,24		#Shift right 24 bits
	andi $t2, $s0, 0xffffff00	#Clear LSB of $s0
	ori $t3, $s0, 0x000000ff	#Set LSB of $s0 
	and $t4, $s0, $zero	 #Clear $s0=0