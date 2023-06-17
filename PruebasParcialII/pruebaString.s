.data 
texto: .asciiz "Hola mundo"
CONTROL:  .word32 0x10000
DATA:  .word32 0x10008

.code 
lwu $s0, DATA($0)
lwu $s1, CONTROL($0)

ld $t0, texto($0)
sd $t0, 0($s0)

daddi $t0, $0, 4
sd $t0, 0($s1)
halt