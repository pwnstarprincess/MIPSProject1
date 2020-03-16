####################################################################################
#Jennifer Pezzulo
#March 16th, 2020
#Computer 
#CSC2251N1 Computr Arch/Assembly Language 
#Project 1 (using qtspim)
####################################################################################

	##Store the string data for the program
	##data section where data is stored in memory
	.data
	integer1: .asciiz "Enter an integer: "
	integer2: .asciiz "Enter another integer: "
	integer3: .asciiz "Enter a third integer: "
	print1:   .asciiz "#The value of the first integer is: "
	print2:   .asciiz "#The value of the second integer is: "
	print3:   .asciiz "#The value of the third integer is: "
	totalSum: .asciiz "#The sum of the three integers is: "
	smallest: .asciiz "#The smallest integer is: "
	biggest:  .asciiz "#The biggest integer is: "
	newline:  .asciiz "\n"
	totalProduct: .asciiz "#The product of the three integers is: "
	average: .asciiz "#The average of the three integers roughly is: "
	beginResults: .asciiz "################################START RESULTS########################"
	endResults: .asciiz "################################END RESULTS#########################"
	

        .text
##Main Function
main:   
	jal GETVALUES 		# Call Function to get the data from the user
	jal BEGINRESULTS	# Call Function to begin results
	jal PRINTVALUES		# Call Function to print the integer values
	jal SUM  		# Call function to get the sum of the three integer variables
	jal PRODUCT 		# Call Funciton to get the product of the three integer variables
	jal AVERAGE 		# Call function to get the average of the three integer variables
	jal SMALLEST1 		# Call function to get the smallest of the three integer variables
	jal BIGGEST1 		# Call Funciton to get the the biggest of the three integer variables
	jal ENDRESULTS		# Call Function to end results
	#exit program
	li $v0, 10		#system call for exit
	syscall			#Exit program

##Function to get the integer values from the user
 GETVALUES:
	#print the message asking for the first integer
	li $v0, 4		#system call for print_str
        la $a0, integer1	#load address of integer1 into $a0
        syscall			#System call to print integer1 string
	#prompt for integer 1
	li $v0, 5		#read integer into $v0
	syscall			#System call to read integer
	#store integer in $t0 and $t3
	move $t0, $v0		#Copy the contents of $v0 into $t0
	move $t3, $t0		#Copy the contents of $t0 into $t3 for future value restoration
	#print the message asking for the second integer
	li $v0, 4		#System call for print_str
	la $a0, integer2	#load address for integer2 into $a0
	syscall			#System call to print integer2 string
	#prompt for integer 2
	li $v0, 5		#read integer into $v0
	syscall			#system call to read integer
	#store the second integer in $t1 and $t4
	move $t1, $v0		#Copy the contents of $v0 into $t1
	move $t4, $t1		#Copy the contents of $t1 into $t4 for future value restoration
	#print the message asking for the third integer
	li $v0, 4		#System call for print_str
	la $a0, integer3	#load address of integer3 into $a0
	syscall			#system call to print integer3 string
	#prompt for integer 3	
	li $v0, 5		#read integer into $v0
	syscall			#system call to read integer
	#store the third integer in $t2 and $t5
	move $t2, $v0		#Copy the contents of $v0 into $t2
	move $t5, $t2		#Copy the ocntents of $t2 into $t5 for future value restoration
	jr $ra			#return to caller

##Funciton to print beginning of Results
 BEGINRESULTS:
	li $v0, 4 		#system call for print_str
	la $a0, newline		#load address for newline variable into $a0
	syscall			#system call to print new line
	li $v0, 4		#system call for print_str
	la $a0, beginResults	#load address for beginResults variable in $a0
	syscall			#system call to print totalSum string
	li $v0, 4 		#system call for print_str
	la $a0, newline		#load address for newline variable into $a0
	syscall			#system call to print new line
	jr $ra			#return to caller

