.text

main:
li $a0, 5 
li $a1, 5
jal addNumbers # func call
move $a0, $v0

li $v0, 1 # print int
syscall

li $v0, 10 # exit
syscall

addNumbers:
addi $sp, $sp, -8 # allocate 8 bytes on stack
sw $ra, 0($sp) # save ra on stack with an offset of 0
add $a0, $a0, $a1 # add numbers
jal timeTwo # jump to timeTwo
lw $ra, 0($sp) # load original adress
addi $sp, $sp, 8 # deallocate 8 bytes on stack
jr $ra # return

timeTwo: 
li $a3, 2
mul $v0, $a0, $a3 # multiply by two
jr $ra # jump back to addNumbers
