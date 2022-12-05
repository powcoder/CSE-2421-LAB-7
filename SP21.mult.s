https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
.file "SP21.mult.s"
# Assembler directives to allocate storage for static array
.section .rodata
.data
.globl multlong
	.type multlong, @function
.text 
multlong:
    push %rbp			# save caller's %rbp
    movq %rsp, %rbp		# copy %rsp to %rbp so our stack frame is ready to use

				# %rdi contains high x value
				# %rsi contains high y value
    				# %rdx contains pointer to malloc()'d space
				# NOTE: as we populate each structure in the array
				# keep in mind that we no longer have a need for
				# the starting address of the array.  The calling function
				# has it.

	# Calculate z = 13x^2 + 28x^2*y^2 + 9y^2 over all values x/y
	# between -x/-y and high values passed


    movslq %esi, %rsi		# sign extend integer y to long, it could be negative
    movq %rsi, %r8		# copy y
    movq %r8, %r12		# copy y again
    negq %r12			# %r12 = -y max
    movslq %edi, %rdi		# sign extend integer x to long, it could be negative
    movq %rdi, %r13		# copy x
    negq %r13			# %r13 = -x max

    incq %rdi			# incrment x so that when we enter loop
				# we use x as first value rather than (x-1)
Calc_loop_x:
    decq %rdi			# decrement x
    cmpq %r13, %rdi		# compare current x value with -xmax
    jl Calc_exit		# if < -x max, we're done



				# calculate x^2 and 13x^2 put both in an 8-byte register




    movq %r8, %rsi		# set %rsi back to high y value
Calc_loop_y:


				# calculate y^2, 28x^2*y^2, 9y^2 and z



				# write x, y, and z to the appropriate structure in the array of structures



    decq %rsi			# decrement y
    cmpq %r12, %rsi		# compare current y value with -y max
    jl Calc_loop_x		# if y < -y max, set up next x value
    jmp Calc_loop_y		# otherwise calculate next result
Calc_exit:
    leave
    ret
.size multlong, .-multlong

