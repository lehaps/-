#include <8051.h>
void main()
{

unsigned char i,j; 
unsigned char massiv [21]=
{	

0xC0, 
0xF9,
0xF9,
0xF9,
0xA4,
0xF9,
0xB0,
0xF9,
0x99,
0xF9,
0x92,
0xF9,
0x82,
0xF9,
0xF8,
0xF9,
0x80,
0xF9,
0x90,
0xF9,
0xFF 
};

P1=massiv [21]; 
i=0;
while (1){
if(P30==1){
P2=massiv[i];
i++; 
for(j=0;j<100;j++)

continue;
}
if(P31==1){
i=0;
}
}

P2=massiv[21]; 
while(1);
}
