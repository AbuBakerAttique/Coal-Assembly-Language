GLOBAL start 

start: 
	 ; to print roll number
	mov eax, 0x4 				
	mov ebx, 1 					
	mov ecx, rollnumber 			
	mov edx, rollnumber_length 			
	int 0x80 	

	; to print name

	mov eax, 0x4 				
	mov ebx, 1 					
	mov ecx, name			
	mov edx, name_length 			
	int 0x80 	

					


	; exit the program 
	mov eax, 0x1 				
	mov ebx, 0 					
	int 0x80 					 

	
SECTION .code: 

	rollnumber: db "P20-0560",  0xA,  0x0 
	rollnumber_length: equ $-message

	name: db "Abubaker", 0xA, 0x0
	name_length: equ $-name 

