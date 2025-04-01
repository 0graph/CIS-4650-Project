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
* Loading Constant 0 to register 0 and save to memory with offset 5
15: LDC 0,0(0) 
16: ST 0,-5(5) 
* Store back the result of the assignment operation
17: LD 0,-4(5) Load to memory the address and result value
18: LD 1,-5(5) 
19: ST 1,0(0) 
20: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- If Expression ---
* --- Operation Expression ---
21: LD 0,-2(5) Value of x
22: ST 0,-5(5) 
* Loading Constant 0 to register 0 and save to memory with offset 6
23: LDC 0,0(0) 
24: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
25: LD 0,-5(5) Load Left hand side
26: LD 1,-6(5) Load Right hand side
27: SUB 0,0,1 Subtract for Comparison
28: JEQ 0,2(7) Jump to next instruction if true
29: LDC 0,0(0) Load 0 (false)
30: LDA 7,1(7) Unconditional Jump
31: LDC 0,1(0) Load 1 (true)
32: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* Making Space for variable (y)
* --- Assignment Expression ---
34: LDA 0,-3(5) Load address for var (y)
35: ST 0,-5(5) &y
* Loading Constant 20 to register 0 and save to memory with offset 6
36: LDC 0,20(0) 
37: ST 0,-6(5) 
* Store back the result of the assignment operation
38: LD 0,-5(5) Load to memory the address and result value
39: LD 1,-6(5) 
40: ST 1,0(0) 
41: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 4
* Adding argument 1
42: LD 0,-3(5) Value of y
43: ST 0,-5(5) 
44: ST 0,-5(5) Storing argument
* Create new activation record
45: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
46: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
47: LDA 0,1(7) Save the return address in the accumulator
48: LDA 7,-42(7) Jump to output()
49: LD 5,0(5) Pop the frame and return to the current frame
50: ST 0,-4(5) Store return value
* --- Calling output() ---
33: JEQ 0,17(7) if false jump 17 instructions
51: LDA 7,0(7) jump around body
* --- If Expression ---
* --- Calling output() ---
* Offset: 3
* Adding argument 1
52: LD 0,-2(5) Value of x
53: ST 0,-4(5) 
54: ST 0,-4(5) Storing argument
* Create new activation record
55: ST 5,-3(5) Save address of current frame pointer to memory with offset 7
56: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
57: LDA 0,1(7) Save the return address in the accumulator
58: LDA 7,-52(7) Jump to output()
59: LD 5,0(5) Pop the frame and return to the current frame
60: ST 0,-3(5) Store return value
* --- Calling output() ---
61: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,50(7) Jump around function bodies
* --- Final ---
62: ST 5,0(5) Original Pointer
63: LDA 5,0(5) Push Main Frame Pointer
64: LDA 0,1(7) Load Accumulator with return pointer
65: LDA 7,-54(7) Jump to Location
66: LD 5,0(5) Pop Main Frame
67: HALT 0,0,0 Exit
* --- Final ---
