.data
.text
.globl main
main:
    # 4 + 7 / 2
    li $a0, 7
    li $a1, 2
    div $a2, $a0, $a1
    addi $a0, $a2, 4

    li $v0, 1
    syscall

    # 3 - 6 * (10 / 5)
    li $a0, 10
    li $a1, 5   
    li $a3, 6
    div $a2, $a0, $a1
    mul $a1, $a3, $a2
    li $a3, 3
    sub $a0, $a3, $a1 

    li $v0, 1
    syscall

    li $v0, 10        
    syscall 

