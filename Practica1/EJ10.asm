ORG 1000H
VARA DW 1010H
VARB DW 2323H

ORG 3000H
SWAP: PUSH BX
MOV BX,SP
PUSH CX
PUSH AX
PUSH DX
ADD BX,6 ;llegamos a OFFSET direccion VARA
MOV CX, [BX]
PUSH BX
MOV BX,CX
MOV AX,[BX] ;copiamos valor de VARA en AX
POP BX
SUB BX,2 ;llegamos a OFFSET direccion VARB
MOV CX,[BX]
PUSH BX
MOV BX,CX
MOV DX,[BX] ;copiamos valor de VARB en DX
POP BX
MOV CX, [BX]
PUSH BX
MOV BX,CX
MOV [BX],AX ;copiamos valor de VARA en VARB
POP BX
ADD BX,2
MOV CX,[BX]
PUSH BX
MOV BX,CX
MOV [BX],DX ;copiamos valor de VARB en VARA
POP BX


POP DX 
POP AX
POP CX
POP BX
RET

ORG 2000H
MOV AX, OFFSET VARA
PUSH AX
MOV AX, OFFSET VARB
PUSH AX
CALL SWAP
POP AX
POP AX
HLT
END