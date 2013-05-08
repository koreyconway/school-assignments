#line 1 "LCD_test.c"
#line 1 "C:/icc/include/stdio.h"


#line 1 "C:/icc/include/stdarg.h"


typedef char *va_list;


char *_va_start(char *, void *, int);

#line 9 "C:/icc/include/stdarg.h"



#line 13 "C:/icc/include/stdarg.h"




#line 4 "C:/icc/include/stdio.h"
#line 1 "C:/icc/include/_const.h"




#line 10 "C:/icc/include/_const.h"







#line 5 "C:/icc/include/stdio.h"

int getchar(void);
int putchar(char);
int puts(const char *);
int printf(const char *, ...);
int vprintf(const char *, va_list va);
int sprintf(char *,const char *, ...);

int scanf(const char *, ...);
int sscanf(char *,const char *, ...);
int vscanf(const char *, va_list va);











#line 2 "LCD_test.c"
#line 1 "M:\sysc 2003\assignment 4/hcs12dp256.h"




#line 6 "M:\sysc 2003\assignment 4/hcs12dp256.h"
#line 1 "C:/icc/include/hc12def.h"




#line 6 "C:/icc/include/hc12def.h"
typedef enum {
	BAUD38K = 13, BAUD19K = 26, BAUD14K = 35,
	BAUD9600 = 52, BAUD4800 = 104, BAUD2400 = 208,
	BAUD1200 = 417, BAUD600 = 833, BAUD300 = 2273
	} BaudRate;
void setbaud(BaudRate);




































typedef struct
	{
	char fp1[5];
	char fp2[5];
	} _FP_CONTEXT;

void _FP_SaveContext(_FP_CONTEXT *buf);
void _FP_RestoreContext(_FP_CONTEXT *buf);

void write_eeprom (unsigned char *addr, unsigned char b);

#pragma nonpaged_function _icall
int _icall(int (*)(void));

#line 7 "M:\sysc 2003\assignment 4/hcs12dp256.h"


#line 11 "M:\sysc 2003\assignment 4/hcs12dp256.h"














































































































































































































































































































































































































































































































































































































































































































































#line 3 "LCD_test.c"
asm (".include 'BasicLCD.s'")

void init(void);
void delay(int ms);



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


