
# TODO: add a target for each .input file in the Data directory to run the compiled Stack program with the tests in ./Data

# TODO: add a target that can run all the tests above.

#########################################
# Created by Jiyuan Wu, 3504827
#
# This is a comment, a comment always start with `#`
# Indentation is primordial in a Makefile.
# the steps for a target are always indented
#
##########################################

# compile Stack.c with gcc
COMPILER = gcc

# The C flags to pass to gcc
C_FLAGS = -Wall -Wextra -std=c99 

# prepend the command with '@' so that Make does not print the command before running it 
help:
	@printf "available command:\n"
	@printf "	make help               (this command)\n"
	@printf "	make Stack              (to build your C program)\n"
	@printf "	make test               (to run every test case)\n"

# link our .o files to make an executable
Stack: Stack.o
	$(COMPILER) $(C_FLAGS) -o Stack Stack.o 

# compile the `Stack.o` file
Stack.o: Stack.c
	$(COMPILER) $(C_FLAGS) -c Stack.c

##################################################################
# Test Cases
test: test1 test2 test3

# run our executable by passing in the text file via stdin with `<` and passing stdout to a file with `>`
# then use a scrit to verify that the result are the same one as the one expected
test1: Stack Data/test1.input 
	./Stack < Data/test1.input > test1.result

test2: Stack Data/test2.input
	./Stack < Data/test2.input > test2.result

test3: Stack Data/test3.input
	./Stack < Data/test3.input > test3.result
