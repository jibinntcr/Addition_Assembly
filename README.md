# 32-Bit Number Subtraction in Assembly

This assembly program demonstrates how to subtract two 32-bit numbers. It is designed to run in a DOS environment using an x86 processor.

## Program Description

The code segment carries out the subtraction operation. It starts by loading the base address of the data segment into the `DS` register. It then moves the lower and upper words of the two 32-bit numbers from the data segment into the `AX` and `BX` registers, respectively. After performing the subtraction, it checks for a borrow. If a borrow occurred, it compensates by incrementing the result. Finally, it terminates the program with a DOS interrupt.

## How to Run

To run this program, you'll need an assembler like MASM or TASM, and a DOS environment or emulator. Assemble the program with your chosen assembler, and then run the executable in DOS.

## Code Structure

```assembly
; The data segment where the numbers and answer are stored
data SEGMENT             
    D1 DD 9DB2H         ; First 32-bit number
    D2 DD 5A74H         ; Second 32-bit number
    ans DD ?            ; Answer placeholder
ends                    

; The code segment with subtraction operation
code SEGMENT            
    assume cs:code, ds:data

start:  MOV AX, DATA    
        MOV DS, AX      
        MOV AX, D1      
        MOV BX, D2      
        SUB AX, BX      
        MOV ans, AX     
        MOV AX, D1+2    
        MOV BX, D2+2    
        SBB AX, BX      
        MOV ans+2, AX   
        JC  finish      
        INC BX
        MOV ans+2, BX   
finish: MOV AH, 4CH     
        INT 21H         
CODE ENDS               
END start               
