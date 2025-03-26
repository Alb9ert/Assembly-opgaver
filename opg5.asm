.data
truePrint: .asciiz "true"
falsePrint: .asciiz "false"

.text
.globl main
main:
    # 2 = 3 || 4 <= 2*3
    li $a1, 2
    li $a2, 3
    li $a3, 4

    beq $a1, $a2, true
    
    mul $a0, $a1, $a2
    ble $a3, $a0, true

    j false

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

