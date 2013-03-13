#include <stdio.h>
#include "hcs12dp256.h"

main(){

	  char a = 0x09;
	  char x = 0;
	DDRK = 0xFF;	  			   				   // initialize port K for LED output 
	
	PTM = 0x08;									   // initialize port M 3 bit to 1 to enable U7_EN
	DDRT = 0x0F;								   // initialize the data direction register for port T
	while(x<10){
		printf("x : %d",x);
		printf("\n");
		printf("a : %d",a);
		printf("\n");
		
		PTT = a;
		a--;
		x++;
		delay(100);
		if(x==10){
			x=0;
			a=9;
			
				PORTK = 0x2F;
				delay(100);
				PORTK = 0x00;
			
		}
	}
}


void delay (int ms){

	 const int delayConstant = 1234;
	 int i, j;
	 
	 for (i=0; i<ms; i++) {
	 	 for (j=0; j<delayConstant; j++) {
		 }
	}
	
}