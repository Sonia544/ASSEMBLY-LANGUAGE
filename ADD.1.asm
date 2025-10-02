.MODEL SMALL
.STACK 100H
.DATA 

    MSG1    DB "ENTER A NUMBER FOR A (0-9):$"
    RESMSG  DB 0DH,0AH,"RESULT = $"
    
    A       DB ?
    RESULT  DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Prompt for A
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H
    
    ; Read A from user
    MOV AH, 01H
    INT 21H
    SUB AL, 30H   ; convert ASCII to number
    MOV A, AL
    
    ; Perform: 5 - A + 3
    MOV AL, 5
    SUB AL, A
    ADD AL, 3
    MOV RESULT, AL
    
    ; Show result message
    MOV AH, 09H
    LEA DX, RESMSG
    INT 21H
    
    ; Show result value
    MOV AL, RESULT
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    
    ; Exit program not mendetory like return 0
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
