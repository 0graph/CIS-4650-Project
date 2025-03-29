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
* --- Function Declaration (test) ---
12: ST 0,-1(5) Store return
* Making Space for variable (a)
* --- Assignment Expression ---
13: LDA 0,-2(5) Load address for var (a)
14: ST 0,-4(5) &a
* Loading Constant 69 to register 0 and save to memory with offset 5
15: LDC 0,69(0) 
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
* --- Calling input() ---
* Offset: 4
* Create new activation record
21: ST 5,-7(5) Save address of current frame pointer to memory with offset 7
22: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
23: LDA 0,1(7) Save the return address in the accumulator
24: LDA 7,-21(7) Jump to input()
25: LD 5,-3(5) Pop the frame and return to the current frame
* --- Calling input() ---
26: ST 0,-5(5) Storing argument
* Create new activation record
27: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
28: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
29: LDA 0,1(7) Save the return address in the accumulator
30: LDA 7,-24(7) Jump to output()
31: LD 5,0(5) Pop the frame and return to the current frame
* --- Calling output() ---
32: LD 7,-1(5) Return to caller
* --- Function Declaration (test) ---
* --- Function Declaration (main) ---
33: ST 0,-1(5) Store return
* --- Calling test() ---
* Offset: 2
* Create new activation record
34: ST 5,-2(5) Save address of current frame pointer to memory with offset 2
35: LDA 5,-2(5) Load the frame pointer so that it starts at offset 2
36: LDA 0,1(7) Save the return address in the accumulator
37: LDA 7,-26(7) Jump to test()
38: LD 5,0(5) Pop the frame and return to the current frame
* --- Calling test() ---
39: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,28(7) Jump around function bodies
* --- Final ---
40: ST 5,0(5) Original Pointer
41: LDA 5,0(5) Push Main Frame Pointer
42: LDA 0,1(7) Load Accumulator with return pointer
43: LDA 7,-11(7) Jump to Location
44: LD 5,0(5) Pop Main Frame
45: HALT 0,0,0 Exit
* --- Final ---
