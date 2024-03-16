data SEGMENT             ;defining data segment and insert source data into it
    D1 DD 9DB2H         ;first 32 bit number
    D2 DD 5A74H         ;second 32 bit number
    ans DD ?
ends                    ;end of data segment

code SEGMENT            ;defining code segment
    assume cs:code, ds:data

start:  MOV AX, DATA    ;starting of main program
        MOV DS, AX      ;DS is loaded with base address of data segment
        MOV AX, D1      ;take the lower word of first number
        MOV BX, D2      ;take the lower word of second number
        SUB AX, BX      ;subtract lower word of both numbers
        MOV ans, AX     ;store lower word of answer
        MOV AX, D1+2    ;take the upper word of first number
        MOV BX, D2+2    ;take the upper word of second number
        SBB AX, BX      ;subtract upper words of second in memory
        MOV ans+2, AX   ;store upper word of answer in memory
        JC  finish      ;if borrow is generated
        INC BX
        MOV ans+2, BX   ;if borrow store increment DL register
finish: MOV AH, 4CH     ;prepare for program termination
        INT 21H         ;terminate the program
CODE ENDS               ;end of code segment
END start               ;end of main program
