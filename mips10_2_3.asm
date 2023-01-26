#Laboratory Exercise 10_2, Assignment 3

# MMIO

.eqv KEY_CODE   0xFFFF0004	# ASCII code from keyboard, 1 byte
.eqv KEY_READY  0xFFFF0000	# =1 if has a new keycode ?
				# Auto clear after lw
.eqv DISPLAY_CODE   0xFFFF000C	# ASCII code to show, 1 byte
.eqv DISPLAY_READY  0xFFFF0008	# =1 if the display has already to do
				# Auto clear after sw

# Mars Bot

.eqv HEADING	0xffff8010	 # Integer: An angle between 0 and 359
				 # 0 : North (up)
 				# 90: East (right)
 				# 180: South (down)
 				# 270: West  (left)
.eqv  MOVING	 0xffff8050	# Boolean: whether or not to move
.eqv  LEAVETRACK 0xffff8020	 # Boolean (0 or non-0):
				 #    whether or not to leave a track
.eqv  WHEREX  0xffff8030	 # Integer: Current x-location of MarsBot
.eqv  WHEREY  0xffff8040	 # Integer: Current y-location of MarsBot

.text
	li $s7, KEY_CODE 
	li $k1, KEY_READY
	li $s0, DISPLAY_CODE 
	li $s1, DISPLAY_READY
	
	li $s3, 1
	li $s4, 1

# input
		
loop:	nop

WaitForKey:
	lw $t1, 0($k1)			# $t1 = [$k1] = KEY_READY
	beq $t1,$zero,WaitForKey	# if $t1 == 0 then Polling
ReadKey:
	lw $t0,0($s7)			# $t0 = [$k0] = KEY_CODE


# t0 - CHECK

Check:
	beq $t0, ' ', Space
	beq $t0, '\n', Enter
	beq $t0, 'W', Up
	beq $t0, 'w', Up
	beq $t0, 'S', Down
	beq $t0, 's', Down
	beq $t0, 'a', Left
	beq $t0, 'A', Left
	beq $t0, 'd', Right
	beq $t0, 'D', Right
	
# Space	
Space:	
	beq $s3, 0, Stop
	subi $s3, $s3, 1
	jal GO
	j loop
Stop:
	addi $s3, $s3, 1
	jal STOP
	j loop

# Enter
Enter:	
	beq $s4, 0, Unmark
	subi $s4, $s4, 1
	jal TRACK
	j loop
Unmark:
	addi $s4, $s4, 1
	jal UNTRACK
	j loop

# Up
Up:
	addi  $a0, $zero, 0	# Marsbot rotates 180*
	jal ROTATE
	
	j loop

# Down
Down:
	addi  $a0, $zero, 180	# Marsbot rotates 180*
	jal ROTATE

	
	j loop

# Left
Left:
	addi  $a0, $zero, 270	# Marsbot rotates 180*
	jal ROTATE
	
	
	j loop

# Right
Right:
	addi  $a0, $zero, 90	# Marsbot rotates 180*
	jal ROTATE
	
	j loop
	
#----------------------------------------------------------- 
# GO procedure, to start running
# param[in] none 
#-----------------------------------------------------------
GO:     li    $at, MOVING	# change MOVING port
        addi  $k0, $zero,1	# to  logic 1,
        sb    $k0, 0($at)	# to start running
        jr    $ra	

#----------------------------------------------------------- 
# STOP procedure, to stop running
# param[in] none 
#-----------------------------------------------------------
STOP:   li    $at, MOVING     # change MOVING port to 0
        sb    $zero, 0($at)   # to stop
	jr $ra
#----------------------------------------------------------- 
# TRACK procedure, to start drawing line
# param[in] none 
#-----------------------------------------------------------
TRACK: li $at, LEAVETRACK # change LEAVETRACK port 
	addi $k0, $zero,1 # to logic 1,
	sb $k0, 0($at) # to start tracking
	jr $ra
#----------------------------------------------------------- 
# UNTRACK procedure, to stop drawing line
# param[in] none 
#-----------------------------------------------------------
UNTRACK:li $at, LEAVETRACK # change LEAVETRACK port to 0 
	sb $zero, 0($at) # to stop drawing tail
	jr $ra
#----------------------------------------------------------- 
# ROTATE procedure, to rotate the robot
# param[in] $a0, An angle between 0 and 359
# 0 : North (up)
# 90: East  (right)
# 180: South (down)
# 270: West  (left)
# #-----------------------------------------------------------
ROTATE: li	$at, HEADING    # change HEADING port
        sw	$a0, 0($at)     # to rotate robot
        jr	$ra	
