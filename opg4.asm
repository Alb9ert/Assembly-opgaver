
.text
.globl main
main:
    # if 3 <> 4 then 10 * 2 else 14
    li $a1, 3
    li $a2, 4

    bne $a1, $a2, true
    beq $a1, $a2, false

exit:
    li $v0, 10         # System call for exit
    syscall            # Afslut programmet  

true:
    li $a1, 10
    li $a2, 2
    mul $a0, $a1, $a2

    li $v0, 1

    syscall 
    j exit 

false:
    li $a0, 14
    li $v0, 1
    syscall  
    j exit


