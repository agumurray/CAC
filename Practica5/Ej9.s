.data
valor: .word 4
result: .word 0

.code
daddi $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila (1)
ld $a0, valor($0)
jal factorial
sd $v0, result($0)
halt


factorial: beq $a0, $0, fin
daddi $sp, $sp, -8 ; Reserva espacio en la pila
sd $ra, 0($sp) ; Guarda el valor de $ra en la pila
daddi $t0, $a0, -1
beqz $t0, dev1
daddi $sp, $sp, -8 ; Reserva espacio en la pila
sd $a0, 0($sp) ; Guarda el valor de $a0 en la pila
daddi $a0, $a0, -1
jal factorial
ld $a0, 0($sp) ; Recupera el valor de $a0 de la pila
daddi $sp, $sp, 8 ; Libera espacio en la pila
dmul $v0, $v0, $a0
j fin

dev1: daddi $v0, $0, 1

fin: ld $ra, 0($sp) ; Recupera el valor de $ra de la pila
daddi $sp, $sp, 8 ; Libera espacio en la pila
jr $ra

