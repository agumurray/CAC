.data
A: .word 1
B: .word 6
ARR: .word 0

.code
ld r3, ARR(r0)
ld r2, B(r0)
ld r1, A(r0)
loop: daddi r2, r2, -1 
sd r1, ARR(r3)
dsll r1, r1, 1
daddi r3, r3, 8
bnez r2, loop
halt