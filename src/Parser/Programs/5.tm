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
* --- Function Declaration (add) ---
12: ST 0,-1(5) Store return
* Making space for array variable (x[1])
* Making Space for variable (j)
* --- Assignment Expression ---
13: LDA 0,-3(5) Load address for var (j)
14: ST 0,-5(5) &j
* Loading Constant 0 to register 0 and save to memory with offset 6
15: LDC 0,0(0) 
16: ST 0,-6(5) 
* Store back the result of the assignment operation
17: LD 0,-5(5) Load to memory the address and result value
18: LD 1,-6(5) 
19: ST 1,0(0) 
20: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
21: LD 0,-3(5) Value of j
22: ST 0,-6(5) 
* Loading Constant 3 to register 0 and save to memory with offset 7
23: LDC 0,3(0) 
24: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
25: LD 0,-6(5) Load Left hand side
26: LD 1,-7(5) Load Right hand side
27: SUB 0,0,1 Subtract for Comparison
28: JLT 0,2(7) Jump to next instruction if true
29: LDC 0,0(0) Load 0 (false)
30: LDA 7,1(7) Unconditional Jump
31: LDC 0,1(0) Load 1 (true)
32: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
35: LD 0,-3(5) Value of j
36: ST 0,-8(5) 
* Load index calculated at offset 8 and base address of array x[] and save it to offset 7
37: LD 0,-2(5) Original Address of x, PO: 3, SA: 2, P*: 5
38: LD 1,-8(5) Load index value to register
39: SUB 0,0,1 Substract the offset to the address
40: ST 0,-7(5) Store the address given the index at offset 7
* --- Operation Expression ---
41: LD 0,-3(5) Value of j
42: ST 0,-9(5) 
* Loading Constant 2 to register 0 and save to memory with offset 10
43: LDC 0,2(0) 
44: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
45: LD 0,-9(5) Load Left hand side
46: LD 1,-10(5) Load Right hand side
47: MUL 0,0,1 Operation
48: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
49: LD 0,-7(5) Load to memory the address and result value
50: LD 1,-8(5) 
51: ST 1,0(0) 
52: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
53: LDA 0,-3(5) Load address for var (j)
54: ST 0,-7(5) &j
* --- Operation Expression ---
55: LD 0,-3(5) Value of j
56: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
57: LDC 0,1(0) 
58: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
59: LD 0,-9(5) Load Left hand side
60: LD 1,-10(5) Load Right hand side
61: ADD 0,0,1 Operation
62: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
63: LD 0,-7(5) Load to memory the address and result value
64: LD 1,-8(5) 
65: ST 1,0(0) 
66: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
67: LDA 7,-45(7) Jump to test after body
* Load the test value to register 0
33: LD 0,-5(5) Load test value
34: JLE 0,33(7) Jump to end if test <= 0 (false)
68: LD 7,-1(5) Return to caller
* --- Function Declaration (add) ---
* --- Function Declaration (main) ---
69: ST 0,-1(5) Store return
* Making Space for variable (i)
* Making space for array variable (x[3])
* --- Calling add() ---
* Offset: 6
* Adding argument 1
70: LDA 0,-3(5) Address of x, PO: 2, SA: 3, P*: 5
71: ST 0,-9(5) 
72: ST 0,-8(5) Storing argument
* Create new activation record
73: ST 5,-6(5) Save address of current frame pointer to memory with offset 6
74: LDA 5,-6(5) Load the frame pointer so that it starts at offset 6
75: LDA 0,1(7) Save the return address in the accumulator
76: LDA 7,-65(7) Jump to add()
77: LD 5,0(5) Pop the frame and return to the current frame
78: ST 0,-6(5) Store return value
* --- Calling add() ---
* --- Assignment Expression ---
79: LDA 0,-2(5) Load address for var (i)
80: ST 0,-7(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 8
81: LDC 0,0(0) 
82: ST 0,-8(5) 
* Store back the result of the assignment operation
83: LD 0,-7(5) Load to memory the address and result value
84: LD 1,-8(5) 
85: ST 1,0(0) 
86: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
87: LD 0,-2(5) Value of i
88: ST 0,-8(5) 
* Loading Constant 3 to register 0 and save to memory with offset 9
89: LDC 0,3(0) 
90: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
91: LD 0,-8(5) Load Left hand side
92: LD 1,-9(5) Load Right hand side
93: SUB 0,0,1 Subtract for Comparison
94: JLT 0,2(7) Jump to next instruction if true
95: LDC 0,0(0) Load 0 (false)
96: LDA 7,1(7) Unconditional Jump
97: LDC 0,1(0) Load 1 (true)
98: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* --- Calling output() ---
* Offset: 8
* Adding argument 1
101: LD 0,-2(5) Value of i
102: ST 0,-12(5) 
* Load index calculated at offset 12 and base address of array x[] and save it to offset 11
103: LDA 0,-3(5) Address of x, PO: 2, SA: 3, P*: 5
104: LD 1,-12(5) Load index value to register
105: SUB 0,0,1 Substract the offset to the address
106: LD 0,0(0) Load the value at the x[index] address to the AC
107: ST 0,-11(5) Value of x[index]
108: ST 0,-10(5) Storing argument
* Create new activation record
109: ST 5,-8(5) Save address of current frame pointer to memory with offset 8
110: LDA 5,-8(5) Load the frame pointer so that it starts at offset 8
111: LDA 0,1(7) Save the return address in the accumulator
112: LDA 7,-106(7) Jump to output()
113: LD 5,0(5) Pop the frame and return to the current frame
114: ST 0,-8(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
115: LDA 0,-2(5) Load address for var (i)
116: ST 0,-9(5) &i
* --- Operation Expression ---
117: LD 0,-2(5) Value of i
118: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
119: LDC 0,1(0) 
120: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
121: LD 0,-11(5) Load Left hand side
122: LD 1,-12(5) Load Right hand side
123: ADD 0,0,1 Operation
124: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
125: LD 0,-9(5) Load to memory the address and result value
126: LD 1,-10(5) 
127: ST 1,0(0) 
128: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
129: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
99: LD 0,-7(5) Load test value
100: JLE 0,29(7) Jump to end if test <= 0 (false)
130: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,119(7) Jump around function bodies
* --- Final ---
131: ST 5,0(5) Original Pointer
132: LDA 5,0(5) Push Main Frame Pointer
133: LDA 0,1(7) Load Accumulator with return pointer
134: LDA 7,-66(7) Jump to Location
135: LD 5,0(5) Pop Main Frame
136: HALT 0,0,0 Exit
* --- Final ---
