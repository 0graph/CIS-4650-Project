* Standard Prelude
0: LD 6,0(0) Load the global pointer with max address
1: LDA 5,0(6) Load the frame pointer
2: ST 0,0(0) Clear Location 0
* End Standard Prelude
* code for input routine
4: ST 0,1(5) Store return
5: IN 0,0,0 Read integer value
6: LD 7,1(5) return to caller
* code for output routine
7: ST 0,1(5) Store return
8: LD 0,2(5) Load value to output
9: OUT 0,0,0 Output integer value
10: LD 7,1(5) return to caller
3: LDA 7,7(7) Jump around i/o code
* --- Function Declaration (main) ---
12: ST 0,-1(5) Store return
* Making Space for variable (a)
* --- Assignment Expression ---
13: LDA 0,-2(5) Load address for var (a)
14: ST 0,-1(5) &a
* Loading Constant 1 to register 0 and save to memory with offset 2
15: LDC 0,1(0) 
16: ST 0,-2(5) 
* Store back the result of the assignment operation
17: LD 0,-1(5) Load to memory the address and result value
18: LD 1,-2(5) 
19: ST 1,0(0) 
20: ST 1,0(5) Value Stored!
* --- Assignment Expression ---
21: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,10(7) Jump around function bodies
* --- Final ---
22: ST 5,0(5) Original Pointer
23: LDA 5,0(5) Push Main Frame Pointer
24: LDA 0,-1(7) Load Accumulator with return pointer
25: LDA 7,-14(7) Jump to Location
26: LD 5,0(5) Pop Main Frame
27: HALT 0,0,0 Exit
* --- Final ---