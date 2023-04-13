PIC EQU 20H
EOI EQU 20H
N_F10 EQU 10
ORG 1000H
CHAR DB ?
ORG 40
IP_F10 DW RUT_F10
ORG 2000H
CLI
MOV AL, 0FEH
OUT PIC+1, AL ; PIC: registro IMR
MOV AL, N_F10
OUT PIC+4, AL ; PIC: registro INT0
MOV DX, 0
STI
LAZO: MOV CL, 41H
LOOP: CMP CL, 5AH
JZ LAZO
INC CL
JMP LOOP
ORG 3000H
RUT_F10: PUSH AX
MOV CHAR, CL
MOV BX, OFFSET CHAR
MOV AL, 1
INT 7
MOV AL, EOI
OUT EOI, AL ; PIC: registro EOI
POP AX
HLT
END