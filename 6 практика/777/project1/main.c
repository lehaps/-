#include <8051.h>
void tput(unsigned char c1)
{
SBUF=c1;
while(!TI);
TI=0;
}

void main()
{
unsigned int i;
unsigned char src [14]={'n','y','n','b','I','u','u','e','B'};
TMOD = 0x20;
TH1 = 0xF4;
TR1 = 1;
PCON = 0x40;
     for(i=0; i<10; i++)
     {
     ACC = src[i]; 
     SCON = 0x40;
     tput (src[i]);
     }
while(1){}
}