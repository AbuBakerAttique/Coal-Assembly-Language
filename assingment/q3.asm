[org 0x0100]

jmp start

fun:
    push bp
    mov bp ,sp
    push ax
    push cx
    cmp cx , 0

    je return

    cmp cx , 1

    je return

    sub cx , 1
    push cx 
    call fun
    add dx , bx
    sub cx ,1
    push cx
    call fun
    add dx , bx

return:
        mov bx , cx
        pop cx
        pop ax
        pop bp
        ret 4 




start:


mov cx , 10
push cx
call fun


mov ax , 0x4c00
int 0x21