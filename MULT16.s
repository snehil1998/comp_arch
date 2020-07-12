MUL16X16 STMFD   SP!, {LR}
         MOV    R0, #0
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
