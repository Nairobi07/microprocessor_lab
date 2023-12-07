DATA SEGMENT
	prompt1 db 0ah,0dh, "Enter first number : $" 
	prompt2 db 0ah,0dh, "Enter second number : $" 
	msg1 db 0ah,0dh,"Result is $" 
DATA ENDS
display MACRO msg
	LEA DX, msg
	MOV AH, 09H
	INT 21H
	ENDM
CODE SEGMENT
ASSUME CS:CODE ,DS:DATA
START:  MOV AX,DATA
	MOV DS,AX
	display prompt1
	MOV AH,01H
	INT 21H
	SUB AL,30H
	MOV CH,AL
	
	MOV AH,01h
	INT 21H
	SUB AL,30H
	MOV CL,AL
	display prompt2
	
	MOV AH,01h
	INT 21H
	SUB AL,30H
	MOV BH,AL
	
	MOV AH,01h
	INT 21H
	SUB AL,30H	
	MOV BL,AL		
	display msg1
	
	MOV AL,BL
	ADD AL,CL
	MOV AH ,00H
	AAA
	MOV BL,AL

	MOV AL,AH
	ADD AL,CH
	ADD AL,BH
	MOV AH,00H
	AAA
	MOV BH,AL
	
	CMP AH, 00H
	JE no_carry
	MOV DL, AH
	ADD DL,30H
	MOV AH,02H
	INT 21H
no_carry :
	MOV DL, BH
	ADD DL,30H
	MOV AH,02H
	INT 21H 
	
	MOV DL, BL
	ADD DL,30H
	MOV AH,02H
	INT 21H 
	
	MOV AH,4CH
	INT 21H	
CODE ENDS
END START
