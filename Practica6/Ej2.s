.data 
cero: .asciiz "CERO"
uno: .asciiz "UNO"
dos: .asciiz "DOS"
tres: .asciiz "TRES"
cuatro: .asciiz "CUATRO"
cinco: .asciiz "CINCO"
seis: .asciiz "SEIS"
siete: .asciiz "SIETE"
ocho: .asciiz "OCHO"
nueve: .asciiz "NUEVE"
CONTROL: .word32 0x10000
DATA: .word32 0x10008


.code 
lwu $s0, DATA(r0) ; s0 = DATA
lwu $s1, CONTROL(r0) ; s1 = CONTROL
jal ingreso
beqz $v0, end
dadd $a0, $0, $v0
jal muestra
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
 
muestra: daddi  $a0, $a0, -48       
        daddi   $t1, $0, 8
        dmulu   $a0, $a0, $t1       
        daddi   $t0, $a0, cero      
        sd      $t0, 0($s0)         
        daddi   $t0, $0, 4          
        sd      $t0, 0($s1)         
        jr      $ra