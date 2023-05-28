.data
M: .word 2
tabla: .word 1, 3, 4, 5, 6, 7, 1, 1
cant: .word 8

.code 
ld $a0, M($0)
ld $a2, cant($0)
daddi $a3, $0, 0
jal cantMayores
halt

cantMayores: beqz $a2, fin
ld $a1, tabla($a3)
slt $t0, $a0, $a1
dadd $v0, $v0, $t0
daddi $t0, $0, 0
daddi $a3, $a3, 8
daddi $a2, $a2, -1
jal cantMayores
fin: jr $ra