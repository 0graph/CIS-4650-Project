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
37: LD 0,-2(5) Load address to register
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
71: ST 0,-7(5) 
72: ST 0,-8(5) Storing argument
* Create new activation record
73: ST 5,-6(5) Save address of current frame pointer to memory with offset 6
74: LDA 5,-6(5) Load the frame pointer so that it starts at offset 6
75: LDA 0,2(7) Save the return address in the accumulator
76: BRK 0,0,0 Breakpoint
77: LDA 7,-66(7) Jump to add()
78: LD 5,0(5) Pop the frame and return to the current frame
79: ST 0,-6(5) Store return value
* --- Calling add() ---
* --- Assignment Expression ---
80: LDA 0,-2(5) Load address for var (i)
81: ST 0,-7(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 8
82: LDC 0,0(0) 
83: ST 0,-8(5) 
* Store back the result of the assignment operation
84: LD 0,-7(5) Load to memory the address and result value
85: LD 1,-8(5) 
86: ST 1,0(0) 
87: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
88: LD 0,-2(5) Value of i
89: ST 0,-8(5) 
* Loading Constant 3 to register 0 and save to memory with offset 9
90: LDC 0,3(0) 
91: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
92: LD 0,-8(5) Load Left hand side
93: LD 1,-9(5) Load Right hand side
94: SUB 0,0,1 Subtract for Comparison
95: JLT 0,2(7) Jump to next instruction if true
96: LDC 0,0(0) Load 0 (false)
97: LDA 7,1(7) Unconditional Jump
98: LDC 0,1(0) Load 1 (true)
99: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* --- Calling output() ---
* Offset: 8
* Adding argument 1
102: LD 0,-2(5) Value of i
103: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array x[] and save it to offset 9
104: LD 0,-3(5) Load address to register
105: LD 1,-10(5) Load index value to register
106: SUB 0,0,1 Substract the offset to the address
107: LD 0,0(0) Load the value at the x[index] address to the AC
108: ST 0,-9(5) Value of x[index]
109: ST 0,-10(5) Storing argument
* Create new activation record
110: ST 5,-8(5) Save address of current frame pointer to memory with offset 8
111: LDA 5,-8(5) Load the frame pointer so that it starts at offset 8
112: LDA 0,2(7) Save the return address in the accumulator
113: BRK 0,0,0 Breakpoint
114: LDA 7,-108(7) Jump to output()
115: LD 5,0(5) Pop the frame and return to the current frame
116: ST 0,-8(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
117: LDA 0,-2(5) Load address for var (i)
118: ST 0,-9(5) &i
* --- Operation Expression ---
119: LD 0,-2(5) Value of i
120: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
121: LDC 0,1(0) 
122: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
123: LD 0,-11(5) Load Left hand side
124: LD 1,-12(5) Load Right hand side
125: ADD 0,0,1 Operation
126: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
127: LD 0,-9(5) Load to memory the address and result value
128: LD 1,-10(5) 
129: ST 1,0(0) 
130: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
131: LDA 7,-42(7) Jump to test after body
* Load the test value to register 0
100: LD 0,-7(5) Load test value
101: JLE 0,30(7) Jump to end if test <= 0 (false)
132: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,121(7) Jump around function bodies
* --- Final ---
133: ST 5,0(5) Original Pointer
134: LDA 5,0(5) Push Main Frame Pointer
135: LDA 0,1(7) Load Accumulator with return pointer
136: LDA 7,-68(7) Jump to Location
137: LD 5,0(5) Pop Main Frame
138: HALT 0,0,0 Exit
* --- Final ---
