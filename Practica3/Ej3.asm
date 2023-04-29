PIC     EQU 20H 
TIMER   EQU 10H
PIO     EQU 30H
N_CLK   EQU 10

        ORG 40
IP_CLK  DW  RUT_CLK

        ORG 1000H
INICIO  DB  1

        ORG 3000H
RUT_CLK:CMP INICIO, 0
        JNZ COMP
        NOT DL
COMP:   CMP DL,0
        JNZ LUCES_IZQ
        MOV AL,     INICIO
        OUT PIO+1,  AL ;PB
        MOV CL, INICIO
        ADD CL, CL
        MOV INICIO, CL
        JMP FIN
LUCES_IZQ: IN AL, PIO+1
        CMP CH, 0
        JZ PRENDE
        MOV AL, INICIO
        OUT PIO+1, AL
        PRENDE: OUT PIO+1, AL
        MOV INICIO, AL
        MOV DH,0
        LOOP: CMP INICIO, 0
        JZ SALIDA
        INC DH
        SUB INICIO,2
        JMP LOOP
        SALIDA: MOV INICIO, DH
        INC CH
        CMP CH,7
        JNZ FIN
        MOV CH,0
        NOT DL
        FIN:MOV AL,0
        OUT TIMER,  AL
        MOV AL,     20H
        OUT PIC,    AL
        IRET

        ORG 2000H
        MOV DL, 0
        MOV CH,0
        CLI
        MOV AL,     0FDH
        OUT PIC+1,  AL
        MOV AL,     N_CLK
        OUT PIC+5,  AL
        MOV AL,     1
        OUT TIMER+1,AL
        MOV AL, 0
        OUT PIO+3,  AL ;CB
        OUT PIO+1,  AL ;PB
        OUT TIMER,  AL
        STI
LAZO:   JMP LAZO
        HLT
        END