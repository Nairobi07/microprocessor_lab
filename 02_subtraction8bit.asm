; debug , the code not working
DATA SEGMENT
	prompt1 db 0ah,0dh,"Enter first number: $"
	prompt2 db 0ah,0dh,"Enter second number: $"
	msg1 db 0ah,0dh,"DIFFERENCE IS : $ "
	msg2 db 0ah,0dh,"DIFFERENCE IS NEGATIVE : $"
DATA ENDS
display MACRO msg
	lea dx,msg
	mov ah,09h
	int 21h
	ENDM

printD MACRO 
	add dl,30h
	mov ah,02h
	int 21h
	ENDM
printD MACRO 
	add dl,30h
	mov ah,02h
	int 21h
	ENDM
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
start: 	mov ax,DATA
       	mov DS,ax
	display prompt1
	mov ah,01h
	int 21h
	sub al,30h
	
	mov bh,al
	mov ah,01h
	int 21h
	sub al,30h
	mov bl,al
	
	display prompt2
	
	mov ah,01h
	int 21h
	sub al,30h
	mov ch,al
	mov ah,01h
	int 21h
	sub al,30h
	mov cl,al
	
	cmp cx,bx
	jz zero 
	jnc negative
	clc
	
	mov al,bl
	sub al,cl
	mov ah,00h
	aas
	mov cl,ah
	;store lower digit of result in bl
	mov bl,al
	mov al,bh
	sub al,ch
	mov ah,00h
	aas
	
	add al,cl
	;store higher digit of result in bh
	mov bh,al
	
	display msg1
	mov dl,bh
	printD
	
	
	mov dl,bl
	printD
	
	jmp terminate

zero: 	display msg1
	mov dl,00h
	printD
	jmp terminate
	
negative:	mov al,cl
	sub al,bl
	mov ah,00h
	aas
	mov bl,ah
	mov cl,al
		
	mov al,ch
	sub al,bh
	mov ah,00h
	aas
	add al,bl
	mov ch,al
	display msg2
	mov dl,ch
	printD
	mov dl,cl
	printD
	
terminate: mov ah,4ch
	 int 21h
	 CODE ENDS
	 END start
	
