* Standard Prelude
0: LD 6,0(0) Load the global pointer with max address
1: LDA 5,0(6) Load the frame pointer
2: ST 0,0(0) Clear Location 0
* End Standard Prelude
* code for input routine
4: ST 0,-1(5) Store return
5: IN 0,0,0 Read integer value
6: LD 7,-1(5) return to caller
* code for output routine
7: ST 0,-1(5) Store return
8: LD 0,-2(5) Load value to output
9: OUT 0,0,0 Output integer value
10: LD 7,-1(5) return to caller
3: LDA 7,7(7) Jump around i/o code
* --- Function Declaration (main) ---
12: ST 0,-1(5) Store return
* Making Space for variable (x)
* --- Assignment Expression ---
13: LDA 0,-2(5) Load address for var (x)
14: ST 0,-4(5) &x
* Loading Constant 45 to register 0 and save to memory with offset 5
15: LDC 0,45(0) 
16: ST 0,-5(5) 
* Store back the result of the assignment operation
17: LD 0,-4(5) Load to memory the address and result value
18: LD 1,-5(5) 
19: ST 1,0(0) 
20: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 3
* Adding argument 1
21: LD 0,-2(5) Value of x
22: ST 0,-4(5) 
23: ST 0,-5(5) Storing argument
* Create new activation record
24: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
25: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
26: LDA 0,1(7) Save the return address in the accumulator
27: LDA 7,-21(7) Jump to output()
28: BRK 0,0,0 Breakpoint
29: LD 5,0(5) Pop the frame and return to the current frame
30: ST 0,-3(5) Store return value
* --- Calling output() ---
31: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,20(7) Jump around function bodies
* --- Final ---
32: ST 5,0(5) Original Pointer
33: LDA 5,0(5) Push Main Frame Pointer
34: LDA 0,1(7) Load Accumulator with return pointer
35: LDA 7,-24(7) Jump to Location
36: LD 5,0(5) Pop Main Frame
37: HALT 0,0,0 Exit
* --- Final ---
