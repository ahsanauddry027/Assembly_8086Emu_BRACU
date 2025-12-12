
.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here   
jump db ? 
        
msg1 db "How many jumps? $"      

msg2 db "Coins in jump $"
 
ques db "? : $"

msg3 db "Total coins= $"   

msg4 db "Average coins per jump = $"

msg5 db "LEVEL UP! $"

msg6 db "Hey! Good job! $"

msg7 db "TRY HARDER! $"   

jumps dw ? 
sum dw 0
temp dw ?
avg dw ?

.CODE
MAIN PROC

; initialize DS

MOV AX,@DATA
MOV DS,AX

LEA DX, msg1
MOV AH,9
INT 21h

MOV AH,1
INT 21h
SUB AL,30h

MOV BL,AL
MOV BH,0

MOV jumps,BX

MOV CX,jumps

MOV BL,0
ADD BL,1
 
MOV AH,2
MOV DL,10
INT 21h
    
MOV AH,2
MOV DL,13
INT 21h

takingInputs:

    MOV AH,2
    MOV DL,10
    INT 21h
    
    MOV AH,2
    MOV DL,13
    INT 21h
    
    LEA DX, msg2
    MOV AH,9
    INT 21h
    
    MOV AH,2
    MOV DL,BL
    ADD DL,30h
    INT 21h
    
    LEA DX, ques
    MOV AH,9
    INT 21h
    
    MOV AH,1
    INT 21h
    SUB AL,30h
    
    MOV AH,0
    MOV DL,10
    MUL DL
    
    MOV temp,AX
    
    MOV AH,1
    INT 21h
    SUB AL,30h  
    
    MOV AH,0
    ADD temp,AX
    
    MOV AX,temp
    
    ADD sum,AX
    
    
    MOV AH,2
    MOV DL,10
    INT 21h
    
    MOV AH,2
    MOV DL,13
    INT 21h
    
    INC BL
LOOP takingInputs

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0

MOV AX,sum
MOV BX,jumps

DIV BX

MOV avg, AX

LEA DX,msg3
MOV AH,9
INT 21h

MOV AX,sum
MOV BL,10

DIV BL

;MOV BL,AL
MOV BH, AH

MOV AH,0

DIV BL

MOV CL,AL ; Quotien
MOV CH,AH ;remainder

;MOV AH,2
;MOV DL,BL
;ADD DL,30h
;INT 21h
 

CMP CL,0
JE nextDigit

MOV AH,2
MOV DL,CL
ADD DL,30h
INT 21h
          
nextDigit:
MOV AH,2
MOV DL,CH
ADD DL,30h
INT 21h

MOV AH,2
MOV DL,BH
ADD DL,30h
INT 21h

MOV AH,2
MOV DL,10
INT 21h


MOV AH,2
MOV DL,13
INT 21h

LEA DX,msg4
MOV AH,9
INT 21h

MOV AX,avg
MOV BL,10

DIV BL

MOV BL,AL
MOV BH, AH

MOV AH,2
MOV DL,BL
ADD DL,30h
INT 21h
          

MOV AH,2
MOV DL,BH
ADD DL,30h
INT 21h

MOV AH,2
MOV DL,10
INT 21h


MOV AH,2
MOV DL,13
INT 21h

MOV AX,0
MOV BX,0
MOV CX,0
MOV DX,0


MOV AX,sum

CMP AX,50
JLE secondCheck

LEA DX,msg5
MOV AH,9
INT 21h

JMP EXIT


secondCheck:
MOV AX,sum
CMP AX,10
JG thirdCheck

LEA DX,msg7
MOV AH,9
INT 21h

JMP EXIT


thirdCheck:
MOV AX,sum
CMP AX,30
JG forthCheck  

JMP EXIT   

forthCheck:
MOV AX,sum
CMP AX,40
JG EXIT

LEA DX,msg6
MOV AH,9
INT 21h


     

                 
;exit to DOS
EXIT:                       
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN