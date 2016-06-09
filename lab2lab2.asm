#include "tx3703.inc"

	Rozero 	EQU 0E0H  ;11100000b
	Rtzero  EQU 0D0H  ;11010001b
	Lozero 	EQU 0B0H  ;10110000b
	Ltthree	EQU 073H  ;01110011b
	Count 	EQU 000H  ;00011111b
	
	RoZero_2 EQU 0E0H  
	RtZero_2 EQU 0D3H  
	Lozero_2 EQU 0B0H
	Lthree_2 EQU 070H  
	
	
	
	TEN 	EQU 0EAH  ;01111010b
	THR     EQU 0D3H
	CON     EQU 000H
	
	ROne	EQU 62H	  ;Memory address,??????????????????*???
	RTen	EQU 63H	  ;Memory address,??????????????????*???		
	LOne	EQU 60H	  ;Memory address,??????????????????*???
	LTen	EQU 61H	  ;Memory address,??????????????????*???
	
	ORG 000h
	AJMP Start
	ORG 400h
Start:

	MOV P0OE,#11111111b;
	MOV P0,#11111111b;
	
	MOV ROne,#Rozero 	;Memory address ROne ??4 
	MOV RTen,#Rtzero 	;Memory address RTen ??1
	MOV LOne,#Lozero  	;Memory address LOne ??0
	MOV LTen,#Ltthree  	;Memory address LTen ??2
S1:
	MOV R2,#20
S2:
	MOV P0,ROne
	ACALL delay_1s
	
	MOV P0,RTen
	ACALL delay_1s
	
	MOV P0,LOne
	ACALL delay_1s
	
	MOV P0,LTen
	ACALL delay_1s

	DJNZ R2,S2
	
	MOV A,LOne
	CJNE A,#Lozero,S5
	AJMP S6
	
S5:	INC ROne
	DEC LOne
	MOV A,ROne
	CJNE A,#TEN,S1
	MOV ROne,#Rozero	;initialize Digit Four	
	INC RTen
	MOV A,RTen
	CJNE A,#THR,S1
	MOV ROne,#0E0H
	MOV RTen,#0D3H
	MOV LOne,#0B0H
	MOV LTen,#070H
	MOV R3,#20
	
S3:	MOV P0,ROne
	ACALL delay_1s
	
	MOV P0,RTen
	ACALL delay_1s
	
	MOV P0,LOne
	ACALL delay_1s
	
	MOV P0,LTen
	ACALL delay_1s
	DJNZ R3,S3
	MOV R3,#20
	
S4: MOV P0,ROne
	ACALL delay_1s
	ACALL delay_1s
	MOV P0,RTen
	ACALL delay_1s
	ACALL delay_1s
	MOV P0,LOne
	ACALL delay_1s
	ACALL delay_1s
	MOV P0,LTen
	ACALL delay_1s
	ACALL delay_1s
	MOV P0,#0F0H
	ACALL delay_1s
	ACALL delay_1s
	MOV P0,#0F0H
	ACALL delay_1s
	ACALL delay_1s
	MOV P0,#0F0H
	ACALL delay_1s
	ACALL delay_1s
	MOV P0,#0F0H
	ACALL delay_1s
	DJNZ R3,S4
	AJMP Sch_1

Sch_1:
	 MOV R1,#20
		
Sch:	
	MOV ROne,#RoZero_2	;Memory address ROne ??4 
	MOV RTen,#RtZero_2 	;Memory address RTen ??1
	MOV LOne,#Lozero_2  ;Memory address LOne ??0
	MOV LTen,#Lthree_2  ;Memory address LTen ??2	
	
S_temp:
	MOV P0,ROne
	ACALL delay_1s
		
	MOV P0,RTen
	ACALL delay_1s
		
	MOV P0,LOne
	ACALL delay_1s
		
	MOV P0,LTen
	ACALL delay_1s
	DJNZ R1,Sch
	
	
	MOV  A,LOne
	CJNE A,#Lozero_2,S5_2 ;當A與Lozero_2不相等跳至S5_2
	AJMP S6_2
	
	
	
	;TEN 	 EQU 0EAH  ;01111010b
	;THR     EQU 0D3H  ;11010011b	
	;CON     EQU 000H  ;00000000b
	
S5_2:	
	;INC ROne
	INC LOne
	MOV A,LOne
	CJNE A,#TEN,Sch_1
	MOV ROne,#Rozero	;initialize Digit Four	
	;INC RTen
	;MOV A,RTen
	;CJNE A,#THR,Sch_1
	;MOV ROne,#0E0H
	;MOV RTen,#0D3H
	;MOV LOne,#0B0H
	;MOV LTen,#070H
	MOV R3,#20

	
Sf:	MOV P0,ROne
	ACALL delay_1s
	
	MOV P0,RTen
	ACALL delay_1s
	
	MOV P0,LOne
	ACALL delay_1s
	
	MOV P0,LTen
	ACALL delay_1s
	DJNZ R3,Sf

S6: DEC LTen
	MOV LOne,#0BAH
	AJMP S5


	
S6_2: 
	inc LTen
	MOV LOne,#0BAH
	AJMP S5_2
	
	
	

delay_1s:
	MOV R5,#10
	D1:
	MOV  R6,#10
	DJNZ R6,$
	DJNZ R5,D1
	RET
	
	END