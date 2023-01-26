#Laboratory Exercise 10.1, Assignment 1
.eqv SEVENSEG_LEFT    0xFFFF0011    # Address of led 7 (left)
				#  Bit0=doana; 
				# Bit1=doanb;... 
				# Bit7=dau.                             
.eqv SEVENSEG_RIGHT   0xFFFF0010    # Address of led 7 (right)

.text 
main:
	li    $a0,  0x6f		# set value for segments
	jal   SHOW_7SEG_LEFT	# show
	li    $a0,  0x66	# set value for segments
	jal   SHOW_7SEG_RIGHT	# show
exit:	
	li    $v0, 10
	syscall

endmain:

#--------------------------------------------------------------- 
# Function SHOW_7SEG_LEFT : turn on/off the 7seg
# param[in] $a0 value to shown
# remark $t0 changed 
#--------------------------------------------------------------- 
SHOW_7SEG_LEFT: li $t0, SEVENSEG_LEFT # assign port's address
                 sb   $a0,  0($t0)        # assign new value
                 jr   $ra
#---------------------------------------------------------------
# Function SHOW_7SEG_RIGHT : turn on/off the 7seg
# param[in] $a0 value to shown
# remark $t0 changed 
#--------------------------------------------------------------- 
SHOW_7SEG_RIGHT: li $t0, SEVENSEG_RIGHT # assign port's address
                 sb   $a0,  0($t0)         # assign new value
		jr $ra
