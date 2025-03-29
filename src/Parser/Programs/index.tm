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
* Making Space for variable (y)
* Making space for array variable (x[5])
* --- Assignment Expression ---
* Loading Constant 1 to register 0 and save to memory with offset 10
13: LDC 0,1(0) 
14: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array x[] and save it to offset 9
15: LDA 0,-3(5) Load address to register
16: LD 1,-10(5) Load index value to register
17: SUB 0,0,1 Substract the offset to the address
18: ST 0,-9(5) Store the address given the index at offset 9
* Loading Constant 1 to register 0 and save to memory with offset 10
19: LDC 0,1(0) 
20: ST 0,-10(5) 
* Store back the result of the assignment operation
21: LD 0,-9(5) Load to memory the address and result value
22: LD 1,-10(5) 
23: ST 1,0(0) 
24: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
* Loading Constant 2 to register 0 and save to memory with offset 10
25: LDC 0,2(0) 
26: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array x[] and save it to offset 9
27: LDA 0,-3(5) Load address to register
28: LD 1,-10(5) Load index value to register
29: SUB 0,0,1 Substract the offset to the address
30: ST 0,-9(5) Store the address given the index at offset 9
* Loading Constant 3 to register 0 and save to memory with offset 10
31: LDC 0,3(0) 
32: ST 0,-10(5) 
* Store back the result of the assignment operation
33: LD 0,-9(5) Load to memory the address and result value
34: LD 1,-10(5) 
35: ST 1,0(0) 
36: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
37: LDA 0,-2(5) Load address for var (y)
38: ST 0,-9(5) &y
* --- Operation Expression ---
* Loading Constant 1 to register 0 and save to memory with offset 12
39: LDC 0,1(0) 
40: ST 0,-12(5) 
* Load index calculated at offset 12 and base address of array x[] and save it to offset 11
41: LDA 0,-3(5) Load address to register
42: LD 1,-12(5) Load index value to register
43: SUB 0,0,1 Substract the offset to the address
44: LD 0,0(0) Load the value at the x[index] address to the AC
45: ST 0,-11(5) Value of x[index]
* Loading Constant 2 to register 0 and save to memory with offset 13
46: LDC 0,2(0) 
47: ST 0,-13(5) 
* Load index calculated at offset 13 and base address of array x[] and save it to offset 12
48: LDA 0,-3(5) Load address to register
49: LD 1,-13(5) Load index value to register
50: SUB 0,0,1 Substract the offset to the address
51: LD 0,0(0) Load the value at the x[index] address to the AC
52: ST 0,-12(5) Value of x[index]
* Save the result of the operation expression to the address offset 10
53: LD 0,-11(5) Load Left hand side
54: LD 1,-12(5) Load Right hand side
55: ADD 0,0,1 Operation
56: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
57: LD 0,-9(5) Load to memory the address and result value
58: LD 1,-10(5) 
59: ST 1,0(0) 
60: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 8
* Adding argument 1
* --- Operation Expression ---
* Loading Constant 1 to register 0 and save to memory with offset 11
61: LDC 0,1(0) 
62: ST 0,-11(5) 
* Load index calculated at offset 11 and base address of array x[] and save it to offset 10
63: LDA 0,-3(5) Load address to register
64: LD 1,-11(5) Load index value to register
65: SUB 0,0,1 Substract the offset to the address
66: LD 0,0(0) Load the value at the x[index] address to the AC
67: ST 0,-10(5) Value of x[index]
* Loading Constant 2 to register 0 and save to memory with offset 12
68: LDC 0,2(0) 
69: ST 0,-12(5) 
* Load index calculated at offset 12 and base address of array x[] and save it to offset 11
70: LDA 0,-3(5) Load address to register
71: LD 1,-12(5) Load index value to register
72: SUB 0,0,1 Substract the offset to the address
73: LD 0,0(0) Load the value at the x[index] address to the AC
74: ST 0,-11(5) Value of x[index]
* Save the result of the operation expression to the address offset 9
75: LD 0,-10(5) Load Left hand side
76: LD 1,-11(5) Load Right hand side
77: ADD 0,0,1 Operation
78: ST 0,-9(5) Store value of expression
* --- Operation Expression ---
79: ST 0,-10(5) Storing argument
* Create new activation record
80: ST 5,-8(5) Save address of current frame pointer to memory with offset 8
81: LDA 5,-8(5) Load the frame pointer so that it starts at offset 8
82: LDA 0,1(7) Save the return address in the accumulator
83: LDA 7,-77(7) Jump to output()
84: LD 5,0(5) Pop the frame and return to the current frame
85: ST 0,-8(5) Store return value
* --- Calling output() ---
86: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,75(7) Jump around function bodies
* --- Final ---
87: ST 5,0(5) Original Pointer
88: LDA 5,0(5) Push Main Frame Pointer
89: LDA 0,1(7) Load Accumulator with return pointer
90: LDA 7,-79(7) Jump to Location
91: LD 5,0(5) Pop Main Frame
92: HALT 0,0,0 Exit
* --- Final ---
