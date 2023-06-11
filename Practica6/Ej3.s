.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008


.code 
lwu $s0, DATA(r0) ; s0 = DATA
lwu $s1, CONTROL(r0) ; s1 = CONTROL
jal ingreso
beqz $v0, end
dadd $a0, $0, $v0
jal ingreso 
beqz $v0, end
dadd $a1, $0, $v0
jal resultado
end: halt

ingreso: daddi $t0, $0, 9 ; $t0 = 9 (funcion leer)
sd $t0, 0($s1) ; CONTROL = 9
lbu $v0, 0($s0) ; $a0 = DATA
slti $t1, $v0, 48 ; $v0 = 1 si $a0 < $a1
bne $t1, $0, error
slti $t1, $v0, 58 ;$v0 = 1 si $a2 < $a0
beqz $t1, error
j fin
error: daddi $v0, $0, 0
fin: jr $ra

resultado: daddi $a0, $a0, -48
daddi $a1, $a1, -48
dadd $a0, $a0, $a1
sd $a0, 0($s0) 
daddi $t0, $0, 2
sd $t0, 0($s1)
jr $ra