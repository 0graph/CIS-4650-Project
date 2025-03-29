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
* --- Calling input() ---
* Offset: 5
* Create new activation record
15: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
16: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
17: LDA 0,1(7) Save the return address in the accumulator
18: LDA 7,-15(7) Jump to input()
19: LD 5,0(5) Pop the frame and return to the current frame
20: ST 0,-5(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
21: LD 0,-4(5) Load to memory the address and result value
22: LD 1,-5(5) 
23: ST 1,0(0) 
24: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 3
* Adding argument 1
25: LD 0,-2(5) Value of x
26: ST 0,-4(5) 
27: ST 0,-5(5) Storing argument
* Create new activation record
28: ST 5,-3(5) Save address of current frame pointer to memory with offset 8
29: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
30: LDA 0,1(7) Save the return address in the accumulator
31: LDA 7,-25(7) Jump to output()
32: LD 5,0(5) Pop the frame and return to the current frame
33: ST 0,-3(5) Store return value
* --- Calling output() ---
34: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,23(7) Jump around function bodies
* --- Final ---
35: ST 5,0(5) Original Pointer
36: LDA 5,0(5) Push Main Frame Pointer
37: LDA 0,1(7) Load Accumulator with return pointer
38: LDA 7,-27(7) Jump to Location
39: LD 5,0(5) Pop Main Frame
40: HALT 0,0,0 Exit
* --- Final ---
