
_main:

;Buzzer.c,24 :: 		void main(){
;Buzzer.c,25 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Buzzer.c,26 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,28 :: 		TRISD = 0X80;
	MOVLW      128
	MOVWF      TRISD+0
;Buzzer.c,29 :: 		Lcd_Out(1,2,"Smart");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Buzzer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Buzzer.c,30 :: 		Lcd_Out(2,3,"House");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Buzzer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Buzzer.c,33 :: 		a:
___main_a:
;Buzzer.c,34 :: 		tmp=ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _tmp+0
	MOVF       R0+1, 0
	MOVWF      _tmp+1
	MOVF       R0+2, 0
	MOVWF      _tmp+2
	MOVF       R0+3, 0
	MOVWF      _tmp+3
;Buzzer.c,35 :: 		temperature= (tmp*5)/1023;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      192
	MOVWF      R4+1
	MOVLW      127
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temperature+0
	MOVF       R0+1, 0
	MOVWF      _temperature+1
	MOVF       R0+2, 0
	MOVWF      _temperature+2
	MOVF       R0+3, 0
	MOVWF      _temperature+3
;Buzzer.c,36 :: 		y=temperature*100;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _y+0
	MOVF       R0+1, 0
	MOVWF      _y+1
	MOVF       R0+2, 0
	MOVWF      _y+2
	MOVF       R0+3, 0
	MOVWF      _y+3
;Buzzer.c,37 :: 		if(y>25){
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      72
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;Buzzer.c,38 :: 		PORTD.F6=1;
	BSF        PORTD+0, 6
;Buzzer.c,39 :: 		}
	GOTO       L_main3
L_main2:
;Buzzer.c,41 :: 		PORTD.F6=0;
	BCF        PORTD+0, 6
;Buzzer.c,42 :: 		}
L_main3:
;Buzzer.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,45 :: 		TRISC0_bit = 0;
	BCF        TRISC0_bit+0, BitPos(TRISC0_bit+0)
;Buzzer.c,46 :: 		if(GAS==1)
	BTFSS      RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L_main4
;Buzzer.c,48 :: 		Lcd_Out(1,1,"Gaz Detecter");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Buzzer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Buzzer.c,49 :: 		Sound_Init(&PORTC,1);
	MOVLW      PORTC+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      1
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;Buzzer.c,50 :: 		Sound_Play(1500,200);
	MOVLW      220
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      5
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      200
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;Buzzer.c,51 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
;Buzzer.c,52 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,53 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,54 :: 		}
L_main4:
;Buzzer.c,55 :: 		if(PIR==1){
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main6
;Buzzer.c,56 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,57 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,58 :: 		TRISC2_bit = 0;
	BCF        TRISC2_bit+0, BitPos(TRISC2_bit+0)
;Buzzer.c,59 :: 		Lcd_Out(2,2,"Presence");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Buzzer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Buzzer.c,60 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;Buzzer.c,61 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Buzzer.c,63 :: 		IntToStr(ldr,ldr1);
	MOVF       _ldr+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _ldr+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _ldr1+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Buzzer.c,64 :: 		ldr = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ldr+0
	MOVF       R0+1, 0
	MOVWF      _ldr+1
;Buzzer.c,65 :: 		Lcd_Out(1,1,ldr1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _ldr1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Buzzer.c,66 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	DECFSZ     R12+0, 1
	GOTO       L_main8
	DECFSZ     R11+0, 1
	GOTO       L_main8
	NOP
	NOP
;Buzzer.c,67 :: 		if(ldr < 370  ){
	MOVLW      128
	XORWF      _ldr+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      114
	SUBWF      _ldr+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;Buzzer.c,68 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;Buzzer.c,69 :: 		}
L_main9:
;Buzzer.c,70 :: 		if(ldr > 370)
	MOVLW      128
	XORLW      1
	MOVWF      R0+0
	MOVLW      128
	XORWF      _ldr+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVF       _ldr+0, 0
	SUBLW      114
L__main14:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;Buzzer.c,72 :: 		PORTD.F0=0;
	BCF        PORTD+0, 0
;Buzzer.c,73 :: 		}
L_main10:
;Buzzer.c,74 :: 		}
	GOTO       L_main11
L_main6:
;Buzzer.c,76 :: 		PORTD.F7 = 0;
	BCF        PORTD+0, 7
;Buzzer.c,77 :: 		}
L_main11:
;Buzzer.c,78 :: 		goto a;
	GOTO       ___main_a
;Buzzer.c,80 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
