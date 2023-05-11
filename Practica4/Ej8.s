.data
A: .word 4
B: .word 3
RES: .word 0

.code
ld r1, A(r0)
ld r2, B(r0)
dadd r3, r0, r0
loop: beqz r2, fin
daddi r2, r2, -1
dadd r3, r1, r3
j loop
fin: sd r3, RES(r0)
halt