include "emu8086.inc"
.model small
.stack 100h
.data 
ar1 db 3 dub ?
ar2 db 3 dub ? 
ar3 db 6 dub ?


.code
main proc
    mov ax,@data
    mov ds,ax
   
   printn "First List?" 
   mov cx,3 
   in1:
   mov ah,1
   int 21h
   mov ar1[si],al
   inc si
   loop in1
    printn ""         
   printn "Second List?"          
   xor cx,cx 
   mov cx,3
  
   in2:
   mov ah,1
   int 21h
   mov ar2[si],al
   inc si
   loop in2          
            
   xor cx,cx 
   mov cx,3
   ou1:
   mov al,ar1[di]
   mov ar3[si],al
   inc di 
   inc si
   loop ou1  
   
   xor cx,cx 
   mov cx,3 
            
   ou2:
   mov al,ar2[di]
   mov ar3[si],al
   inc di 
   inc si
   loop ou2 
    
   printn "" 
   printn "List After Concentation:"
   
   xor cx,cx 
   mov cx,6 
   
   
   ou:   
   mov ah,2
   mov dl,ar3[di]
   int 21h
   inc di 

   loop ou  
   
   
   exit:
   int 20h
endp
end main