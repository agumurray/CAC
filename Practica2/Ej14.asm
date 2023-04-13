TIMER EQU 10H
PIC EQU 20H
EOI EQU 20H
N_F10 EQU 9
N_CLK EQU 10

ORG 36
IP_F10 DW RUT_F10 
ORG 40 
IP_CLK DW RUT_CLK

ORG 1000H
SEG DB 30H
SEG_NEXT DB 30H
DB " "
FIN DB ?

ORG 3000H
RUT_F10: PUSH AX
IN AL, PIC+1 ;traigo estado del IMR
CMP AL, 0FCH ; verifico si esta habilitado el timer
JZ DESHABILITAR ;si esta habilitado lo deshabilito
MOV AL, 0FCH 
OUT PIC+1, AL  ;si esta deshabilitado lo habilito (ahora timer puede interrumpir)
JMP END_F10
DESHABILITAR: MOV AL, 0FEH
OUT PIC+1, AL
END_F10: MOV AL, EOI
OUT PIC, AL
POP AX
IRET


RUT_CLK: PUSH AX
INC SEG_NEXT ;comienza a contar
CMP SEG_NEXT, 3AH
JNZ RESET
MOV SEG_NEXT, 30H 
INC SEG 
CMP SEG, 33H 
JNZ RESET 
INT 7 ;si llego a 30 segundos
MOV SEG, 30H 
MOV AL, 0FEH ;deshabilito timer
OUT PIC+1, AL 
JMP ELSE 
RESET: INT 7 
ELSE: MOV AL, 0
OUT TIMER, AL
MOV AL, EOI
OUT PIC, AL 
POP AX 
IRET 

ORG 2000H 
CLI ;corto interrupciones enmascarables
MOV AL, 0FEH ;habilito f10
OUT PIC+1, AL
MOV AL, N_CLK ;cargo direccion subrutina timer
OUT PIC+5, AL
MOV AL, N_F10 ;cargo direccion subrutina f10
OUT PIC+4, AL 
MOV AL, 1
OUT TIMER+1, AL  ;activo timer (no puede interrumpir, CLI y IMR no lo permiten);
MOV AL, 0
OUT TIMER, AL 
MOV BX, OFFSET SEG ;cargo direccion de segundos para INT 7
MOV AL, OFFSET FIN - OFFSET SEG 
STI ;activo interrupciones enmascarables
LAZO: JMP LAZO ;entro en lazo infinito para esperar f10
END 