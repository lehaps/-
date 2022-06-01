.686
.model flat,stdcall
.stack 100h
.data
arr_a dd 2.0

arr_b dd 12.0

arr_c dd 18.0

arr_len dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0
		dd 0.0

arr_sum dd 0.0
		dd 0.0
		dd 0.0


temp dd 0.0
result dd 0.0
coff dd -4.0
.code
ExitProcess PROTO STDCALL :DWORD
Start:
finit;инициализация сопроцессора
fld temp;помещаем ноль в st(0), далее он переместится в st(1)

;ax^2+bx+c=0 D=b^2-4ac
;Вычисление значения 'а',при котором D=b^2-4ac
fld arr_a[0*4];помещаем в st(0) 
fmul coff; умножаем на -4
fst temp;
fstp arr_len[0*4];помещаем значение 'а' в нулевой элемент массива
;Вычисление значения 'b', при котором D=b^2-4ac
fld arr_b[0*4];помещаем в st(0) 
fst temp;
fmul temp;
fstp arr_len[1*4];помещаем значение 'b' в первый элемент массива
;Вычисление значения 'с', при котором D=b^2-4ac
fld arr_c[0*4];помещаем в st(0) 
fst temp;
fstp arr_len[2*4];помещаем значение 'с' во второй элемент массива

;ax^2+cx+b=0 D=c^2-4ab
;Значение -4a уже хранится в arr_len[0*4]
;Вычисление значения 'b', при котором D=с^2-4ab
fld arr_b[0*4];помещаем в st(0) 
fst temp;
fstp arr_len[3*4];помещаем значение 'b' в третий элемент массива
;Вычисление значения 'с', при котором D=c^2-4ab
fld arr_c[0*4];помещаем в st(0) 
fst temp;
fmul temp;
fstp arr_len[4*4];помещаем значение 'c' в четвертый элемент массива

;bx^2+ax+c=0 D=a^2-4bc
;Вычисление значения 'a', при котором D=a^2-4bc
fld arr_a[0*4];помещаем в st(0) 
fst temp;
fmul temp;
fstp arr_len[5*4];помещаем значение 'a' в пятый элемент массива
;Вычисление значения 'b', при котором D=a^2-4bc
fld arr_b[0*4];помещаем в st(0) 
fmul coff; умножаем на -4
fst temp;
fstp arr_len[6*4];помещаем значение 'b' в шестой элемент массива
;Значение 'c' уже хранится в arr_len[2*4]

;bx^2+cx+a=0 D=c^2-4ab
;Значение -4a уже хранится в arr_len[0*4]
;Значение 'b' уже хранится в arr_len[3*4]
;Значение c^2 уже хранится в arr_len[4*4]

;cx^2+bx+a=0 D=b^2-4ac
;Значение -4a уже хранится в arr_len[0*4]
;Значение b^2 уже хранится в arr_len[1*4]
;Значение 'c' уже хранится в arr_len[2*4]

;cx^2+ax+b=0 D=a^2-4bc
;Значение a^2 уже хранится в arr_len[5*4]
;Значение -4b уже хранится в arr_len[6*4]
;Значение 'c' уже хранится в arr_len[2*4]

;Вычисление D=b^2-4ac
fld arr_len[0*4];помещаем в st(0)
fst temp;
fld arr_len[2*4];помещаем в st(0)
fmul temp;
fadd arr_len[1*4];
fstp arr_sum[0*4];


;Вычисление D=a^2-4bc
fld arr_len[6*4];помещаем в st(0)
fst temp;
fld arr_len[2*4];помещаем в st(0)
fmul temp;
fadd arr_len[5*4];
fstp arr_sum[1*4];


;Вычисление D=c^2-4ac
fld arr_len[0*4];помещаем в st(0)
fst temp;
fld arr_len[2*4];помещаем в st(0)
fmul temp;
fadd arr_len[4*4];
fstp arr_sum[2*4];

;Для D=b^2-4ac
cmp arr_sum[0*4],0;
je x10
jg x11 
jle x12

x10:
;если мы попали сюда то в уравнениях ax^2+bx+c=0 и cx^2+bx+a=0 будет 1 корень
jmp gg;

x11:
;если мы попали сюда то в уравнениях ax^2+bx+c=0 и cx^2+bx+a=0 будет 2 корня
jmp gg;

x12:
;если мы попали сюда то в уравнениях ax^2+bx+c=0 и cx^2+bx+a=0 не будет корней
jmp gg;
 
gg:
;Для D=a^2-4bc
cmp arr_sum[1*4],0;
je x20
jg x21 
jle x22

x20:
;если мы попали сюда то в уравнениях bx^2+ax+c=0 и cx^2+ax+b=0 будет 1 корень
jmp bb;

x21:
;если мы попали сюда то в уравнениях bx^2+ax+c=0 и cx^2+ax+b=0 будет 2 корня
jmp bb;

x22:
;если мы попали сюда то в уравнениях bx^2+ax+c=0 и cx^2+ax+b=0 не будет корней
jmp bb;

bb:
;Для D=c^2-4ac
cmp arr_sum[2*4],0;
je x30
jg x31 
jle x32

x30:
;если мы попали сюда то в уравнениях bx^2+cx+a=0 и ax^2+cx+b=0 будет 1 корень
jmp exit;

x31:
;если мы попали сюда то в уравнениях bx^2+cx+a=0 и ax^2+cx+b=0 будет 2 корня
jmp exit;

x32:
;если мы попали сюда то в уравнениях bx^2+cx+a=0 и ax^2+cx+b=0 не будет корней
jmp exit;

exit:
Invoke ExitProcess,1
End Start