.686
.model flat,stdcall
.data
x dw -13d 
y dw 26d 
z dw 15d 
M dw 0
.code
ExitProcess PROTO STDCALL :DWORD
Start:
   

   mov         ax,z ;����������� �������� ���������� z � ������� ax
   rcl         ax,3 ;����� ���������� z �� 3 ������� ����� 
   
   imul        ax,5 ;��������� ax �� 5
   sub         ax,x ;��������� x �� ax 
   add		   ax,1 ;�������� ax � 1
   
   mov         cx,x ;����������� �������� ���������� x � ������� cx     
   mov         bx,y ;����������� �������� ���������� y � ������� bx  
   imul        ax,bx ;�������� ��� ����� ax � bx
   

   add		   ax,cx ;�������� ax � cx

   mov         M,cx ;������ ���������� � ���������� M
 
 
exit:
Invoke ExitProcess,M
End Start