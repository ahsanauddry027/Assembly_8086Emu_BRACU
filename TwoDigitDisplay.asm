.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

msg db "Write a Number to multiply by x10: $"
msg2 db "The Result of the multiplication is: $"

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here

;Output two digit numbers Using Implicit Loop

;Multiplying The number by 10

LEA DX,msg
MOV AH,9
INT 21h

MOV AH,1
INT 21h

SUB AL,30h
MOV AH,0

MOV BL, 10
MUL BL


;Displaying the Two Digit number

MOV BX,AX

;Printing New Line

MOV AH,2
MOV DL, 10
INT 21h

MOV AH,2
MOV DL,12
INT 21h

;Dividing the Number

MOV AH,0
MOV AL,0

MOV AL,BL
MOV BH,0
MOV BL,10

DIV BL

MOV CL,AL
MOV CH,AH


MOV AH,2
MOV DL,10
INT 21h

MOV AH,2
MOV DL,13
INT 21h

LEA DX, msg2
MOV AH,9
INT 21h

MOV DH,0
MOV DL,0

MOV AH,2
MOV DL,CL ; CL contains the Quotient
ADD DL,30h
INT 21h

MOV AH,2
MOV DL,CH ; CH Contains the remained
ADD DL,30h
INT 21h


;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
