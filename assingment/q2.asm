[org 0x0100]


jmp start

fun:
     push bp
     mov bp ,sp
     push bx 
     push ax

     mov bx , [bp+6]

     mov ax , [bp+4]

     cmp ax , 0

     jne position

     jmp end


position:
     cmp bx ,ax

     jnb val1

     jmp end
val1:
     sub bx ,ax
     push bx
     push ax
     call fun
     jmp end

end:
        push ax
        push bx
        call fun
        jmp end
end:
     mov dx , bx
    
    pop ax 
    pop bx
    pop bp
    ret 4


start:

	mov ax , 100
	mov bx , 200

	push ax 
	push bx
	call fun

mov ax , 0x4c00
int 0x21