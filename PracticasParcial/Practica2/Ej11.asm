PIC EQU 20H
N_F10 EQU 10

ORG 40
IP_F10 DW RUT_F10

ORG 1000H
LETRA DB "A"

ORG 3000H
RUT_F10: PUSH AX
INT 7
MOV AL, 20H
OUT PIC, AL
POP AX
IRET

ORG 2000H
MOV BX, OFFSET LETRA
CLI 
MOV AL, 0FEH
OUT PIC+1, AL
MOV AL, N_F10
OUT PIC+4, AL
MOV AL,1
STI
LAZO: CMP LETRA, 05AH
JNS RESET
INC LETRA
JMP LAZO
RESET: MOV LETRA, 41H
JMP LAZO
HLT 
END