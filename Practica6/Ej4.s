.data
msj1: .asciiz "Bienvenido"
msj2: .asciiz "ERROR"
pswrd: .asciiz agus123
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code 
lwu $s0, DATA(r0) ; $s0 = dirección de DATA
lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL
daddi $v0, $0, 1
daddi $a0, $0, 7
daddi $a1, $0, 0
loop: beqz $v0, incorrecta
jal char
beqz $v0, incorrecta
bnez $a0, loop
j correcta
incorrecta: daddi $v0, $0, 1
daddi $a0, $0, 7
daddi $a1, $0, 0
daddi $t0, $0, msj2
sd $t0, 0($s0)
daddi $t0, $0, 4 ; $t0 = 4 -> función 4: salida de una cadena ASCII
sd $t0, 0($s1) ; CONTROL recibe 4 y produce la salida del mensaje
j loop
correcta: daddi $t0, $0, msj1
sd $t0, 0($s0)
daddi $t0, $0, 4
sd $t0, 0($s1)
halt

char: daddi $a0, $0, -1
ld $t3, pswrd($a1);
daddi $t0, $0, 9
sd $t0, 0($s0)
lbu $t4, 0($s0)
beq $t3, $t4, correcta
daddi $v0, $0, 0
correcta: daddi $v0, $0, 1
jr $ra