##Function to print the integer values supplied from the user
 PRINTVALUES:
	li $v0, 4		#system call for print_str
	la $a0, print1		#load address for print1 variable in $a0
	syscall			#system call to print totalSum string
	li $v0, 1		#system call for print_int
	move $a0, $t0		#copy the value of $t0 into $a0
	syscall			#syscall to print the value of first integer
	li $v0, 4 		#system call for print_str
	la $a0, newline		#load address for newline variable into $a0
	syscall			#system call to print new line
	li $v0, 4		#system call for print_str
	la $a0, print2		#load address for print2 variable in $a0
	syscall			#system call to print totalSum string
	li $v0, 1		#system call for print_int
	move $a0, $t1		#copy the value of $t1 into $a0
	syscall			#syscall to print the value of first integer
	li $v0, 4 		#system call for print_str
	la $a0, newline		#load address for newline variable into $a0
	syscall			#system call to print new line
	li $v0, 4		#system call for print_str
	la $a0, print3		#load address for print3 variable in $a0
	syscall			#system call to print totalSum string
	li $v0, 1		#system call for print_int
	move $a0, $t2		#copy the value of $t2 into $a0
	syscall			#syscall to print the value of first integer
	li $v0, 4 		#system call for print_str
	la $a0, newline		#load address for newline variable into $a0
	syscall			#system call to print new line
	jr $ra			#return to caller
	

##Function to print the sum of the integer values supplied from the user
 SUM:
	#print TotalSum message
	li $v0, 4		#system call for print_str
	la $a0, totalSum	#load address for totalSum variable in $a0
	syscall			#system call to print totalSum string
	#add the three integers
	add $t3, $t0, $t1 	# $t3 = $t0 + $t1
	add $t3, $t3, $t2 	# $t3 = ($t0 + $t1) + $t2
	move $t6, $t3 		#copy the value of $t3 into $t6
	li $v0, 1		#system call for print_int
	move $a0, $t3		#copy the value of $t3 into $a0
	syscall			#system call to print integer result
	#Print a new line
	li $v0, 4 		#system call for print_str
	la $a0, newline		#load address for newline variable into $a0
	syscall			#system call to print new line
	j REVERT 		#Go to revert funciton to store the variables in $t0, $t1, and $t2

##Function to print the product of the integer values supplied from the user 
 PRODUCT:

	#print product
	li $v0, 4		#system call for print_str
	la $a0, totalProduct	#load address for totalProduct in $a0
	syscall			#system call to print totalProduct string
	mul $t7, $t0,$t1	#$t7 = $t0 * $t1
	mul $t8, $t7,$t2	#$t8 = ($t0 * $t1) *$t2
	li $v0, 1		#system call for print_int
	move $a0, $t8		#Copy the value of $t8 into $a0
	syscall			#System call to print integer result of multiplication
	li $v0, 4 		#system call for print_str
	la $a0, newline		#Load address for newline into $a0
	syscall			#system call to print new line
	j REVERT		#Go to revert funciton to store the variables in $t0, $t1, and $t2

##Function to revert the values to their original registers
 REVERT:
	#move the integers back
	move $t5, $t2		#Copy the value of $t2 into $t5
	move $t4, $t1		#Copy the value of $t1 into $t4
	move $t3, $t0		#Copy the value of $t0 into $t3
	jr $ra			#return to caller

##Function to print the average of the integer values supplied from the user
 AVERAGE:
	#print average
	li $v0, 4		#system call for print_str
	la $a0, average		#load address for average in $a0
	syscall			#System call to print average string
	THREE = 3		#Create a constant
	li $t9, THREE   	#Load the value of THREE into $t9	
	div $t6, $t9		#Divide the value of $t6 (which is $t6 = ($t0 + $t1) + $t2) by three
	mflo $t7		#move quantity in special register lo into $t7.  That is $t7 = lo where lo is the quotient
 	li $v0, 1		#system call for print_int
	move $a0, $t7		#copy the contents of $t7 into $a0
	syscall			#System call to print the integer result of the average
	li $v0, 4 		#system call for print_str
	la $a0, newline		#load address for newline into $a0
	syscall			#system call to print newline
	jr $ra			#return to caller

