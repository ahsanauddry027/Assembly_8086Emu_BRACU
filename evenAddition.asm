.MODEL SMALL
 
.STACK 100H

.DATA

finalsum dw 0
temp dw 0

.CODE
MAIN PROC

MOV AX,@DATA
MOV DS,AX
 
mov ax,120
mov bx,400

mov cx,0


loopstart:
        
        CMP ax,bx
        MOV temp,ax
        
        JG  loopend        

        mov cl,2
        div cl
        
        CMP ah,0
        JNE goOdd
        
        MOV ax,temp
        ADD finalsum,ax
        ADD ax,2
        
        jmp loopstart
         
        goOdd:
                ADD ax,1
                ADD finalsum,ax
                add ax,2
                
        JMP loopstart         
loopend:              
        
       
        
        
                   
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
