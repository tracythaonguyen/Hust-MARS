#Laboratory Exercise 10.1, Assignment 4
.eqv MONITOR_SCREEN 0x10010000
.eqv GREEN	0x3C6255
.eqv YELLOW	0xEAE7B1

.text

   li $k0, MONITOR_SCREEN
   li $a1, 0
   li $t0, GREEN
   
start1:
   bne $a1, 33, case_1
   j begin
   
case_1:
   sw  $t0, 0($k0)
   add $k0, $k0, 8
   addi $a1, $a1, 1
   # chuyen sang hang moi
   div $a2, $a1, 4
   mfhi $a3
   bne $a3, 0, start1
   add $k0, $k0, 4
   
   div $a2, $a1, 8
   mfhi $a3
   bne $a3, 0, start1
   sub $k0, $k0, 8
   j start1
   
begin:
   li $k0, MONITOR_SCREEN
   li $a1, 0
   li $t0, YELLOW
   addi $k0, $k0, 4
   
start2:
   bne $a1, 33, case_2
   j exit
   
case_2:
   sw  $t0, 0($k0)
   add $k0, $k0, 8
   addi $a1, $a1, 1
   # chuyen sang hang moi
   div $a2, $a1, 4
   mfhi $a3
   bne $a3, 0, start2
   sub $k0, $k0, 4
   
   div $a2, $a1, 8
   mfhi $a3
   bne $a3, 0, start2
   addi $k0, $k0, 8
   j start2
   
exit:
    li    $v0, 10
    syscall 
	
	