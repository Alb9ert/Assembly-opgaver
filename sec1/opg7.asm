# Evaluates:
# print (let x = 3 in x * x)
# print (let x = 3 in (let y = x + x in x * y) + (let z = x + 3 in z / z))

.data

.text
.globl main
main:
    # Part 1: let x = 3 in x * x
    li $t0, 3           # x = 3
    sub $sp, $sp, 4     # Allocate space for x on the stack
    sw $t0, 0($sp)      # Store x on the stack

    lw $t1, 0($sp)      # Load x from the stack
    mul $t2, $t1, $t1   # t2 = x * x
    move $a0, $t2       # Move result to $a0
    li $v0, 1           # System call for print_int
    syscall             # Print x * x (9)

    # Clean up stack for x
    add $sp, $sp, 4     # Deallocate space for x

    # Print newline for clarity
    li $a0, 10          # ASCII code for newline
    li $v0, 11          # System call for print_char
    syscall             # Print newline
    
    # Part 2: let x = 3 in (let y = x + x in x * y) + (let z = x + 3 in z / z)
    li $t0, 3           # x = 3
    sub $sp, $sp, 4     # Allocate space for x on the stack
    sw $t0, 0($sp)      # Store x on the stack

    # Calculate y = x + x
    lw $t1, 0($sp)      # Load x from the stack
    add $t2, $t1, $t1   # t2 = x + x (y = 6)
    sub $sp, $sp, 4     # Allocate space for y on the stack
    sw $t2, 0($sp)      # Store y on the stack

    # Calculate x * y
    lw $t3, 0($sp)      # Load y from the stack
    lw $t4, 4($sp)      # Load x from the stack
    mul $t5, $t4, $t3   # t5 = x * y (3 * 6 = 18)

    # Clean up stack for y
    add $sp, $sp, 4     # Deallocate space for y

    # Calculate z = x + 3
    lw $t6, 0($sp)      # Load x from the stack
    addi $t7, $t6, 3    # t7 = x + 3 (z = 6)
    sub $sp, $sp, 4     # Allocate space for z on the stack
    sw $t7, 0($sp)      # Store z on the stack

    # Calculate z / z
    lw $t8, 0($sp)      # Load z from the stack
    div $t8, $t8        # t8 = z / z (6 / 6 = 1)

    # Clean up stack for z
    add $sp, $sp, 4     # Deallocate space for z

    # Calculate (x * y) + (z / z)
    add $t9, $t5, $t8   # t9 = (x * y) + (z / z) (18 + 1 = 19)

    # Print result
    move $a0, $t9       # Move result to $a0
    li $v0, 1           # System call for print_int
    syscall             # Print result (19)

    # Clean up stack for x
    add $sp, $sp, 4     # Deallocate space for x

    # Exit program
    li $v0, 10          # System call for exit
    syscall


