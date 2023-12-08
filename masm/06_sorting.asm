data segment
        prompt1 db 0ah,0dh,"Enter the no of elements : $"
        prompt2 db 0ah,0dh,"Enter the numbers : $"
        result db 0ah,0dh,"Sorted array is : $"
        n db ?
        array db 09h dup(?)
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
	       display prompt1
               readDigit
               mov n,al
               mov cl,n
               display prompt2
               mov si,offset array
          read:readDigit
               mov [si],al
               inc si
               dec cl
               jnz read
               mov cl,n
         loop1:      
               mov ch,n
               mov si,offset array
         loop2:
               mov dl,[si]
               cmp dl,[si+1]
               jnc swap
               jmp swapped
          swap:mov dl,[si]
               xchg dl,[si+1]
               mov [si],dl
       swapped:inc si
               dec ch
               jnz loop2
               dec cl
               jnz loop1
               display result
               mov si,offset array
               mov cl,n
               inc si
         print:
               mov dl,[si]
               printDigit
               inc si
               dec cl
               jnz print
               mov ah,4ch
               int 21h
code ends
end start

/*
OUTPUT

   Enter the no of elements : 5
   Enter the numbers : 54321
   Sorted array is : 12345

   Enter the no of elements : 7
   Enter the numbers : 3421576
   Sorted array is : 1234567
   
*/
