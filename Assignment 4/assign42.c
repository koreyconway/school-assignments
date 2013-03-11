//------------------------------------------------------------------------------
//PAIR PROGRAMMING: LUBNA RASHEED 100776099 and SAMAN NISAR 100794279
//------------------------------------------------------------------------------
#include <stdio.h>
#include "hcs12dp256.h" //Header file

void init (void);
void delay (int ms);

int KeyPressed(void);
void Act (void);

void LED (int light);
void LEDoff(int light);

//LCD Subroutines
void LCD_display(char);
void Lcd2PP_Init(void);
void LCD_instruction(char);
void clearScreen (void);
void DisplayLCD(char string[], char string1[], char string2[]);

void main(){
	 
	 init();	 		// initialize hardware
	 Lcd2PP_Init();		// initialzation for the LCD dsiplay
	 Act (); 			// begin program to determine which key was pressed
	 printf("End");
}


//function to clear out the LCDdisplay screen
void clearScreen (void){
	 LCD_instruction(0x00);
	 DisplayLCD("     " ,"     " ,"     ");
	 LCD_instruction(0xC0);
	 DisplayLCD("     " ,"     " ,"     ");
}


//function to output strings to the LCD display
void DisplayLCD(char string[], char string1[], char string2[]) {

		int number = 0;  		   	 //movement of the cursor based on the number of characters
		
		//Lcd2PP_Init();
		//if (line == 2) {
			//LCD_instruction(0xC0); //adjust the location of the cursor
		//}
		
		for (;;) {
			LCD_display (*string);          //Display the string, where string is the character in the array.
			string += 0x01;
			number++;
			if (number == 16) {				// we finished writing to the first line, go to the next
				LCD_instruction(0xC0);
			}
			if ( *string == 0 ) break;
		}
		
		for (;;) {
			LCD_display (*string1);          //Display the string, where string is the character in the array.
			string1 += 0x01; 
			number++;
			if (number == 16) {				// we finished writing to the first line, go to the next
				LCD_instruction(0xC0);
			}
			if ( *string1 == 0 ) break;
		}
		
		for (;;) {
			LCD_display (*string2);          //Display the string, where string is the character in the array.
			string2 += 0x01; 
			number++;
			if (number == 16) {				// we finished writing to the first line, go to the next
				LCD_instruction(0xC0);
			}
			if ( *string2 == 0 ) break;
		}
}


//this function creates a delay of amount passed into the function.
void delay (int ms){

	 const int delayConstant = 1234;
	 int i, j;
 
 	 for (i=0; i<ms; i++) {
	 	 for (j=0; j<delayConstant; j++) {
		 }
	 }
}


// This function checks which key is pressed on the KeyPad.
int KeyPressed(void){  
     
	int key;
	 
	 SPI1CR1=0;		   	  // Turn off SPI
	 DDRP|=0x0F;          // Disable port P4 to P7 because those are for the DC motor
	 DDRH&=0x0F;          // Set port H - PH4 to PH7 as input.
	 
	 	for(key = 0;  key < 4;  key++){  // This loops 4 times

	 	   PTM |= 0x08;         	 // It Initializes port M using bitwise OR
	 	   PTP=0x01;          		 // Assign 1 to port P.
	 	   PTP<<=key;          		 // Bitwise left assignment 
	 	   PTM&=0xF7;          		 // Bitwise AND assignment to close port M

	 	   // PTH is port H that represents the coloumn and PTP is the port P that represents the row in the KeyPad

		// Key A
		   if ((PTH & 0xF0) == 0x80 && PTP == 0x01){
				printf(" A");                                   
	 	   	  	return 10;                                       
		   }

		// Key B
		   else if ((PTH & 0xF0) == 0x80 && PTP == 0x02){
				printf(" B");                                   
	 	   	  	return 11;                                       
		   }

		// Key 1 
		   else if ((PTH & 0xF0) == 0x10 && PTP == 0x01){
				printf(" 1");                                   
	 	   	  	return 1;                                       
		   }

		// Key 4
		   else if ((PTH & 0xF0) == 0x10 && PTP == 0x02){
				printf(" 4");                                   
	 	   	  	return 4;                                       
		   }

		// Key 7
		   else if ((PTH & 0xF0) == 0x10 && PTP == 0x04){
				printf(" 7");                                   
	 	   	  	return 7;                                       
		   }

		// Key E
		   else if ((PTH & 0xF0) == 0x10 && PTP == 0x08){
				printf(" E");                                   
	 	   	  	return 14;                                       
		   }

		// Key 2
		   else if ((PTH & 0xF0) == 0x20 && PTP == 0x01){
				printf(" 2");                                   
	 	   	  	return 2;                                       
		   }

		// Key 5
		   else if ((PTH & 0xF0) == 0x20 && PTP == 0x02){
				printf(" 5");                                   
	 	   	  	return 5;                                       
		   }

		// Key 8 
		   else if ((PTH & 0xF0) == 0x20 && PTP == 0x04){
				printf(" 8");                                   
	 	   	  	return 8;                                       
		   }

		// Key 0 
		   else if ((PTH & 0xF0) == 0x20 && PTP == 0x08){
				printf(" 0");                                   
	 	   	  	return 0;                                       
		   }

		// Key 3
		  else  if ((PTH & 0xF0) == 0x40 && PTP == 0x01){
				printf(" 3");                                   
	 	   	  	return 3;                                       
		   }

		// Key 6
		   else if ((PTH & 0xF0) == 0x40 && PTP == 0x02){
				printf(" 6");                                   
	 	   	  	return 6;                                       
		   }

		// Key F
		  else  if ((PTH & 0xF0) == 0x40 && PTP == 0x08){
				printf(" F");                                   
	 	   	  	return 15;                                       
		   }

		// Key 9
		   if ((PTH & 0xF0) == 0x40 && PTP == 0x04){
				printf(" 9");                                   
	 	   	  	return 9;                                       
		   }
		}
	 return 12;  // return any random number if none of the keys is selected
}


