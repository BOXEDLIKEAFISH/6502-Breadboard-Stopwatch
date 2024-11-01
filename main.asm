; TEJ Summative Project
; Kris Kuo
; June 14, 2023
; 2 digit stopwatch with stop and reset buttons
; Built on the NCS 2056T Educational Computer Kit + Edukit display board
; Display board decodes 4 bit inputs and displays the decimal value on seven segment displays
 
Out_B:		.SET $8000	; Port B register
Out_A: 	.SET $8001	; Port A register
DDR_B:	.SET $8002	; Port B direction register
DDR_A: 	.SET $8003	; Port A direction register

leftnum: .SET $0	; memory location of variables
rightnum: .SET $1
ten: .SET $2
output: .SET $3
max: .SET $4

 
 .ORG $E000	; declare start of code
  
start:		; start of program
  LDA #$FF	
  STA DDR_A	; set all A ports to output
  LDA #0	
  STA DDR_B	; set all B ports to input
  LDA #$0	
  STA leftnum	; set variables to 0
  STA rightnum
  LDA #10
  STA ten	; variables for CMP command 
  
main:	
  INC rightnum	; increment right digit (ones column)
  LDA rightnum	
  CMP #10	; if right digit = 10
  BEQ resetdigit	; branch to resetdigit routine
  
display:	; combines 2 4bit outputs into a single 8 bit output
  LDA leftnum	; load left digit (tens column)
  ASL		; shift 4 bits left
  ASL		
  ASL
  ASL
  CLC		; clear carry
  ADC rightnum	; add right digit (ones column)
  
  STA Out_A	; output to Port A
  STA output	; store to "output" variable
  
  CMP #153	; if output = 99
  BEQ stop	; stop the timer
  
  LDA Out_B	; load the button input
  LSR		; move the value to the carry
  BCC stop	; if the button is pressed, stop the timer
	
  
  JSR delay	; delay for 1 second total
  JSR delay
  JSR delay
  JSR delay
  JSR delay
  JSR delay
  JMP main	; loop to main


resetdigit:	; when right digit (ones column) = 10
  LDA #0	
  STA rightnum	; reset right digit to 0
  INC leftnum	; increment left digit (tens column)
  JMP display	; display new value
  
  
delay:		;delay routine	
  LDX #101
loopB:
  LDY #$ff
loopA:
  LDA Out_B	; check for button input
  LSR
  BCC stop	; if button is pressed, stop the timer
  DEY  
  BNE loopA
  DEX
  BNE loopB
  RTS		; return from subroutine

stop:	; when button is pressed or the timer reaches 99, flash the final time
  LDA output	
  STA Out_A	; display the current time
  
  JSR delay	; delay for 0.8 seconds total
  JSR delay
  JSR delay
  JSR delay
  	
  LDA #$FF
  STA Out_A	; turn off both displays
  
  JSR delay	; delay for 0.2 seconds
  
  JMP stop	; loop 

 .END
