.data
var : .word 3
helloWorld : .asciiz "Hello World!"

.text

main:
lw $a0, var

li $v0, 1 # print int
syscall

li $a1, 5
sw $a1, var
lw $a0, var

li $v0, 1 # print int
syscall

la $a0, helloWorld
li $v0, 4 # print string
syscall

li $v0, 10 # exit
syscall