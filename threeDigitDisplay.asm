
;Displaying 3 digit Numbers
.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here

totalValue dw ? ; Carries the total value throught Division
first db ?      ; Carries the first Integer
second db ?     ; Carries the Second Integer
third db ?      ; Carries the Third Integer

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
MOV AH,0 
MOV AL,0

MOV AL,2
; While Taking User Input, it Converts to Hex
; While Hard coding a value in the Code, It's automatically the digit that you hardCoded
; No Hex there for hard coded value
; So No need to Sub 30h there.


MOV BL,100

MUL BL

ADD AX,38

MOV totalValue, AX ; Storing 3 digit bit in totalvalue

MOV BL,100

MOV AX, totalvalue

DIV BL

; now the quotient is Stored in the AL, and Remaineder in the AH

MOV first, AL

MOV BX,0
MOV BH,0
MOV BL, AH

MOV totalvalue, BX

MOV AX,0

MOv AX, totalvalue
MOV BL, 10

DIV BL

MOV second, AL
MOV third, AH

MOV AH,2
MOV DL,first
ADD DL, 30h
INT 21h

MOV AH,2
MOV DL,second
ADD DL, 30h
INT 21h


MOV AH,2
MOV DL,third
ADD DL, 30h
INT 21h









;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
