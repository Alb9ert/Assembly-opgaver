.text

main:
li $a0, 5 
li $a1, 3
jal addNumbers # func call
move $a0, $v0

li $v0, 1 # print int
syscall

li $v0, 10 # exit
syscall

addNumbers:
add $v0, $a0, $a1
jr $ra # return

