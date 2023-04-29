PIO   EQU 30H
      ORG 1000H
MSJ   DB "CONCEPTOS DE "
      DB "ARQUITECTURA DE "
      DB "COMPUTADORAS"
FIN   DB ?
      ORG 2000H
      MOV AL, 0FDH ; INICIALIZACION PIO PARA IMPRESORA
      OUT PIO+2, AL
      MOV AL, 0
      OUT PIO+3, AL
      IN AL, PIO
      AND AL, 0FDH
      OUT PIO, AL ; FIN INICIALIZACION
      MOV BX, OFFSET MSJ
      MOV CL, OFFSET FIN-OFFSET MSJ
POLL: IN AL, PIO
      AND AL, 1
      JNZ POLL
      MOV AL, [BX]
      OUT PIO+1, AL
      IN AL, PIO ; PULSO 'STROBE'
      OR AL, 02H
      OUT PIO, AL
      IN AL, PIO
      AND AL, 0FDH
      OUT PIO, AL ; FIN PULSO
      INC BX
      DEC CL
      JNZ POLL
      INT 0
      END

;chequear el bit de busy 
;enviar el caracter a pb
;generar el pulso de impresion strobe
