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
xor eax,eax ;������� �������� EAX 
xor ebx,ebx ;������� �������� EBX 
xor ecx,ecx ;������� �������� ECX 
xor edx,edx ;������� �������� EDX
xor edi,edi ;������� �������� EDI
xor esi,esi ;������� �������� EDI
lea esi,[arr] ; ��� ���������� ������
lea edi,[arr] ; ��� ���������� ������ 
mov ecx,3 ; ��������� � �������� ECX 
mov edx, 714Ah;
@cycle: ;������ �����
lodsw ; �������� ����� �� ������
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