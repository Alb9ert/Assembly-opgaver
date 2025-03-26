.data
truePrint: .asciiz "true"
falsePrint: .asciiz "false"

.text
.globl main
main:
    # true && false
    li $a1, 1
    li $a2, 0

    and $a0, $a1, $a2

    beq $a0, $a1, true 
    bne $a0, $a1, false

exit:
    li $v0, 10         # System call for exit
    syscall            # Afslut programmet  

true:
    li $v0, 4          
    la $a0, truePrint  
    syscall 
    j exit 

false:
    li $v0, 4          
    la $a0, falsePrint
    syscall  
    j exit


