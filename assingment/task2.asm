org 0x0100

jmp main

funct:
    push bp
    mov bp ,sp
    push bx 
    push ax

    mov bx , [bp+6]
    mov ax , [bp+4]

    cmp ax , 0
    jne change
    jmp last
    change:
    cmp bx ,ax
    jnb ch1
    jmp less
    ch1:
    sub bx ,ax
    push bx
    push ax
    call funct
    jmp last

    less:
        push ax
        push bx
        call funct
        jmp end
        last:
        mov dx , bx
    
    pop ax 
    pop bx
    pop bp
    ret 4


main:

mov ax , 100
mov bx , 200

push ax 
push bx
call funct

mov ax , 0x4c00
int 0x21