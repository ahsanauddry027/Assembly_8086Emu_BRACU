.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here  

iterations dw ?

inner dw 1


.CODE
MAIN PROC

; initialize DS
MOV AX,@DATA
MOV DS,AX

; enter your code


MOV AH,1
INT 21h
SUB AL,30h
MOV AH,0

MOV iterations,AX

MOV CX,iterations


outerloop:
        
        INC inner
        
        MOV BL,1
        MOV BH,0
        
        MOV AH,2
        MOV DL,10
        INT 21h
        
        MOV AH,2
        MOV DL,13
        INT 21h
        
        innerloop:
        
                MOV DL,BL
                ADD DL,30h
                INT 21h
                
                INC BL
                
                CMP BX,inner
                JNE innerloop
                
loop outerloop
;exit to DOS
                     
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN
