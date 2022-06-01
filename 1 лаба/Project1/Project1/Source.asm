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
   

   mov         ax,z ;Перемещение значения переменной z в регистр ax
   rcl         ax,3 ;Сдвиг переменной z на 3 разряда влево 
   
   imul        ax,5 ;Умножение ax на 5
   sub         ax,x ;Вычитание x из ax 
   add		   ax,1 ;Сложение ax и 1
   
   mov         cx,x ;Перемещение значения переменной x в регистр cx     
   mov         bx,y ;Перемещение значения переменной y в регистр bx  
   imul        ax,bx ;Операция или между ax и bx
   

   add		   ax,cx ;Сложение ax и cx

   mov         M,cx ;Запись результата в переменную M
 
 
exit:
Invoke ExitProcess,M
End Start