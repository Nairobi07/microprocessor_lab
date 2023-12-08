data segment
        prompt1 db 0ah,0dh,"Enter the string : $"
        prompt2 db 0ah,0dh,"Enter the key : $"
        result1 db 0ah,0dh,"Key found$"
        result2 db 0ah,0dh,"Key not found$"
        array db 09h dup(?)
data ends
display macro msg
	 lea dx,msg
         mov ah,09h
         int 21h
	endm
readCharacter macro 
	mov ah,01h
        int 21h
	endm
code segment
        assume cs:code,ds:data
        start: mov ax,data
               mov ds,ax
               mov si,offset array
               display prompt1
               mov cl,00h
          stringScan:readCharacter
               cmp al,0dh
               jz ended
               mov [si],al
               inc cl
               inc si
               jmp stringScan
         ended:	display prompt2
                readCharacter
		mov bl,al
                mov ch,00h
         check: dec  si
                cmp bl,[si]
                jz found
                dec cl
                jnz check
                jmp notfound
         found: display result1
                jmp finish
      notfound: display result2
       finish:  mov ah,4ch
                int 21h
code ends
end start
/*
OUTPUT

Enter the string : viratkohli
Enter the key : k
Key found

Enter the string : viratkohli 
Enter the key : q
Key not found
*/
