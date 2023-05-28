.data
tabla1: .word 1,2,3,4,5,0
tabla2: .word 1,2,3,4,6,0
ocho: .word 8

.code
ld $t3, ocho($0)
daddi $t0, $0, 0
daddi $v0, $0, -1
jal comparar
halt 

comparar: ld $t1, tabla1($t0)
ld $t2, tabla2($t0)
beqz $t1, fin
beqz $t2, fin
bne $t1, $t2, fin
daddi $t0, $t0, 8
j comparar
fin: beq $t1, $t2, finn
ddivu $t0, $t0, $t3
daddi $v0, $t0, 0
finn: jr $ra
