#include <8051.h>  
#include <string.h>
void main()

{
	unsigned int i, k, j, p;
	unsigned char* str = "Hello!";
	unsigned char* str2 = "Friends";
	unsigned char* str3 = " ";
    int n = 0xC0;
	P0 = 0x38;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0x8A;
	P2 = 0x1;
	P2 = 0x0;
	P0 = 0xC;
	P2 = 0x1;
	P2 = 0x0;

	for (i = 0; i < 6; i++){
		P0 = str[i];
		P2 = 0x3;
		P2 = 0x2;
	}
while(1){


		for(i=0;i<8;i++){
			for(k=9-2*i;k<=7;k++){
 				P0 = str2[k];
 				P2 = 0x3;  
 				P2 = 0x2;
			}
			P0 = 0xC0;  
			P2 = 0x1;
			P2 = 0x0;

           
		}
	        for (k=0; k<2; k++){
		         P0 = 0x14;
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+1;  
			P2 = 0x1;
			P2 = 0x0;
	        for (i=0; i<7; i++){
		         P0 = str2[i];
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+1;  
			P2 = 0x1;
			P2 = 0x0; 
	        for (k=0; k<2; k++){
		         P0 = 0x14;
		         P2 = 0x3;
		         P2 = 0x2;
	        }
	        for (i=0; i<7; i++){
		         P0 = str2[i];
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+3;  
			P2 = 0x1;
			P2 = 0x0;
	        for (k=0; k<2; k++){
		         P0 = 0x14;
		         P2 = 0x3;
		         P2 = 0x2;
	        }
	        for (i=0; i<7; i++){
		         P0 = str2[i];
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+5;  
			P2 = 0x1;
			P2 = 0x0;
	        for (k=0; k<2; k++){
		         P0 = 0x14;
		         P2 = 0x3;
		         P2 = 0x2;
	        }
	        for (i=0; i<7; i++){
		         P0 = str2[i];
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+7;  
			P2 = 0x1;
			P2 = 0x0;
	        for (k=0; k<2; k++){
		         P0 = 0x14;
		         P2 = 0x3;
		         P2 = 0x2;
	        }
	        for (i=0; i<7; i++){
		         P0 = str2[i];
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+9;  
			P2 = 0x1;
			P2 = 0x0;
	        for (k=0; k<2; k++){
		         P0 = 0x14;
		         P2 = 0x3;
		         P2 = 0x2;
	        }
	        for (i=0; i<5; i++){
		         P0 = str2[i];
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+11;  
			P2 = 0x1;
			P2 = 0x0;
	        for (k=0; k<2; k++){
		         P0 = 0x14;
		         P2 = 0x3;
		         P2 = 0x2;
	        }
	        for (i=0; i<3; i++){
		         P0 = str2[i];
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+13;  
			P2 = 0x1;
			P2 = 0x0;
	        for (k=0; k<2; k++){
		         P0 = 0x14;
		         P2 = 0x3;
		         P2 = 0x2;
	        }
	        for (i=0; i<1; i++){
		         P0 = str2[i];
		         P2 = 0x3;
		         P2 = 0x2;
	        }
			P0 = n+15;  
			P2 = 0x1;
			P2 = 0x0;
		    P0 = 0x14;
		    P2 = 0x3;
		    P2 = 0x2;
	}
}
end;
