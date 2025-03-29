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
* --- Function Declaration (bruh) ---
12: ST 0,-1(5) Store return
* Making Space for variable (a)
* --- Calling output() ---
* Offset: 3
* Adding argument 1
13: LD 0,-2(5) Value of a
14: ST 0,-4(5) 
15: ST 0,-5(5) Storing argument
* Create new activation record
16: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
17: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
18: LDA 0,1(7) Save the return address in the accumulator
19: LDA 7,-13(7) Jump to output()
20: LD 5,0(5) Pop the frame and return to the current frame
21: ST 0,-3(5) Store return value
* --- Calling output() ---
* --- If Expression ---
* --- Operation Expression ---
22: LD 0,-2(5) Value of a
23: ST 0,-5(5) 
* Loading Constant 0 to register 0 and save to memory with offset 6
24: LDC 0,0(0) 
25: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
26: LD 0,-5(5) Load Left hand side
27: LD 1,-6(5) Load Right hand side
28: SUB 0,0,1 Subtract for Comparison
29: JLE 0,2(7) Jump to next instruction if true
30: LDC 0,0(0) Load 0 (false)
31: LDA 7,1(7) Unconditional Jump
32: LDC 0,1(0) Load 1 (true)
33: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Return Expression ---
* Loading Constant 0 to register 0 and save to memory with offset 5
35: LDC 0,0(0) 
36: ST 0,-5(5) 
37: LD 1,0(0) Save value from return expression
38: LD 7,-1(5) Return to caller
* --- Return Expression ---
34: JEQ 0,4(7) if false jump 4 instructions
39: LDA 7,0(7) jump around body
* --- If Expression ---
* --- Calling bruh() ---
* Offset: 3
* Adding argument 1
* --- Operation Expression ---
40: LD 0,-2(5) Value of a
41: ST 0,-5(5) 
* Loading Constant 1 to register 0 and save to memory with offset 6
42: LDC 0,1(0) 
43: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
44: LD 0,-5(5) Load Left hand side
45: LD 1,-6(5) Load Right hand side
46: SUB 0,0,1 Operation
47: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
48: ST 0,-5(5) Storing argument
* Create new activation record
49: ST 5,-3(5) Save address of current frame pointer to memory with offset 6
50: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
51: LDA 0,1(7) Save the return address in the accumulator
52: LDA 7,-41(7) Jump to bruh()
53: LD 5,0(5) Pop the frame and return to the current frame
54: ST 0,-3(5) Store return value
* --- Calling bruh() ---
55: LD 7,-1(5) Return to caller
* --- Function Declaration (bruh) ---
* --- Function Declaration (main) ---
56: ST 0,-1(5) Store return
* Making Space for variable (x)
* --- Assignment Expression ---
57: LDA 0,-2(5) Load address for var (x)
58: ST 0,-4(5) &x
* Loading Constant 2 to register 0 and save to memory with offset 5
59: LDC 0,2(0) 
60: ST 0,-5(5) 
* Store back the result of the assignment operation
61: LD 0,-4(5) Load to memory the address and result value
62: LD 1,-5(5) 
63: ST 1,0(0) 
64: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Calling bruh() ---
* Offset: 3
* Adding argument 1
* Loading Constant 2 to register 0 and save to memory with offset 4
65: LDC 0,2(0) 
66: ST 0,-4(5) 
67: ST 0,-5(5) Storing argument
* Create new activation record
68: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
69: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
70: LDA 0,1(7) Save the return address in the accumulator
71: LDA 7,-60(7) Jump to bruh()
72: LD 5,0(5) Pop the frame and return to the current frame
73: ST 0,-3(5) Store return value
* --- Calling bruh() ---
74: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,63(7) Jump around function bodies
* --- Final ---
75: ST 5,0(5) Original Pointer
76: LDA 5,0(5) Push Main Frame Pointer
77: LDA 0,1(7) Load Accumulator with return pointer
78: LDA 7,-23(7) Jump to Location
79: LD 5,0(5) Pop Main Frame
80: HALT 0,0,0 Exit
* --- Final ---
