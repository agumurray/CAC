.data
texto: .asciiz "...." ; El mensaje a mostrar
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code
lwu $s0, DATA(r0) ; $s0 = dirección de DATA
lwu $s1, CONTROL(r0) ; $s1 = dirección de CONTROL


daddi $t1, $0, 0; num caracter texto
daddi $t2, $0, 4; cant caracteres
daddi $t3, $0, 9 ;t0 = 9 funcion leer



lazo: sd $t3, 0($s1) ; CONTROL recibe 9 y lee un caracter
lbu $t4, 0($s0) ; $t4 = caracter leído
sb $t4, texto($t1) ; se guarda el caracter en el texto
daddi $t1, $t1, 1 ; se incrementa el puntero al texto
daddi $t2, $t2, -1 ; se decrementa la cantidad de caracteres
bnez $t2, lazo ; si no se leyeron todos los caracteres, se vuelve a leer

daddi $t0, $0, texto ; $t0 = dirección del mensaje a mostrar
sd $t0, 0($s0) ; DATA recibe el puntero al comienzo del mensaje


daddi $t0, $0, 6 ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
sd $t0, 0($s1) ; CONTROL recibe 6 y limpia la pantalla
daddi $t0, $0, 4 ; $t0 = 4 -> función 4: salida de una cadena ASCII
sd $t0, 0($s1) ; CONTROL recibe 4 y produce la salida del mensaje
halt