##Functions to print the smallest of the integer values supplied from the user
 SMALLEST1:
	# Determine the smallest Number
	#print smallest
	li $v0, 4		#system call for print_str
	la $a0, smallest	#load address for smallest in $a0
	syscall			#system call to print smallest string
	blt $t0, $t1, SMALLEST2	#branch if less than to SMALLEST2.  If $t0 < $t1 go to SMALLEST2
	blt $t1, $t0, SMALLEST4 #branch if less than to SMALLEST4.  If $t1 < $t0 go to SMALLEST4

 SMALLEST2:
   	blt $t0, $t2, SMALLEST3 #branch if less than to SMALLEST3.  If $t0 < $t2 go to SMALLEST3 because $t0 is the smallest
   	blt $t2, $t0, SMALLEST4	#branch if less than to SMALLEST4.  If $t2 < $t0 go to SMALLEST4

 SMALLEST3:
   	li $v0, 1		#System call for print_int
   	move $a0, $t0		#Copy $t0 into $a0
   	syscall			#System call to print that value of $t0 which is now in $a0
	li $v0, 4 		#System call for print_str
	la $a0, newline		#load address for newline into $a0
	syscall			#System call to print newline
	b END			#branch to END function

 SMALLEST4:
   	blt $t1, $t2, SMALLEST5	#branch if less than to SMALLEST5.  If $t1 < $t2 go to SMALLEST5 because $t1 is the smallest
   	blt $t2, $t1, SMALLEST6 #branch if less than to SMALLEST6.  If $t2 < $t1 go to SMALLEST6 because $t2 is the smallest

 SMALLEST5:
	li $v0, 1		#System call for print_int
	move $a0, $t1		#copy $t1 into $a0
	syscall			#System call to print the value of $t1 which is now in $a0
	li $v0, 4 		#System call for print_str
	la $a0, newline		#load address for newline in $a0
	syscall			#system call to print newline
	b END			#branch to END function


 SMALLEST6:
	li $v0, 1		#System call for print_int
	move $a0, $t2		#copy $t2 into $a0
	syscall			#System call to print the value of $t2 which is now in $a0
	li $v0, 4 		#System call for print_str
	la $a0, newline		#Load address for newline into $a0
	syscall			#System call to print new line
	b END			#Branch to END function
 
##Funciton to return to caller
 END:
	jr $ra			#return to caller

##Functions to print the largest of the integer values supplied from the user
 BIGGEST1:
	# Determine the smallest Number
	#print smallest
	li $v0, 4		#System call for print_str
	la $a0, biggest		#Load address for biggest in $a0
	syscall			#System call to print biggest string
	bgt $t0, $t1, BIGGEST2	#branch if greater than to BIGGEST2.  If $t0>$t1 than go to BIGGEST2
	bgt $t1, $t0, BIGGEST4	#branch if greater than to BIGGEST4.  If $t1>$t1 than go to BIGGEST4

 BIGGEST2:
   	bgt $t0, $t2, BIGGEST3 	#branch if greater than to BIGGEST3.  If $t0>$t2 than go to BIGGEST3 because $t0 is the largest integer
   	bgt $t2, $t0, BIGGEST4 	#branch if greater than to BIGGEST4.  If $t2>$t0 than go to BIGGEST2

 BIGGEST3:
   	li $v0, 1		#System call for print_int
   	move $a0, $t0		#Copy $t0 into $a0
   	syscall			#System call to print the value of $t0 which is now in $a0
	li $v0, 4 		#System call for print_str 
	la $a0, newline		#load address for newline into $a0
	syscall			#System call to print newline
	b END			#branch to END function

 BIGGEST4:
   	bgt $t1, $t2, BIGGEST5	#branch if greater than to BIGGEST5.  If $t1>$t2 than go to BIGGEST5 because $t1 is the largest integer
   	bgt $t2, $t1, BIGGEST6  #branch if greater than to BIGGEST6.  If $t2>$t1 than go to BIGGEST6 because $t2 is the largest integer

 BIGGEST5:
	li $v0, 1		#System call for print_int
	move $a0, $t1		#Copy $t1 into $a0
	syscall			#System call to print the value of $t1
	li $v0, 4 		#System call for print_str
	la $a0, newline		#load address for newline into $a0
	syscall			#System call to print newline
	b END			#branch to end

 BIGGEST6:
	li $v0, 1		#System call for print_int
	move $a0, $t2		#Copy $t2 into $a0
	syscall			#System call to print the value of $t2 which is now in $a0
	li $v0, 4 		#System call for print_str
	la $a0, newline		#load address for newline into $a0
	syscall			#System call to print new line
	b END			#Branch to END function

##Funciton to print end of Results
 ENDRESULTS:
	li $v0, 4		#system call for print_str
	la $a0, endResults	#load address for endResults variable in $a0
	syscall			#system call to print totalSum string
	li $v0, 4 		#system call for print_str
	la $a0, newline		#load address for newline variable into $a0
	syscall			#system call to print new line
	jr $ra			#return to caller