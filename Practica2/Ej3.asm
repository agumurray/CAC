ORG 1000H
CHAR DB 41H

ORG 2000H
MOV BX, OFFSET CHAR
MOV AL, 1
PRINT: CMP BYTE PTR [BX], 5BH
JNZ PROX
JMP FIN
PROX: INT 7
ADD CHAR, 20H
INT 7
SUB CHAR, 20H 
INC CHAR
JMP PRINT
FIN: INT 0
END