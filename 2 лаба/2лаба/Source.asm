.686
.model flat,stdcall
.stack 100h
.data
arr dw 714Ah, 6B15h, 431Bh
L dw 0
M dw 0
.code
ExitProcess PROTO STDCALL :DWORD
Start:
xor eax,eax ;очистка регистра EAX 
xor ebx,ebx ;очистка регистра EBX 
xor ecx,ecx ;очистка регистра ECX 
xor edx,edx ;очистка регистра EDX
xor edi,edi ;очистка регистра EDI
xor esi,esi ;очистка регистра EDI
lea esi,[arr] ; для вычисления адреса
lea edi,[arr] ; для вычисления адреса 
mov ecx,3 ; указываем в регистре ECX 
mov edx, 714Ah;
@cycle: ;начало цикла
lodsw ; прочитал число из строки
xor eax,ebx;
mov ebx,eax;
stosw;
loop @cycle;
imul eax,2;
and edx,00F0h;
sub eax,edx;
mov ebx,3111h;
ja pp1
jnbe pp2
pp1:
not eax;
add eax,1b;
mov M,ax;
jmp gg;
jmp exit;
pp2:
not eax;
jmp gg;
jmp exit;

gg:
mov ebx,eax;
mov edx,0;
shl eax,15;
cmp eax,edx; 

jle adr1
jng adr2

adr1:
add ebx,0999h;
jmp exit

adr2:
or ebx,5A5Ah
jmp exit

exit:
Invoke ExitProcess,1
End Start