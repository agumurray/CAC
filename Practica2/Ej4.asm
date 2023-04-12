ORG 1000H
MSJ DB "INGRESE UN NUMERO:"
FIN DB ?
ORG 1500H
NUM DB ?
ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7
MOV BX, OFFSET NUM
INT 6
MOV AL, 1
INT 7
MOV CL, NUM
INT 0
END

/* a) Cuando se utiliza INT 7, en BX se almacena la direccion del inicio de la cadena de caracteres y en AL la longitud de la misma

   b) Cuando se utiliza INT 6, se almacena en BX la direccion de la variable destino del caracter a ingresar

   c) La segunda interrupcion INT 7 muestra en el monitor el caracter ingresado. Queda almacenado en CL el caracter ingresado.

*/