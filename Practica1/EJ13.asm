ORG 1000H
VOCALES DB "AaEeIiOoUu"
FIN DB ?
CHAR DB "u"

ORG 3000H
ES_VOCAL: CMP DL, 0
INC BX
DEC DL
JZ FINN
CMP [BX], AL
JNZ ES_VOCAL
MOV CX, 0FFH
FINN: RET

ORG 2000H
MOV AL, CHAR
MOV BX, OFFSET VOCALES - 1
MOV DL, OFFSET FIN - OFFSET VOCALES + 1
MOV CX,00H
CALL ES_VOCAL
HLT
END