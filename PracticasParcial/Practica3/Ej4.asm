PIO EQU 30H

ORG 1000H
MSJ DB "HOLA SOY AGUSTIN"
FIN DB ?

ORG 2000H
MOV AL, 0
OUT PIO+3, AL
MOV AL, 0FDH
OUT PIO+2, AL
IN AL, PIO
AND AL, 0FDH
OUT PIO, AL
MOV BX, OFFSET MSJ
MOV CL, OFFSET FIN - OFFSET MSJ
POLL: IN AL, PIO
AND AL, 1
JNZ POLL
MOV AL, [BX]
OUT PIO+1, AL
IN AL, PIO
OR AL, 02H
OUT PIO, AL
IN AL, PIO
AND AL, 0FDH
OUT PIO, AL
INC BX
DEC CL
JNZ POLL
HLT
END