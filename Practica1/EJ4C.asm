ORG 1000H
A DB 1
B DB 9
C DB ?

ORG 2000H
MOV AL, A
MOV BL, B
MOV CL, C
CMP AL,BL
JZ IF
MOV CL, BL
JMP FIN
IF: MOV CL, AL
FIN: HLT
END