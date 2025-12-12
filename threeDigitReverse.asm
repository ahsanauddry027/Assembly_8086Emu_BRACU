
.MODEL SMALL
 
.STACK 100H

.DATA

; declare variables here   


.CODE
MAIN PROC

; initialize DS

                 
;exit to DOS
EXIT:                       
MOV AX,4C00H
INT 21H

MAIN ENDP
END MAIN