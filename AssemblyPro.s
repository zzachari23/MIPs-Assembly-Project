# -*- mode: text -*-
	
#Name: Zachariah Zachariah
#Login ID: zzachari
#UID: 117656893
#Section: 0106
	

#Program overview: This an assembly program that reads in
#three input values of type int into the global variables
#length, width, and height. If any of the values read
#in are 0 or less than 0 then the program will print -1.
#Otherwise the program will calculate the surface area
#of a rectangular prism with the sides length, width
#, and height and print it out, followed by a newline
#character.
	
	
	.data
					# list of global variables
length:	.word	0 			# length = 0	
width:	.word	0  			# width = 0	
height:	.word	0			# height = 0
ans:	.word	0			# ans = 0

	.text

main:	li		$t0, -1		# ans = -1	
	sw		$t0, ans

	li  	 	$v0, 5		# scanf("%d", &length)
	syscall
	move		$t1, $v0	
	sw  		$t1, length

	li 		$v0, 5		# scanf("%d", &width)
	syscall
	move		$t2, $v0
	sw 		$t2, width

	li 		$v0, 5		# scanf("%d", &height)
	syscall
	move		$t3, $v0
	sw 		$t3, height

if:	blez		$t1, done  	# if length <= 0, jump to done 
	blez		$t2, done       # if width  <= 0, jump to done
	blez		$t3, done       # if height <= 0, jump to done
	
	mul		$t5, $t2, $t1   # width * length
	
	mul		$t6, $t1, $t3   # length * height
	
	add		$t4, $t5, $t6   # width * length + length
					# * height
	
	mul		$t7, $t2, $t3	# width * height
	
	add		$t4, $t4,  $t7  # adds width * height to
					# $t4
	
	mul		$t4, $t4,  2	# multiply's value of $t4
					# by 2
	
	sw 		$t4, ans	# stores value of $t4
					# in ans
	
	j		done		# jumps to done


done:	li		$v0, 1		# prints ans
	lw 		$a0, ans
	syscall

	li		$v0, 11		# prints newline 
	li 		$a0, 10
	syscall

	li		$v0, 10		# quits program
	syscall

	
