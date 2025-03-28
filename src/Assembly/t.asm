* Standard Prelude
0: LD 6,0(0) Load the global pointer with max address
1: LDA 5,0(6) Load the frame pointer
2: ST 0,0(0) Clear Location 0
3: LDA 7,7(7) Jump to main
* code for input routine
4: ST 0,1(5) Store return
5: IN 0,0,0 Read integer value
6: LD 7,1(5) return to caller
* code for output routine
7: ST 0,1(5) Store return
8: LD 0,2(5) Load value to output
9: OUT 0,0,0 Output integer value
10: LD 7,1(5) return to caller
* End Standard Prelude
* Entering Function Declaration (main)
11: ST 0,-1(5) Store return
* Making Space for variable (a)
* --- Assignment Expression ---
12: LDA 0,-1(5) Load address for var (a)
13: ST 0,-3(5) &a
* Loading Constant 1 to register 0 and save to memory with offset 4
14: LDC 0,1(0) 
15: ST 0,-4(5) 
* Store back the result of the assignment operation
16: LD 0,-3(5) Load to memory the address and result value
17: LD 1,-4(5) 
18: ST 1,0(0) 
19: ST 1,-2(5) Value Stored!
* --- Assignment Expression ---