           BL      MUL128X128
           END

MUL128X128 STMFD   SP!, {R4-R11, LR}

           LDMIA   R1, {R4-R7}
           LSR     R12, R7, #31
           CMP     R12, #1
           BNE     LOOPCHECK
           MVN     R4, R4
           MVN     R5, R5
           MVN     R6, R6
           MVN     R7, R7
           ADDS    R4, R4, #1
           ADCS    R5, R5, #0
           ADCS    R6, R6, #0
           ADCS    R7, R7, #0
           STMEA   R1, {R4-R7}
           ADD     R8, R8, #1

LOOPCHECK  LDMIA   R2, {R4-R7}
           LSR     R12, R7, #31
           CMP     R12, #1
           BNE     LOOPB
           MVN     R4, R4
           MVN     R5, R5
           MVN     R6, R6
           MVN     R7, R7
           ADDS    R4, R4, #1
           ADCS    R5, R5, #0
           ADCS    R6, R6, #0
           ADCS    R7, R7, #0
           STMEA   R2, {R4-R7}
           ADD     R8, R8, #1

LOOPB      MOV     R11, R2
           MOV     R10, R1
           BL      MUL32X32

           ADD     R11, R11, #4
           MOV     R2, R11
           MOV     R1, R10
           ADD     R3, R3, #4
           BL      MUL32X32

           SUB     R11, R11, #4
           MOV     R2, R11
           ADD     R10, R10, #4
           MOV     R1, R10
           BL      MUL32X32

           ADD     R11, R11, #4
           MOV     R2, R11
           MOV     R1, R10
           ADD     R3, R3, #4
           BL      MUL32X32


           ADD     R11, R11, #4
           MOV     R2, R11
           SUB     R10, R10, #4
           MOV     R1, R10
           BL      MUL32X32

           ADD     R11, R11, #4
           MOV     R2, R11
           MOV     R1, R10
           ADD     R3, R3, #4
           BL      MUL32X32

           SUB     R11, R11, #4
           MOV     R2, R11
           ADD     R10, R10, #4
           MOV     R1, R10
           BL      MUL32X32

           ADD     R11, R11, #4
           MOV     R2, R11
           MOV     R1, R10
           ADD     R3, R3, #4
           BL      MUL32X32


           SUB     R3, R3, #8
           SUB     R11, R11, #12
           MOV     R2, R11
           ADD     R10, R10, #4
           MOV     R1, R10
           BL      MUL32X32

           ADD     R11, R11, #4
           MOV     R2, R11
           MOV     R1, R10
           ADD     R3, R3, #4
           BL      MUL32X32

           SUB     R11, R11, #4
           MOV     R2, R11
           ADD     R10, R10, #4
           MOV     R1, R10
           BL      MUL32X32

           ADD     R11, R11, #4
           MOV     R2, R11
           MOV     R1, R10
           ADD     R3, R3, #4
           BL      MUL32X32


           ADD     R11, R11, #12
           MOV     R2, R11
           MOV     R1, R10
           BL      MUL32X32

           ADD     R11, R11, #4
           MOV     R2, R11
           MOV     R1, R10
           ADD     R3, R3, #4
           BL      MUL32X32

           SUB     R11, R11, #4
           MOV     R2, R11
           ADD     R10, R10, #4
           MOV     R1, R10
           BL      MUL32X32

           ADD     R11, R11, #4
           MOV     R2, R11
           MOV     R1, R10
           ADD     R3, R3, #4
           BL      MUL32X32


           CMP     R8, #1
           BNE     SKIP
           SUB     R3, R3, #24
           LDMIA   R3, {R4-R11}
           MVN     R4, R4
           MVN     R5, R5
           MVN     R6, R6
           MVN     R7, R7
           MVN     R8, R8
           MVN     R9, R9
           MVN     R10, R10
           MVN     R11, R11
           ADDS    R4, R4, #1
           ADCS    R5, R5, #0
           ADCS    R6, R6, #0
           ADCS    R7, R7, #0
           ADCS    R8, R8, #0
           ADCS    R9, R9, #0
           ADCS    R10, R10, #0
           ADCS    R11, R11, #0
           STMEA   R3, {R4-R11}
SKIP       LDMFD   SP!, {R4-R11, PC}



MUL32X32   STMFD   SP!, {R3-R11, LR}
           LDR     R8, =0xFFFF
           LDR     R4, [R1]
           LDR     R9, [R2]
           AND     R1, R4, R8
           AND     R2, R9, R8
           BL      MUL16X16
           ADDS    R6, R6, R0
           ADCS    R7, R7, #0

           LSR     R1, R4, #16
           AND     R2, R9, R8
           BL      MUL16X16
           ADDS    R6, R6, R0, LSL #16
           ADCS    R7, R7, R0, LSR #16

           AND     R1, R4, R8
           LSR     R2, R9, #16
           BL      MUL16X16
           ADDS    R6, R6, R0, LSL #16
           ADCS    R7, R7, R0, LSR #16

           LSR     R1, R4, #16
           LSR     R2, R9, #16
           BL      MUL16X16
           ADDS    R7, R7, R0

           LDMIA   R3, {R5, R11}
           ADDS    R5, R5, R6
           ADCS    R11, R11, R7
           STMEA   R3!, {R5, R11}

LOOP2      LDMIA   R3, {R10}
           ADCS    R10, R10, #0
           STMEA   R3!, {R10}
           BHS     LOOP2
           LDMFD   SP!, {R3-R11, PC}



MUL16X16   STMFD   SP!, {LR}
           MOV     R0, #0
           TST     R1, #1
           ADDNE   R0, R0, R2, LSL #0

           TST     R1, #2
           ADDNE   R0, R0, R2, LSL #1

           TST     R1, #4
           ADDNE   R0, R0, R2, LSL #2

           TST     R1, #8
           ADDNE   R0, R0, R2, LSL #3

           TST     R1, #16
           ADDNE   R0, R0, R2, LSL #4

           TST     R1, #32
           ADDNE   R0, R0, R2, LSL #5

           TST     R1, #64
           ADDNE   R0, R0, R2, LSL #6

           TST     R1, #128
           ADDNE   R0, R0, R2, LSL #7

           TST     R1, #256
           ADDNE   R0, R0, R2, LSL #8

           TST     R1, #512
           ADDNE   R0, R0, R2, LSL #9

           TST     R1, #1024
           ADDNE   R0, R0, R2, LSL #10

           TST     R1, #2048
           ADDNE   R0, R0, R2, LSL #11

           TST     R1, #4096
           ADDNE   R0, R0, R2, LSL #12

           TST     R1, #8192
           ADDNE   R0, R0, R2, LSL #13

           TST     R1, #16384
           ADDNE   R0, R0, R2, LSL #14

           TST     R1, #32768
           ADDNE   R0, R0, R2, LSL #15

           LDMFD   SP!, {PC}
