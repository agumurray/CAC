TIMER EQU 10H
PIC EQU 20H
N_TIMER EQU 10

ORG 40
IP_TIMER DW RUT_TIMER

ORG 1000H
NUM1 DB 30H
NUM2 DB 30H

ORG 3000H
RUT_TIMER: PUSH AX
CMP NUM1, 39H
JZ RESET
CMP NUM2, 39H
JZ PRERESET
INC NUM2
JMP FINRUT
PRERESET: CMP NUM1, 39H
JZ RESET
INC NUM1
MOV NUM2, 30H
JMP FINRUT
RESET: MOV NUM1, 30H
MOV NUM2, 30H
FINRUT: MOV AL,2
INT 7
MOV AL, 0
OUT TIMER, AL
MOV AL, 20H
OUT PIC, AL
POP AX
IRET

ORG 2000H
MOV BX, OFFSET NUM1
CLI
MOV AL, 0
OUT TIMER, AL
MOV AL, 1
OUT TIMER+1, AL
MOV AL, 0FDH
OUT PIC+1, AL
MOV AL, N_TIMER
OUT PIC+5, AL
STI
LAZO: JMP LAZO
HLT
END