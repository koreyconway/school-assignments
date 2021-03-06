#include <stdio.h>
#include "hcs12dp256.h"
asm (".include 'BasicLCD.s'");


void delay(int ms);

char * asciistring;
sprintf(asciistring, "%u", intval);

//LCD subroutines
extern void LCD_display(char in);
extern void Lcd2PP_Init(void);
extern void LCD_instruction(char in);
//LCD subroutines overwritten
void clearScreen(void);
void DisplayLCD(char string[], char string1[], char string2[]);

void main (){
	 
	 int int_speed = 0;	   // initial speed
	 int int_temp = 150;	   // initial temprature
	 char *pointer_to_ascii;   
	 char ret_char[4] ="0000";
	 
	 //PTS = 0xFF;		   	//enabling U21_EN for the LCD
	 //PTT &= ~0x02;			//set RW=0
	 
	 Lcd2PP_Init();				// initializing the lcd
	 
	 convert_int_ascii(ret_char ,int_speed);
	 pointer_to_ascii =& ret_char[0];
	
	 LCD_instruction(0x00);		// setting the lcd to print on 1st row
	 DisplayLCD( "Speed :" ,pointer_to_ascii, "km/h" );		//print speed
	 
	 convert_int_ascii(ret_char ,int_temp);
	 pointer_to_ascii =& ret_char[0];
	 
	 LCD_instruction(0xC0);			 // setting the lcd to print on 2nd row
	 DisplayLCD("Temp :",pointer_to_ascii,"'C");		//print temprature
	 
	 for(;;){		  // infinite loop until board is reset
	 	
		if(key_pressed()=='E'){	  //if button 'E' is pressed
			int_speed++;		   //increment speed
			convert_int_ascii(ret_char ,int_speed);
			pointer_to_ascii =& ret_char[0];
			LCD_instruction(0x00);		// setting the lcd to print on 1st row 
	 		DisplayLCD( "Speed :" ,pointer_to_ascii, "km/h" );		//print speed
			
			convert_int_ascii(ret_char ,int_temp);
			pointer_to_ascii =& ret_char[0];
	 
	 		LCD_instruction(0xC0);			 // setting the lcd to print on 2nd row
	 		DisplayLCD("Temp :",pointer_to_ascii,"'C");		//print temprature
			
		}else if(key_pressed()=='D'){
			int_speed--;		   //decrement speed
			convert_int_ascii(ret_char ,int_speed);
			pointer_to_ascii =& ret_char[0];
			LCD_instruction(0x00);		// setting the lcd to print on 1st row 
	 		DisplayLCD( "Speed :" ,pointer_to_ascii, "km/h" );		//print speed
			
			convert_int_ascii(ret_char ,int_temp);
			pointer_to_ascii =& ret_char[0];
	 
	 		LCD_instruction(0xC0);			 // setting the lcd to print on 2nd row
	 		DisplayLCD("Temp :",pointer_to_ascii,"'C");		//print temprature
		}
		
	 }//end for
	 
	 
}


void clearScreen(void){
	 LCD_instruction(0x00);
	 DisplayLCD(" "," "," ");
	 LCD_instruction(0xC0);
	 DisplayLCD(" "," "," ");
}

/* the method takes in 3 pointers to arrays of any size that include the ascii 
* values that need to be printed 
* within the subroutine 'DisplayLCD(char)' is used to print each character
* one at a time.
*/
void DisplayLCD(char string[], char string1[], char string2[]){
	 int number = 0;
	 
	 for(;;){
	 	LCD_display(*string);
		string += 0x01;
		if(number == 16){
			LCD_instruction(0xC0);
		}
		if( *string == 0 ){
			break;
		}
	 }
	 for(;;){
	 	LCD_display(*string1);
		string1 += 0x01;
		if(number == 16){
			LCD_instruction(0xC0);
		}
		if( *string1 == 0 ){
			break;
		}
	 }
	 for(;;){
	 	LCD_display(*string2);
		string2 += 0x01;
		if(number == 16){
			LCD_instruction(0xC0);
		}
		if( *string2 == 0 ){
			break;
		}
	 }
}

// the method takes in  pointer to a array of size 4 and an integer 
// it coverts the integer into its ascii presentation and stores
// it into the array to which the pointer is pointing to

void convert_int_ascii(char ret_char[] , int x){
	 	ret_char[3]=0;		//NULL
		ret_char[2]=(48+(x%10));
		x=x/10;
		ret_char[1]=(48+(x%10));
		x=x/10;
		ret_char[0]=(48+(x%10));
		
}

// the subroutine polls for a key pressed on the HCS12 keypad

char key_pressed(void){
	 
	 char ret_char;
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
		  	ret_char = key_pad[row-1][col];
			bool = 0;
			delay(30);
		  } else if(ret_v == 0x20){
		  	col = 1;
		  	ret_char = key_pad[row-1][col];
			bool = 0;
			delay(30);
			if(row == 4){
				   break;
			}
		  } else if(ret_v == 0x40){
		  	col = 2;
		  	ret_char = key_pad[row-1][col];
			bool = 0;
			delay(30);
		  } else if(ret_v == 0x80){
		  	col = 3;
		  	ret_char = key_pad[row-1][col];
			bool = 0;
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
	return ret_char;
}

void delay(int ms){
	 const int delayConstant = 1234;
	 int i,j;
	 
	 for(i=0;i<ms;i++){
	 	   for(j=0;j<ms;j++){
		   }
	 }
}


