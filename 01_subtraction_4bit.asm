; SUBTRACTION OF 4 BIT NUMBERS

DATA SEGMENT
      prompt1 DB 0ah,"Enter first Number : $"
      prompt2 DB 0ah,"Enter second Number : $"
      prompt3 DB 0ah,"result is $"
DATA ENDS

CODE SEGMENT
	ASSUME DS:DATA,CS:CODE

START : MOV AX,DATA
      	MOV DS,AX

     	  LEA DX,prompt1
      	MOV AH,09H
      	INT 21H
      
      	MOV AH,01H
      	INT 21H
      	SUB AL,30H
      	MOV BL,AL

      	LEA DX,prompt2
      	MOV AH,09H
      	INT 21H

      	MOV AH,01H
      	INT 21H
      	SUB AL,30H
 
      	LEA DX,prompt3
      	MOV AH,09H
      	INT 21H
	
      	SUB BL,AL
	      ADD BL,30H
	      MOV DL,BL
     	  MOV AH,02H
      	INT 21H
      
	      MOV AH,4CH
      	INT 21H

CODE ENDS
END START
