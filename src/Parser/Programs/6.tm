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
* Making Space for variable (i)
* Making space for array variable (x[3])
* --- Assignment Expression ---
13: LDA 0,-2(5) Load address for var (i)
14: ST 0,-7(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 8
15: LDC 0,0(0) 
16: ST 0,-8(5) 
* Store back the result of the assignment operation
17: LD 0,-7(5) Load to memory the address and result value
18: LD 1,-8(5) 
19: ST 1,0(0) 
20: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
21: LD 0,-2(5) Value of i
22: ST 0,-8(5) 
* Loading Constant 3 to register 0 and save to memory with offset 9
23: LDC 0,3(0) 
24: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
25: LD 0,-8(5) Load Left hand side
26: LD 1,-9(5) Load Right hand side
27: SUB 0,0,1 Subtract for Comparison
28: JLT 0,2(7) Jump to next instruction if true
29: LDC 0,0(0) Load 0 (false)
30: LDA 7,1(7) Unconditional Jump
31: LDC 0,1(0) Load 1 (true)
32: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
35: LD 0,-2(5) Value of i
36: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array x[] and save it to offset 9
37: LDA 0,-3(5) Load address to register
38: LD 1,-10(5) Load index value to register
39: SUB 0,0,1 Substract the offset to the address
40: ST 0,-9(5) Store the address given the index at offset 9
41: LD 0,-2(5) Value of i
42: ST 0,-10(5) 
* Store back the result of the assignment operation
43: LD 0,-9(5) Load to memory the address and result value
44: LD 1,-10(5) 
45: ST 1,0(0) 
46: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
47: LDA 0,-2(5) Load address for var (i)
48: ST 0,-9(5) &i
* --- Operation Expression ---
49: LD 0,-2(5) Value of i
50: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
51: LDC 0,1(0) 
52: ST 0,-12(5) 
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
61: LDA 7,-39(7) Jump to test after body
* Load the test value to register 0
33: LD 0,-7(5) Load test value
34: JLE 0,27(7) Jump to end if test <= 0 (false)
* --- Assignment Expression ---
62: LDA 0,-2(5) Load address for var (i)
63: ST 0,-7(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 8
64: LDC 0,0(0) 
65: ST 0,-8(5) 
* Store back the result of the assignment operation
66: LD 0,-7(5) Load to memory the address and result value
67: LD 1,-8(5) 
68: ST 1,0(0) 
69: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
70: LD 0,-2(5) Value of i
71: ST 0,-8(5) 
* Loading Constant 3 to register 0 and save to memory with offset 9
72: LDC 0,3(0) 
73: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
74: LD 0,-8(5) Load Left hand side
75: LD 1,-9(5) Load Right hand side
76: SUB 0,0,1 Subtract for Comparison
77: JLT 0,2(7) Jump to next instruction if true
78: LDC 0,0(0) Load 0 (false)
79: LDA 7,1(7) Unconditional Jump
80: LDC 0,1(0) Load 1 (true)
81: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* --- Calling output() ---
* Offset: 8
* Adding argument 1
84: LD 0,-2(5) Value of i
85: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array x[] and save it to offset 9
86: LDA 0,-3(5) Load address to register
87: LD 1,-10(5) Load index value to register
88: SUB 0,0,1 Substract the offset to the address
89: LD 0,0(0) Load the value at the x[index] address to the AC
90: ST 0,-9(5) Value of x[index]
91: ST 0,-10(5) Storing argument
* Create new activation record
92: ST 5,-8(5) Save address of current frame pointer to memory with offset 8
93: LDA 5,-8(5) Load the frame pointer so that it starts at offset 8
94: LDA 0,1(7) Save the return address in the accumulator
95: LDA 7,-89(7) Jump to output()
96: LD 5,0(5) Pop the frame and return to the current frame
97: ST 0,-8(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
98: LDA 0,-2(5) Load address for var (i)
99: ST 0,-9(5) &i
* --- Operation Expression ---
100: LD 0,-2(5) Value of i
101: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
102: LDC 0,1(0) 
103: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
104: LD 0,-11(5) Load Left hand side
105: LD 1,-12(5) Load Right hand side
106: ADD 0,0,1 Operation
107: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
108: LD 0,-9(5) Load to memory the address and result value
109: LD 1,-10(5) 
110: ST 1,0(0) 
111: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
112: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
82: LD 0,-7(5) Load test value
83: JLE 0,29(7) Jump to end if test <= 0 (false)
113: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,102(7) Jump around function bodies
* --- Final ---
114: ST 5,0(5) Original Pointer
115: LDA 5,0(5) Push Main Frame Pointer
116: LDA 0,1(7) Load Accumulator with return pointer
117: LDA 7,-106(7) Jump to Location
118: LD 5,0(5) Pop Main Frame
119: HALT 0,0,0 Exit
* --- Final ---
