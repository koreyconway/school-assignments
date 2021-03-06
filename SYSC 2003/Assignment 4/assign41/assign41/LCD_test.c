#include <stdio.h>
#include "hcs12dp256.h"
asm (".include 'BasicLCD.s'")

void init(void);
void delay(int ms);


//LCD subroutines
void LCD_display(char);
void Lcd2PP_Init(void);
void LCD_instruction(char);
void clearScreen(void);
void DisplayLCD(char string[], char string1[], char string2[]);

void main (){
	 
	 init();
	 Lcd2PP_Init();
	 	 
	 
	 
}

void clearScreen(void){
	 LCD_instruction(0x00);
	 DisplayLCD(" "," "," ");
	 LCD_instruction(0xC0);
	 DisplayLCD(" "," "," ");
}

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
	 	LCD_display(*string);
		string1 += 0x01;
		if(number == 16){
			LCD_instruction(0xC0);
		}
		if( *string1 == 0 ){
			break;
		}
	 }
	 for(;;){
	 	LCD_display(*string);
		string2 += 0x01;
		if(number == 16){
			LCD_instruction(0xC0);
		}
		if( *string2 == 0 ){
			break;
		}
	 }
}

void delay(int ms){
	 const int delayConstant = 1234;
	 int i,j;
	 
	 for(i=0;i<ms;i++){
	 	   for(j=0;j<ms;j++){
		   }
	 }
}


