.data
msj1: .asciiz "Bienvenido"
msj2: .asciiz "ERROR"
pswrd: .asciiz agus123
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code 
lwu $s0, DATA(r0) ; $s0 = dirección de DATA
lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL
daddi $v0, $0, 1 ; 1 correcta 0 incorrecta
daddi $a0, $0, 7 ; longitud de la contraseña
daddi $a1, $0, -1 ; contador de desplazamientos
loop: beqz $v0, incorrecta
daddi $a1, $a1, 1 ; contador++

halt

char: 



