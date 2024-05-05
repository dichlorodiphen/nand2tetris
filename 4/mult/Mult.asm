// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// R2 = 0
@0
D=A
@R2
M=D

// if R1 <= 0, goto STOP
@R1
D=M
@END
D;JLE

(LOOP)
// R2 = R2 + R0
@R0
D=M
@R2
M=M+D
// R1 = R1 - 1
@1
D=A
@R1
M=M-D
// if R1 > 0, goto LOOP
@R1
D=M
@LOOP
D;JGT

(END)
@END
0;JMP

