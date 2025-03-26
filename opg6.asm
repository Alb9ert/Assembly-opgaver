# let x = 2
# let y = x * x
# print (y+x)

.data
    x: .word 2
    y: .word 0

.text
.globl main
main:
    lw $t0, x

    mul $a1, $t0, $t0   

    sw $a1, y

    add $a0, $t0, $a1
    li $v0, 1
    syscall

    li $v0, 10         # System call for exit
    syscall            # Afslut programmet  



