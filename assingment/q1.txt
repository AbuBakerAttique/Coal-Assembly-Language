[org 0x0100]

jmp start

value : dw 7,38,48,53

diagnal_sum:

     push bp
     mov bp , sp
     sub sp , 2
     sub sp , 2
     sub sp , 2
     sub sp , 2

     push di
     push si
     push ax 
     push bx
     push cx
     push dx 
    

    mov wd[bp-2] ,0
    mov wd[bp-4] ,0
    mov wd[bp-6] ,0


    mov di , 0
    mov ax , [bp+4]
    mov [bp-2] , ax   
    mov cx , 0
    mov bx , [bp+6]

loop1:
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

        jne loop1
        
       mov wd[bp-8] , 0
       mov di , [bp-2]   ;
       mov cx , 0

       sub di , 1


loop2:
        mov ax , [bp-2]
        mul di
        add ax , [bp-8]
        mov si , ax
        shl si ,1
        mov dx , [bx+si]
        add [bp-6] , dx     
        add wd[bp-8] ,1
        dec di
        add cx ,1
        cmp cx , [bp-2]

        jne loop2

        mov ax , [bp-4]
        add dx , [bp-6]
        mov bx , 0
        add bx , ax
        add bx dx

        
        
       
	 pop dx
         pop cx
         pop bx
         pop ax 
         pop si
         pop di


        add sp , 2
        add sp , 2
        add sp , 2
        add sp , 2

        pop bp
        ret 4


start:

	mov ax , 2

	mov bx , value

	push bx

	push ax

	call diagnal_sum

mov ax , 0x4c00

int 0x21