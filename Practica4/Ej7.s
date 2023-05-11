.data
TABLA: .word 0,1,2,3,4,5,6,7,8,9
DIML: .word 10
X: .word 3
CANT: .word 0
RES: .word 0

.code
dadd r1, r0, r0
ld r4, DIML(r0)
ld r3, X(r0)
loop: beqz r4, fin
ld r2, TABLA(r1)
daddi r4, r4, -1
slt r7, r3, r2
dadd r6, r6, r7
sd r7, RES(r1)
daddi r1, r1, 8
j loop
fin: sd r6, CANT(r0) 
halt