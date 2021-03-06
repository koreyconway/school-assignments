#include <stdio.h>
#include "hcs12dp256.h"


void main(){

	 
	 SPI1CR1 = 0x00;		   //Turn off SPI
	 
	 DDRP = 0xFF;
	 DDRT = 0xFF;
	 
	 PTP = 0x20; 			   //STEPPER EN at PP5  
	 
	 delay(20);
	 
	 //use _360_clockwise() twice to rotate 
	 //stepper motor rotate clockwise 2 turns
	 _360_clockwise();
	 delay(300);
	 _360_clockwise();
	 
	 delay(300);
	 //use _360_anti_clockwise() twice to rotate 
	 //stepper motor rotate ant-clockwise 2 turns
	 _360_anti_clockwise();
	 delay(300);
	 _360_anti_clockwise();
	 
	 
	 
	 printf("end");
	 
}

void _360_anti_clockwise(){
	 int i ;
	 //stepper motor 360 degree turn anti-clockwise
	 for(i=0;i<5;i++){
	 PTT = 0x60;
	 delay(10);
	 PTT = 0x20;
	 delay(10);
	 PTT = 0x00;
	 delay(10);
	 PTT = 0x40;
	 delay(10);	 
	 }	
}


void _360_clockwise(){
	 int i ;
	 //stepper motor 360 degree turn clockwise
	 for(i=0;i<5;i++){
	 PTT = 0x40;
	 delay(10);
	 PTT = 0x00;
	 delay(10);
	 PTT = 0x20;
	 delay(10);
	 PTT = 0x60;
	 delay(10);	 
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