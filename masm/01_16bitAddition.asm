data segment
        msg1 db 0ah,0dh, "Enter first number : $"
        msg2 db 0ah,0dh, "Enter second number : $"
        msg3 db 0ah,0dh, "Result is : $"
        n1 db 07h dup(?)
        n2 db 07h dup(?)
data ends
display macro msg
	 lea dx,msg
	 mov ah,09h
	 int 21h
	 endm
readDigit macro 
	  mov ah,01h
          int 21h
          sub al,30h
	  endm
printDigit macro
	  add dl,30h
          mov ah,02h
          int 21h
	  endm
code segment
        assume cs:code,ds:data
        start: mov ax,data
               mov ds,ax
               mov si,offset n1
               mov di,offset n2
	       
	       display msg1
               mov cl,04h
        first: readDigit
               mov [si],al
               inc si
               dec cl
               jnz first

	       display msg2
               mov cl,04h
       
       second: readDigit
               mov [di],al
               inc di
               dec cl
               jnz second

               clc
               mov cl,04h      
     addition: dec di
               dec si
               mov al,[si]
               mov bl,[di]
               adc al,bl
               mov ah,00h
               aaa
               mov [di],al
               dec cl
               jnz addition

	             display msg3                          
               mov cl,04h  
       print:  mov dl,[di]
	             printDigit
               inc di
               dec cl
               jnz print
               
	       mov ah,4ch
               int 21h
code ends
end start


/*
(ad16.asm,  masm ad16.asm, link ad16.obj ,ad16.exe)
OUTPUT
------
Enter first number : 1234
Enter second number : 6789
Result is : 8023

Enter first number : 1500
Enter second number : 3600
Result is : 5100
*/
