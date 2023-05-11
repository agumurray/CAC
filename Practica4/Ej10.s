.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d" ; caracter buscado
cant: .word 0 

.code 
dadd r5, r0, r0
dadd r3, r0, r0
lbu r2, car(r0)
loop: lbu r1, cadena(r3)
beqz r1, fin
dsub r7, r1, r2
bnez r7, next
daddi r5, r5, 1
next: daddi r3, r3, 1
j loop
fin: sb r5, cant(r0)
halt