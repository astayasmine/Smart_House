sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;
//
sbit GAS at RC0_bit;
sbit PIR at RC2_bit;
int ldr;
int temp;
float temperature, y, tmp;
float valeur;
float temp2;
char Text[4];
char ldr1[5];
void main(){
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 TRISD = 0X80;
 Lcd_Out(1,2,"Smart");
 Lcd_Out(2,3,"House");
 //
 while(1){
    a:
    tmp=ADC_Read(1);
    temperature= (tmp*5)/1023;
    y=temperature*100;
    if(y>25){
      PORTD.F6=1;0.
    }
    else{
      PORTD.F6=0;
    }
    Lcd_Cmd(_LCD_CURSOR_OFF);
    Lcd_Cmd(_LCD_CLEAR);
  TRISC0_bit = 0;
    if(GAS==1)
      {
              Lcd_Out(1,1,"Gaz Detecter");
              Sound_Init(&PORTC,1);
              Sound_Play(1500,200);
              delay_ms(100);
              Lcd_Cmd(_LCD_CURSOR_OFF);
              Lcd_Cmd(_LCD_CLEAR);
      }
    if(PIR==1){
               Lcd_Cmd(_LCD_CURSOR_OFF);
               Lcd_Cmd(_LCD_CLEAR);
               TRISC2_bit = 0;
               Lcd_Out(2,2,"Presence");
               delay_ms(500);
               Lcd_Cmd(_LCD_CURSOR_OFF);
               Lcd_Cmd(_LCD_CLEAR);
               IntToStr(ldr,ldr1);
               ldr = ADC_Read(0);
               Lcd_Out(1,1,ldr1);
               delay_ms(500);
               if(ldr < 370  ){
                 PORTD.F0=1;
               }
               if(ldr > 370)
               {
                    PORTD.F0=0;
               }
    }
    else {
    PORTD.F7 = 0;
    }
    goto a;
  }
  }