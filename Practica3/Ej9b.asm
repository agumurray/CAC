PIC     EQU   20H
HAND    EQU   40H
N_HND   EQU   10
        ORG   40
IP_HND  DW    RUT_HND

        ORG   1000H
MSJ     DB    ?

        ORG   3000H
RUT_HND:PUSH  AX
        CMP CL,5
        JZ INVERTIR
        JS INVERTIR 
        MOV   AL,   [BX]
        OUT   HAND, AL
        INC   BX
        DEC   CL
        JMP FIN_RUT
        INVERTIR: MOV BX, OFFSET MSJ
        ADD BL, 4
        SUB BL, CH
        MOV AL, [BX]
        OUT HAND, AL
        INC CH
        DEC CL
        FIN_RUT: MOV   AL,   20H
        OUT   PIC,  AL
        POP   AX
        IRET

        ORG   2000H
        MOV   BX,   OFFSET MSJ
        MOV   CL,   5
        MOV CH, 0
        LEER: CMP CL,0
        JZ FIN_PALABRA
        INT 6
        INC BX
        DEC CL
        JMP LEER
        FIN_PALABRA: SUB BX,5
        MOV CL, 10
        CLI
        MOV   AL,   0FBH
        OUT   PIC+1,AL
        MOV   AL,   N_HND
        OUT   PIC+6,AL
        MOV   AL,   80H
        OUT   HAND+1,AL
        STI
LAZO:   CMP   CL,     0
        JNZ   LAZO
        IN    AL,     HAND+1
        AND   AL,     7FH
        OUT   HAND+1, AL
        INT   0
        END