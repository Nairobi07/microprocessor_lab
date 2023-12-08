data segment
    msg1 db 0ah, 0dh, "Enter first number : $"
    msg2 db 0ah, 0dh, "Enter second number : $"
    msg3 db 0ah, 0dh, "Result is : $"
    n1 db 09h dup(?)
    n2 db 09h dup(?)

data ends
display   macro msg
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
    assume cs:code, ds:data
start:  mov ax, data
        mov ds, ax
        mov si, offset n1
        mov di, offset n2
        display msg1
        mov cx, 08h
first:  readDigit
        mov [si], al
        inc si
        dec cx
        jnz first
        display msg2
        mov cx, 08h
second: readDigit
        mov [di], al
        inc di
        dec cx
        jnz second
        clc
        mov cx, 08h
addition:   dec di
            dec si
            mov al, [si]
            mov bl, [di]
            adc al, bl
            mov ah, 00h
            aaa
            mov [di], al
            dec cx
            jnz addition
	    
            display msg3
            mov cx, 08h
	    jnc print
	    mov dl,01h
	    printDigit
print:  mov dl, [di]
        printDigit
        inc di
        dec cx
        jnz print
        mov ah, 4ch
        int 21h
code ends
end start

/*

OUTPUT
------
Enter first number : 12345678
Enter second number : 12345678
Result is : 24691356

Enter first number : 82376349
Enter second number : 18239855
Result is : 100616204

*/
