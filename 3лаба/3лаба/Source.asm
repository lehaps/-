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
finit;������������� ������������
fld temp;�������� ���� � st(0), ����� �� ������������ � st(1)

;ax^2+bx+c=0 D=b^2-4ac
;���������� �������� '�',��� ������� D=b^2-4ac
fld arr_a[0*4];�������� � st(0) 
fmul coff; �������� �� -4
fst temp;
fstp arr_len[0*4];�������� �������� '�' � ������� ������� �������
;���������� �������� 'b', ��� ������� D=b^2-4ac
fld arr_b[0*4];�������� � st(0) 
fst temp;
fmul temp;
fstp arr_len[1*4];�������� �������� 'b' � ������ ������� �������
;���������� �������� '�', ��� ������� D=b^2-4ac
fld arr_c[0*4];�������� � st(0) 
fst temp;
fstp arr_len[2*4];�������� �������� '�' �� ������ ������� �������

;ax^2+cx+b=0 D=c^2-4ab
;�������� -4a ��� �������� � arr_len[0*4]
;���������� �������� 'b', ��� ������� D=�^2-4ab
fld arr_b[0*4];�������� � st(0) 
fst temp;
fstp arr_len[3*4];�������� �������� 'b' � ������ ������� �������
;���������� �������� '�', ��� ������� D=c^2-4ab
fld arr_c[0*4];�������� � st(0) 
fst temp;
fmul temp;
fstp arr_len[4*4];�������� �������� 'c' � ��������� ������� �������

;bx^2+ax+c=0 D=a^2-4bc
;���������� �������� 'a', ��� ������� D=a^2-4bc
fld arr_a[0*4];�������� � st(0) 
fst temp;
fmul temp;
fstp arr_len[5*4];�������� �������� 'a' � ����� ������� �������
;���������� �������� 'b', ��� ������� D=a^2-4bc
fld arr_b[0*4];�������� � st(0) 
fmul coff; �������� �� -4
fst temp;
fstp arr_len[6*4];�������� �������� 'b' � ������ ������� �������
;�������� 'c' ��� �������� � arr_len[2*4]

;bx^2+cx+a=0 D=c^2-4ab
;�������� -4a ��� �������� � arr_len[0*4]
;�������� 'b' ��� �������� � arr_len[3*4]
;�������� c^2 ��� �������� � arr_len[4*4]

;cx^2+bx+a=0 D=b^2-4ac
;�������� -4a ��� �������� � arr_len[0*4]
;�������� b^2 ��� �������� � arr_len[1*4]
;�������� 'c' ��� �������� � arr_len[2*4]

;cx^2+ax+b=0 D=a^2-4bc
;�������� a^2 ��� �������� � arr_len[5*4]
;�������� -4b ��� �������� � arr_len[6*4]
;�������� 'c' ��� �������� � arr_len[2*4]

;���������� D=b^2-4ac
fld arr_len[0*4];�������� � st(0)
fst temp;
fld arr_len[2*4];�������� � st(0)
fmul temp;
fadd arr_len[1*4];
fstp arr_sum[0*4];


;���������� D=a^2-4bc
fld arr_len[6*4];�������� � st(0)
fst temp;
fld arr_len[2*4];�������� � st(0)
fmul temp;
fadd arr_len[5*4];
fstp arr_sum[1*4];


;���������� D=c^2-4ac
fld arr_len[0*4];�������� � st(0)
fst temp;
fld arr_len[2*4];�������� � st(0)
fmul temp;
fadd arr_len[4*4];
fstp arr_sum[2*4];

;��� D=b^2-4ac
cmp arr_sum[0*4],0;
je x10
jg x11 
jle x12

x10:
;���� �� ������ ���� �� � ���������� ax^2+bx+c=0 � cx^2+bx+a=0 ����� 1 ������
jmp gg;

x11:
;���� �� ������ ���� �� � ���������� ax^2+bx+c=0 � cx^2+bx+a=0 ����� 2 �����
jmp gg;

x12:
;���� �� ������ ���� �� � ���������� ax^2+bx+c=0 � cx^2+bx+a=0 �� ����� ������
jmp gg;
 
gg:
;��� D=a^2-4bc
cmp arr_sum[1*4],0;
je x20
jg x21 
jle x22

x20:
;���� �� ������ ���� �� � ���������� bx^2+ax+c=0 � cx^2+ax+b=0 ����� 1 ������
jmp bb;

x21:
;���� �� ������ ���� �� � ���������� bx^2+ax+c=0 � cx^2+ax+b=0 ����� 2 �����
jmp bb;

x22:
;���� �� ������ ���� �� � ���������� bx^2+ax+c=0 � cx^2+ax+b=0 �� ����� ������
jmp bb;

bb:
;��� D=c^2-4ac
cmp arr_sum[2*4],0;
je x30
jg x31 
jle x32

x30:
;���� �� ������ ���� �� � ���������� bx^2+cx+a=0 � ax^2+cx+b=0 ����� 1 ������
jmp exit;

x31:
;���� �� ������ ���� �� � ���������� bx^2+cx+a=0 � ax^2+cx+b=0 ����� 2 �����
jmp exit;

x32:
;���� �� ������ ���� �� � ���������� bx^2+cx+a=0 � ax^2+cx+b=0 �� ����� ������
jmp exit;

exit:
Invoke ExitProcess,1
End Start