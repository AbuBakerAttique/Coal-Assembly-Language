org 0x0100

jmp main

data : dw 12,54,66,43

diagnal_sum:
    push bp
    mov bp , sp
    sub sp , 2
    sub sp , 2
    sub sp , 2
    sub sp , 2
    push si
    push di
    push ax 
    push bx
    push cx
    push dx 
    

    mov word[bp-2] , 0
    mov word[bp-4] , 0
    mov word[bp-6] , 0


    mov di , 0
    mov ax , [bp+4]
    mov [bp-2] , ax   
    mov cx , 0
    mov bx , [bp+6]
    L1:
        mov ax , [bp-2]
        mul di
        add ax , di
        mov si , ax
        shl si ,1
        mov dx , [bx+si]
        add [bp-4] , dx   
        inc di
        add cx ,1
        cmp cx , [bp-2]
        jne L1
        
    mov word[bp-8] , 0
    mov di , [bp-2]   ;
    mov cx , 0
    sub di , 1
    L2:
        mov ax , [bp-2]
        mul di
        add ax , [bp-8]
        mov si , ax
        shl si ,1
        mov dx , [bx+si]
        add [bp-6] , dx     
        add word[bp-8] ,1
        dec di
        add cx ,1
        cmp cx , [bp-2]
        jne L2

        mov ax , [bp-4]
        add dx , [bp-6]
        mov bx , 0
        add bx , ax
        add bx dx

        
        
        pop dx
        pop cx
        pop bx
        pop ax 
        pop di
        pop si
        add  sp ,2
        add  sp ,2
        add  sp ,2
        add  sp ,2
        pop bp
        ret 4




main:

mov ax , 2
mov bx , data
push bx
push ax
call diagnal_sum

mov ax , 0x4c00
int 0x21