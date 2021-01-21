# PDP-11

Simulation to pdp-11 microprocessor , The design is a micro-programmed based with an average of 9 clock cycles per instruction .

# System Design

* Control Word Design
![Word Design](https://i.ibb.co/ss6TCf7/Screenshot-from-2021-01-22-00-02-50.png)
* System Design
![System Design](https://i.ibb.co/RpLC6Vr/Screenshot-from-2021-01-22-00-16-36.png)

# Instructions

- ALU Instructions
	- 2-Operand Instructions:
		- MOV,ADD,ADC,SUB,SUBC,AND,OR,XOR,CMP
	- 1-Operand Instructions:
		- INC,DEC,CLR,INV,LSR,ROR,ASR,LSL,ROL
- Branch Instruction
	- BR,BEQ,BNE,BLO,BLS,BHI,BHS
- 0-Operand Instructions
	- HLT,RST
# Addressing modes
*	Register Direct
*	Register Indirect
*	Auto-Increment
*	Auto-Increment Indirect
*	Auto-Decrement
*	Auto-Decrement Indirect
*	Indexed
*	Indexed-Indirect
# Assembler
* An Assembler in python for converting pdp-11 assembly syntax into a binary file.
 * refer to [Assembler](Assembler) for the implemented features and running instructions .
```
