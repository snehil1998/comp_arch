##TESTBENCH minimal MUL16X16
#TEST 1
BRANCHTOSUB MUL16X16
IN R1 is 2
IN R2 is 3
OUT R0 is 6
OUT R1 is 2
#TEST 2
BRANCHTOSUB MUL16X16
IN R1 is 100
IN R2 is 200
OUT R0 is 20000
OUT R1 is 100
#TEST 3
BRANCHTOSUB MUL16X16
IN R1 is 0xFFFFFFFF
IN R2 is 0xFFFFFFFF
OUT R0 is 0xFFFF0001
OUT R1 is 0xFFFFFFFF