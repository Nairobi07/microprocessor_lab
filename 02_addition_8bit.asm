DATA SEGMENT
        
        prompt1 DB 0ah,"Enter first number : $"
        prompt2 DB 0ah,"Enter second number : $"
        msg DB 0ah,"Result is : $"

DATA ENDS
CODE SEGMENT

	ASSUME DS:DATA, CS:CODE

START: MOV AX,DATA
       MOV DS,AX

       LEA DX,prompt1
       MOV AH,09H
       INT 21H

       MOV AH,01H
       INT 21H
       SUB AL,30H
       MOV BH,AL

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
       MOV CH,AL

       MOV AH,01H
       INT 21H
       SUB AL,30H
       MOV CL,AL

       ;Performing AL=BL+CL
       ADD BL,CL
       MOV AL,BL
       ;Splitting AL into AH & AL
       MOV AH,00H
       AAA
       ;Saving result of first addition to BL(temperory)
       MOV BL,AL

       ;Performing AL=BH+CH+AH
       MOV AL,AH
       ADD AL,BH
       ADD AL,CH
       ;Splitting result into AH & AL
       MOV AH,00H
       AAA
       ;CH=AH,CL=AL
       MOV CH,AH
       MOV CL,AL

       LEA DX,msg
       MOV AH,09H
       INT 21H
       
       ;Converting result to ascii
       ADD CH,30H
       ADD CL,30H
       ADD BL,30H


       ;Printing Result
       ;If first digit is zero skip it
       CMP CH,30H
       JE LB

       MOV DL,CH
       MOV AH,02H
       INT 21H
	
 LB:
       MOV DL,CL
       MOV AH,02H
       INT 21H

       MOV DL,BL
       MOV AH,02H
       INT 21H

       MOV AH,4CH
       INT 21H

CODE ENDS
END START
