.text

main:
addi $sp, $sp, -4
li $a1, 5
sw $a1, 0($sp) # store on stack

lw $a0, 0($sp) # load from stack

li $v0, 1 # print int
syscall

li $v0, 10 # exit
syscall