//Turn on LEDs
void LED (int light) {

	 DDRK = 0xFF;       // initialize port K for LED output
	 printf(" LED is on ");
	 PORTK |= light;     // turn green LED on   
}


//Turn off LEDs
void LEDoff(int light) {

	 DDRK = 0xFF;       // initialize port K for LED output
	 printf(" LED is off ");
	 PORTK &= ~light;     // turn green LED on
}


//Performs necessary actions for each key press
void Act (void){
	
	int CCS = 0 , X = 22, Heating = 0, Y = 0;
	int Vent = 0 , selectedKey;
	char *temp;
	
	for(;;){
		
		 selectedKey = KeyPressed();	// get the key number that was selected

		// --- End of Program --------------------------------------------------
		
		// Key 9
		if (selectedKey==9){
		   	
			LEDoff(0x01);
			LEDoff(0x02);
			LEDoff(0x04);
			LEDoff(0x08);
			delay(50);
			
			clearScreen();
		    LCD_instruction(0x00);
			DisplayLCD("Emergency Stop"," "," ");
			LCD_instruction(0xC0);
					
			break;				  		 		// Close the program
		}
		
		// Key A ---- Accelerate
		if (selectedKey==10){
			// Increase YYY by 1
			Y++;
			LCD_instruction(0x00);
			DisplayLCD("Accelerate "," "," ");
		}

		// Key B --- Brake
		else if (selectedKey==11){
			//Decrease YYY by 1
			Y=0;
			LCD_instruction(0x00);
			DisplayLCD("Brake "," "," ");
		}

		// ---- Cruise Control System ------------------------------------------

		// Key 1   ----   CCS on/off
		else if (selectedKey==1){
			clearScreen(); 	 //Clear screen to show new stuff
			// turns CCS ON
			if (CCS == 1)  {
				CCS = 0;
				LEDoff (0x08);							//turn off green light
				delay(100);
			} else if (CCS == 0) {
				CCS = 1;
				LED (0x08);								//turn on green light
				delay(100);
			}											
		}


		// Key 4  ---  increase spped
		else if (selectedKey==4){
			clearScreen(); 	 //Clear screen to show new stuff
			// Increase YYY by 1
			if (CCS ==1) {
				LED (0x08);								//turn on green light
				Y++;
				// Output for CCS
				LCD_instruction(0x00);
				DisplayLCD("SPEED ","Y"," CCS ON");
				LCD_instruction(0xC0);
				//Output for heating
				if(Heating==1){
					DisplayLCD("Heat ON Temp ","X","C");	
				}else{
					DisplayLCD("Heat OFF Temp ","X","C");
				} 				
			}
			
		}

		// Key 7   ----   decrease speed
		else if (selectedKey==7){
			 clearScreen(); 	 //Clear screen to show new stuff
			 //Decrease YYY by 1
			 if (CCS ==1) {
				LED (0x08);								//turn on green light
				Y--;
				// Output for CCS
				LCD_instruction(0x00);
				DisplayLCD("SPEED ","Y"," CCS ON");
				LCD_instruction(0xC0);
				//Output for heating
				if(Heating==1){
					DisplayLCD("Heat ON Temp ","X","C");	
				}else{
					DisplayLCD("Heat OFF Temp ","X","C");
				} 		
			}									
		}

		// Key E   ----   cancel CCS
		else if (selectedKey==14){
			clearScreen(); 	 //Clear screen to show new stuff
			 
			LEDoff (0x08);					   			//turn off green light
			CCS=0;
		}

		// --- Heating System --------------------------------------------------
		
		// Key 2   ----   turn heat on/off
		else if (selectedKey==2){
			clearScreen(); 	 //Clear screen to show new stuff
			// Turns heating ON
			if (Heating ==1) {
				Heating = 0;				
				LEDoff (0x01);					   		//turn off red light
				delay(100);
			} else if (Heating == 0) {
				Heating = 1;
				LED (0x01);							  	//turn on red light
				delay(100);
			}
		}


		// Key 5   ----   increase heating
		else if (selectedKey==5){
			 clearScreen(); 	 //Clear screen to show new stuff
			 
			// increase XX by 1
			if (Heating ==1){
				LED (0x01);											//turn on red light
				X++;
				
				LCD_instruction(0x00);
				if (CCS ==1) {// Check for CCS output
					DisplayLCD("SPEED ", "Y" , " CCS ON ");
				}else{
					DisplayLCD("SPEED ", "Y" , " CCS OFF ");	
				}
				LCD_instruction(0xC0);
				DisplayLCD("Heat ON Temp ","X","C");
			} else {
				LCD_instruction(0x00);
				if (CCS ==1) {// Check for CCS output
					DisplayLCD("SPEED ", "Y" , " CCS ON ");
				 }else{
					DisplayLCD("SPEED ", "Y" , " CCS OFF ");	
				}
				LCD_instruction(0xC0);
				DisplayLCD("Heat OFF Temp ","X","C");					
			}
		}

		// Key 8    ----   reduce heating
		else if (selectedKey==8){
			 clearScreen(); 	 //Clear screen to show new stuff
			 
			//Decrease XX by 1
			if (Heating ==1) {
				LED (0x01);				//turn on red light
				X--;
				//Display on screen
				LCD_instruction(0x00);
				
				if (CCS ==1) {// Check for CCS output
					DisplayLCD("SPEED ", "Y" , " CCS ON ");
				}else{
					DisplayLCD("SPEED ", "Y" , " CCS OFF ");	
				}
				LCD_instruction(0xC0);
				DisplayLCD("Heat ON Temp ","X","C");
			}else {
			// Display one screen
				LCD_instruction(0x00);
				if (CCS ==1) { // Check for CCS output
					DisplayLCD("SPEED ", "Y" , " CCS ON ");
				}else{
					DisplayLCD("SPEED ", "Y" , " CCS OFF ");	
				}
				LCD_instruction(0xC0);
				DisplayLCD("Heat OFF Temp ","X","C");			
			}
		}


		// Key 0    ----   on/off Ventialtion
		else if (selectedKey==0){
			 clearScreen(); 	 //Clear screen to show new stuff
			 
			//Turns the Vent ON 
			if (Vent == 1){
				Vent = 0;
				LEDoff (0x04);					 		//turn off yellow light
				delay(100);
			} else if (Vent == 0){
				Vent = 1;
				LED (0x04);								//turn on yellow light
				delay(100);
			}
		}

		// --- Window ----------------------------------------------------------
		
		// Key 3   ----   move window up
		else if (selectedKey==3){
			 clearScreen(); 	 //Clear screen to show new stuff
		}


		// Key 6   ----   move window down 
		else if (selectedKey==6){
			 clearScreen(); 	 //Clear screen to show new stuff
		}

		// --- Emergency Stop --------------------------------------------------
		
		// Key F
		else if (selectedKey==15){
			clearScreen(); 	 //Clear screen to show new stuff
			 
			LED (0x30);				//turn on the buzzer
			delay(100);
			LEDoff(0x30);
		}
	}
}