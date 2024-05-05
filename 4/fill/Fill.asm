// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// maxOffset = 8192
// offset = 0
// loop:
// if !keydown; goto CLEAR
//    if (offset == maxOffset) goto loop
//		*(SCREEN+offset)=-1
//    offset++
//    goto loop
// CLEAR:
//  if (offset == 0) goto loop
//    *(SCREEN+offset)=0
//    offset--
//    goto loop

// maxOffset = 8192
// offset = 0
// loop:
// if RAM[KBD] == 0; goto CLEAR
//    if (offset == maxOffset) goto loop
//		*(SCREEN+offset)=-1
//    offset++
//    goto loop
// CLEAR:
//  if (offset == 0) goto loop
//    *(SCREEN+offset)=0
//    offset--
//    goto loop

// maxOffset = 8192
@8192
D=A
@maxOffset
M=D

// offset = 0
@0
D=A
@offset
M=D

(LOOP)
// if RAM[KBD] == 0, goto CLEAR
@KBD
D=M
@CLEAR
D;JEQ

// if offset == maxOffset, goto LOOP
@maxOffset
D=M
@offset
D=D-M
@LOOP
D;JEQ

// *(SCREEN + offset) = -1
@SCREEN
D=A
@offset
A=D+M
M=-1

// offset = offset + 1
@offset
M=M+1

// goto LOOP
@LOOP
0;JMP 

(CLEAR)
// if offset == 0, goto LOOP
@offset
D=M
@LOOP
D;JEQ

// *(SCREEN+offset) = 0
@SCREEN
D=A
@offset
A=D+M
M=0

// offset = offset - 1
@offset
M=M-1

// goto LOOP
@LOOP
0;JMP

