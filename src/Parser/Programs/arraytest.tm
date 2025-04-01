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
* --- Function Declaration (printArray) ---
12: ST 0,-1(5) Store return
* Making space for array variable (a[1])
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
* Loading Constant 5 to register 0 and save to memory with offset 7
23: LDC 0,5(0) 
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
* Load index calculated at offset 8 and base address of array a[] and save it to offset 7
37: LDA 0,-2(5) Load address to register
38: LD 1,-8(5) Load index value to register
39: SUB 0,0,1 Substract the offset to the address
40: LD 0,0(0) Load the value at the a[index] address to the AC
41: ST 0,-7(5) Value of a[index]
42: ST 0,-8(5) Storing argument
* Create new activation record
43: ST 5,-6(5) Save address of current frame pointer to memory with offset 6
44: LDA 5,-6(5) Load the frame pointer so that it starts at offset 6
45: LDA 0,1(7) Save the return address in the accumulator
46: LDA 7,-40(7) Jump to output()
47: BRK 0,0,0 Breakpoint
48: LD 5,0(5) Pop the frame and return to the current frame
49: ST 0,-6(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
50: LDA 0,-3(5) Load address for var (i)
51: ST 0,-7(5) &i
* --- Operation Expression ---
52: LD 0,-3(5) Value of i
53: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
54: LDC 0,1(0) 
55: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
56: LD 0,-9(5) Load Left hand side
57: LD 1,-10(5) Load Right hand side
58: ADD 0,0,1 Operation
59: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
60: LD 0,-7(5) Load to memory the address and result value
61: LD 1,-8(5) 
62: ST 1,0(0) 
63: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
64: LDA 7,-42(7) Jump to test after body
* Load the test value to register 0
33: LD 0,-5(5) Load test value
34: JLE 0,30(7) Jump to end if test <= 0 (false)
65: LD 7,-1(5) Return to caller
* --- Function Declaration (printArray) ---
* --- Function Declaration (makeArray) ---
66: ST 0,-1(5) Store return
* Making space for array variable (a[1])
* Making Space for variable (i)
* --- Assignment Expression ---
67: LDA 0,-3(5) Load address for var (i)
68: ST 0,-5(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 6
69: LDC 0,0(0) 
70: ST 0,-6(5) 
* Store back the result of the assignment operation
71: LD 0,-5(5) Load to memory the address and result value
72: LD 1,-6(5) 
73: ST 1,0(0) 
74: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
75: LD 0,-3(5) Value of i
76: ST 0,-6(5) 
* Loading Constant 5 to register 0 and save to memory with offset 7
77: LDC 0,5(0) 
78: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
79: LD 0,-6(5) Load Left hand side
80: LD 1,-7(5) Load Right hand side
81: SUB 0,0,1 Subtract for Comparison
82: JLT 0,2(7) Jump to next instruction if true
83: LDC 0,0(0) Load 0 (false)
84: LDA 7,1(7) Unconditional Jump
85: LDC 0,1(0) Load 1 (true)
86: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
89: LD 0,-3(5) Value of i
90: ST 0,-8(5) 
* Load index calculated at offset 8 and base address of array a[] and save it to offset 7
91: LDA 0,-2(5) Load address to register
92: LD 1,-8(5) Load index value to register
93: SUB 0,0,1 Substract the offset to the address
94: ST 0,-7(5) Store the address given the index at offset 7
* --- Operation Expression ---
95: LD 0,-3(5) Value of i
96: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
97: LDC 0,1(0) 
98: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
99: LD 0,-9(5) Load Left hand side
100: LD 1,-10(5) Load Right hand side
101: ADD 0,0,1 Operation
102: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
103: LD 0,-7(5) Load to memory the address and result value
104: LD 1,-8(5) 
105: ST 1,0(0) 
106: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
107: LDA 0,-3(5) Load address for var (i)
108: ST 0,-7(5) &i
* --- Operation Expression ---
109: LD 0,-3(5) Value of i
110: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
111: LDC 0,1(0) 
112: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
113: LD 0,-9(5) Load Left hand side
114: LD 1,-10(5) Load Right hand side
115: ADD 0,0,1 Operation
116: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
117: LD 0,-7(5) Load to memory the address and result value
118: LD 1,-8(5) 
119: ST 1,0(0) 
120: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
121: LDA 7,-45(7) Jump to test after body
* Load the test value to register 0
87: LD 0,-5(5) Load test value
88: JLE 0,33(7) Jump to end if test <= 0 (false)
* --- Calling printArray() ---
* Offset: 4
* Adding argument 1
122: LDA 0,-2(5) Address of a
123: LD 0,0(0) Derefence the pointer to the address of a
124: ST 0,-5(5) 
125: ST 0,-6(5) Storing argument
* Create new activation record
126: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
127: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
128: LDA 0,1(7) Save the return address in the accumulator
129: LDA 7,-118(7) Jump to printArray()
130: BRK 0,0,0 Breakpoint
131: LD 5,0(5) Pop the frame and return to the current frame
132: ST 0,-4(5) Store return value
* --- Calling printArray() ---
133: LD 7,-1(5) Return to caller
* --- Function Declaration (makeArray) ---
* --- Function Declaration (main) ---
134: ST 0,-1(5) Store return
* Making space for array variable (arr[5])
* --- Calling makeArray() ---
* Offset: 7
* Adding argument 1
135: LDA 0,-2(5) Address of arr
136: LD 0,0(0) Derefence the pointer to the address of arr
137: ST 0,-8(5) 
138: ST 0,-9(5) Storing argument
* Create new activation record
139: ST 5,-7(5) Save address of current frame pointer to memory with offset 7
140: LDA 5,-7(5) Load the frame pointer so that it starts at offset 7
141: LDA 0,1(7) Save the return address in the accumulator
142: LDA 7,-77(7) Jump to makeArray()
143: BRK 0,0,0 Breakpoint
144: LD 5,0(5) Pop the frame and return to the current frame
145: ST 0,-7(5) Store return value
* --- Calling makeArray() ---
* --- Return Expression ---
* Loading Constant 0 to register 0 and save to memory with offset 8
146: LDC 0,0(0) 
147: ST 0,-8(5) 
148: LD 1,0(0) Save value from return expression
149: LD 7,-1(5) Return to caller
* --- Return Expression ---
150: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,139(7) Jump around function bodies
* --- Final ---
151: ST 5,0(5) Original Pointer
152: LDA 5,0(5) Push Main Frame Pointer
153: LDA 0,1(7) Load Accumulator with return pointer
154: LDA 7,-21(7) Jump to Location
155: LD 5,0(5) Pop Main Frame
156: HALT 0,0,0 Exit
* --- Final ---
