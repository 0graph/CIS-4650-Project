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
* Making space for array variable (x[3])
* --- Function Declaration (other) ---
12: ST 0,-1(5) Store return
* Making space for array variable (x[1])
* Making Space for variable (i)
* --- Assignment Expression ---
13: LDA 0,-3(5) Load address for var (i)
14: ST 0,-5(5) &i
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
21: LD 0,-3(5) Value of i
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
* --- Calling output() ---
* Offset: 6
* Adding argument 1
35: LD 0,-3(5) Value of i
36: ST 0,-8(5) 
* Load index calculated at offset 8 and base address of array x[] and save it to offset 7
37: LDA 0,-2(5) Load address to register
38: LD 1,-8(5) Load index value to register
39: SUB 0,0,1 Substract the offset to the address
40: LD 0,0(0) Load the value at the x[index] address to the AC
41: ST 0,-7(5) Value of x[index]
42: ST 0,-7(5) Storing argument
* Create new activation record
43: ST 5,-6(5) Save address of current frame pointer to memory with offset 6
44: LDA 5,-6(5) Load the frame pointer so that it starts at offset 6
45: LDA 0,1(7) Save the return address in the accumulator
46: LDA 7,-40(7) Jump to output()
47: LD 5,0(5) Pop the frame and return to the current frame
48: ST 0,-6(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
49: LDA 0,-3(5) Load address for var (i)
50: ST 0,-7(5) &i
* --- Operation Expression ---
51: LD 0,-3(5) Value of i
52: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
53: LDC 0,1(0) 
54: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
55: LD 0,-9(5) Load Left hand side
56: LD 1,-10(5) Load Right hand side
57: ADD 0,0,1 Operation
58: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
59: LD 0,-7(5) Load to memory the address and result value
60: LD 1,-8(5) 
61: ST 1,0(0) 
62: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
63: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
33: LD 0,-5(5) Load test value
34: JLE 0,29(7) Jump to end if test <= 0 (false)
64: LD 7,-1(5) Return to caller
* --- Function Declaration (other) ---
* --- Function Declaration (add) ---
65: ST 0,-1(5) Store return
* Making space for array variable (x[1])
* Making Space for variable (i)
* --- Assignment Expression ---
66: LDA 0,-3(5) Load address for var (i)
67: ST 0,-5(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 6
68: LDC 0,0(0) 
69: ST 0,-6(5) 
* Store back the result of the assignment operation
70: LD 0,-5(5) Load to memory the address and result value
71: LD 1,-6(5) 
72: ST 1,0(0) 
73: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
74: LD 0,-3(5) Value of i
75: ST 0,-6(5) 
* Loading Constant 3 to register 0 and save to memory with offset 7
76: LDC 0,3(0) 
77: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
78: LD 0,-6(5) Load Left hand side
79: LD 1,-7(5) Load Right hand side
80: SUB 0,0,1 Subtract for Comparison
81: JLT 0,2(7) Jump to next instruction if true
82: LDC 0,0(0) Load 0 (false)
83: LDA 7,1(7) Unconditional Jump
84: LDC 0,1(0) Load 1 (true)
85: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
88: LD 0,-3(5) Value of i
89: ST 0,-8(5) 
* Load index calculated at offset 8 and base address of array x[] and save it to offset 7
90: LDA 0,-2(5) Load address to register
91: LD 1,-8(5) Load index value to register
92: SUB 0,0,1 Substract the offset to the address
93: ST 0,-7(5) Store the address given the index at offset 7
94: LD 0,-3(5) Value of i
95: ST 0,-8(5) 
* Store back the result of the assignment operation
96: LD 0,-7(5) Load to memory the address and result value
97: LD 1,-8(5) 
98: ST 1,0(0) 
99: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
100: LDA 0,-3(5) Load address for var (i)
101: ST 0,-7(5) &i
* --- Operation Expression ---
102: LD 0,-3(5) Value of i
103: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
104: LDC 0,1(0) 
105: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
106: LD 0,-9(5) Load Left hand side
107: LD 1,-10(5) Load Right hand side
108: ADD 0,0,1 Operation
109: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
110: LD 0,-7(5) Load to memory the address and result value
111: LD 1,-8(5) 
112: ST 1,0(0) 
113: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
114: LDA 7,-39(7) Jump to test after body
* Load the test value to register 0
86: LD 0,-5(5) Load test value
87: JLE 0,27(7) Jump to end if test <= 0 (false)
* --- Calling other() ---
* Offset: 4
* Adding argument 1
115: LDA 0,-2(5) Address of x
116: LD 0,0(0) Derefence the pointer to the address of x
117: ST 0,-5(5) 
118: ST 0,-5(5) Storing argument
* Create new activation record
119: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
120: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
121: LDA 0,1(7) Save the return address in the accumulator
122: LDA 7,-111(7) Jump to other()
123: LD 5,0(5) Pop the frame and return to the current frame
124: ST 0,-4(5) Store return value
* --- Calling other() ---
125: LD 7,-1(5) Return to caller
* --- Function Declaration (add) ---
* --- Function Declaration (main) ---
126: ST 0,-1(5) Store return
* --- Calling add() ---
* Offset: 2
* Adding argument 1
127: LDA 0,0(6) Address of x
128: LD 0,0(0) Derefence the pointer to the address of x
129: ST 0,-3(6) 
130: ST 0,-3(5) Storing argument
* Create new activation record
131: ST 5,-2(5) Save address of current frame pointer to memory with offset 2
132: LDA 5,-2(5) Load the frame pointer so that it starts at offset 2
133: LDA 0,1(7) Save the return address in the accumulator
134: LDA 7,-70(7) Jump to add()
135: LD 5,0(5) Pop the frame and return to the current frame
136: ST 0,-2(5) Store return value
* --- Calling add() ---
137: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,126(7) Jump around function bodies
* --- Final ---
138: ST 5,-3(5) Original Pointer
139: LDA 5,-3(5) Push Main Frame Pointer
140: LDA 0,1(7) Load Accumulator with return pointer
141: LDA 7,-16(7) Jump to Location
142: LD 5,0(5) Pop Main Frame
143: HALT 0,0,0 Exit
* --- Final ---
