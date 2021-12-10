.MODEL SMALL

.DATA
A DB 34H, 22H, 12H, 24H
SIZ DW $-A

.CODE

MOV AX,@DATA
MOV DS,AX

MOV BX,SIZ
DEC BX

OUTLOOP:MOV CX,BX
        MOV SI,00

INLOOP: MOV AL,A[SI]
        INC SI
        CMP AL,A[SI]
        JB GOON
        XCHG AL,A[SI]
        MOV A[SI-1],AL
GOON:   LOOP INLOOP
        DEC BX
        JNZ OUTLOOP
        MOV AH,4CH
        INT 21H
        END


