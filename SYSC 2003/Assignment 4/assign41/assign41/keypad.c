#include <stdio.h>
#include "hcs12dp256.h"


//		 Name : Tanzeel Rana
//		 Student # : 100835165

void main(){
	 
	 char row = 1;
	 char r = 1;
	 char col;
	 #define HEIGT 4
	 #define WIDTH 4
	 char key_pad[HEIGT][WIDTH]=                                                    
         {{'1','2','3','A'},                                              
          {'4','5','6','B'},                                              
          {'7','8','9','C'},                                              
          {'E','0','F','D'}};
		  
	 char bool = 1;
	 char ret_v;

	SPI1CR1 = 0x00;		   //Turn off SPI
	DDRP = 0x0F;		   //set P0-3 as outputs(PP0..3 for Key1..4)
	DDRH = 0x0F;		   //set H4-7 as inputs (Key5..8)
	
	while (bool){
		  
		  
		  PTM = 0x08;	   //Load data into U7 set U7_EN high (PM3) 
		  PTP = r;	   //Write Key1..4 via PP0..3 
		  PTM = 0x00;	   //set U7_EN low (PM3)
		  
		  ret_v = PTH;	   //get column 
		  ret_v &= 0xF0;   //clear the last 4 bits
		  
		  if(ret_v == 0x10){
		  	col = 0;
		  	printf("key : %c",key_pad[row-1][col]);
			printf("\n");
			delay(30);
		  } else if(ret_v == 0x20){
		  	col = 1;
		  	printf("key : %c",key_pad[row-1][col]);
			printf("\n");
			delay(30);
			if(row == 4){
				   break;
			}
		  } else if(ret_v == 0x40){
		  	col = 2;
		  	printf("key : %c",key_pad[row-1][col]);
			printf("\n");
			delay(30);
		  } else if(ret_v == 0x80){
		  	col = 3;
		  	printf("key : %c",key_pad[row-1][col]);
			printf("\n");
			delay(30);
		  } 
		  	if(r == 1){
				   r = 2;
				   row = 2;
			}else if(r == 2){
				  r = 4;
				  row = 3;
			}else if(r == 4){
				  r = 8;
				  row = 4;
			}else if(r == 8){
				  r = 1;
				  row = 1;
			}
		  
		  
	}//end while
	
	printf("End");
	
}


void delay (int ms){

	 const int delayConstant = 1234;
	 int i, j;
	 
	 for (i=0; i<ms; i++) {
	 	 for (j=0; j<delayConstant; j++) {
		 }
	}
	
}