.data
.text
.globl main
main:
    li $a0, 4
    addi $a2, $a0, 6

    li $v0, 1
    move $a0, $a2
    syscall

    li $v0, 10         # System call for exit
    syscall            # Afslut programmet


