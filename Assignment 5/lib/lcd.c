// By Korey Conway and Tanzeel Rana

extern void LCD_display(char ascii_char);
extern void Lcd2PP_Init(void);
extern void LCD_instruction(char instruction);

void lcd_init(void);
void lcd_print(char *string, int address);
void lcd_print_top(char *string);
void lcd_print_bottom(char *string);
void lcd_display_speed(int speed);
void lcd_display_temperature(int temp);

#define	LCD_ROW_TOP		0x00
#define	LCD_ROW_BOTTOM	0xC0

/*
	Initialize the lcd
*/
void lcd_init()
{
	Lcd2PP_Init();
}

/*
	Print a string at the given location
*/
void lcd_print(char *string, int address)
{
	LCD_instruction(address);
	while (0 != *string) {
		LCD_display(*string++);
	}
}

/*
	Print a string on the top line
*/
void lcd_print_top(char *string)
{
	lcd_print(string, LCD_ROW_TOP);
}

/*
	Print a string on the bottom line
*/
void lcd_print_bottom(char *string)
{
	lcd_print(string, LCD_ROW_BOTTOM);
}

/*
	Display the speed on the LCD
*/
void lcd_display_speed(int speed)
{
	char *string;
	sprintf(string, "Speed: %d", speed);
	lcd_print_top(string);
}

/*
	Display the temperature on the LCD
*/
void lcd_display_temperature(int temp)
{
	char *string;
	sprintf(string, "Temperature:%dF", temp);
	lcd_print_bottom(string);
}
