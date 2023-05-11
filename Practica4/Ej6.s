.data
A: .word 3
B: .word 1
C: .word 2
D: .word 0

.code 
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
daddi r4, r0, 3
beq r1, r2, prox1
daddi r4, r4, -1
prox1: beq r1, r3, prox2
daddi r4, r4, -1
prox2: beq r2, r3, prox3
daddi r4, r4, -1
prox3: sd r4, D(r0)
halt

//el programa devuelve la cantidad de igualdades