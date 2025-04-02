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
* Making space for array variable (arr[5])
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
36: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array a[] and save it to offset 9
37: LD 0,-2(5) Original Address of a, PO: 3, SA: 2, P*: 5
38: LD 1,-10(5) Load index value to register
39: SUB 0,0,1 Substract the offset to the address
40: LD 0,0(0) Load the value at the a[index] address to the AC
41: ST 0,-9(5) Value of a[index]
42: ST 0,-8(5) Storing argument
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
* --- Function Declaration (printArray) ---
* --- Function Declaration (printArray2) ---
65: ST 0,-1(5) Store return
* Making Space for variable (i)
* --- Assignment Expression ---
66: LDA 0,-2(5) Load address for var (i)
67: ST 0,-4(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 5
68: LDC 0,0(0) 
69: ST 0,-5(5) 
* Store back the result of the assignment operation
70: LD 0,-4(5) Load to memory the address and result value
71: LD 1,-5(5) 
72: ST 1,0(0) 
73: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
74: LD 0,-2(5) Value of i
75: ST 0,-5(5) 
* Loading Constant 5 to register 0 and save to memory with offset 6
76: LDC 0,5(0) 
77: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
78: LD 0,-5(5) Load Left hand side
79: LD 1,-6(5) Load Right hand side
80: SUB 0,0,1 Subtract for Comparison
81: JLT 0,2(7) Jump to next instruction if true
82: LDC 0,0(0) Load 0 (false)
83: LDA 7,1(7) Unconditional Jump
84: LDC 0,1(0) Load 1 (true)
85: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Calling output() ---
* Offset: 5
* Adding argument 1
88: LD 0,-2(5) Value of i
89: ST 0,-9(5) 
* Load index calculated at offset 9 and base address of array arr[] and save it to offset 8
90: LDA 0,0(6) Address of arr, PO: 2, SA: 0, P*: 6
91: LD 1,-9(5) Load index value to register
92: SUB 0,0,1 Substract the offset to the address
93: LD 0,0(0) Load the value at the arr[index] address to the AC
94: ST 0,-8(5) Value of arr[index]
95: ST 0,-7(5) Storing argument
* Create new activation record
96: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
97: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
98: LDA 0,1(7) Save the return address in the accumulator
99: LDA 7,-93(7) Jump to output()
100: LD 5,0(5) Pop the frame and return to the current frame
101: ST 0,-5(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
102: LDA 0,-2(5) Load address for var (i)
103: ST 0,-6(5) &i
* --- Operation Expression ---
104: LD 0,-2(5) Value of i
105: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
106: LDC 0,1(0) 
107: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
108: LD 0,-8(5) Load Left hand side
109: LD 1,-9(5) Load Right hand side
110: ADD 0,0,1 Operation
111: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
112: LD 0,-6(5) Load to memory the address and result value
113: LD 1,-7(5) 
114: ST 1,0(0) 
115: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
116: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
86: LD 0,-4(5) Load test value
87: JLE 0,29(7) Jump to end if test <= 0 (false)
117: LD 7,-1(5) Return to caller
* --- Function Declaration (printArray2) ---
* --- Function Declaration (makeArray) ---
118: ST 0,-1(5) Store return
* Making space for array variable (a[1])
* Making Space for variable (i)
* --- Assignment Expression ---
119: LDA 0,-3(5) Load address for var (i)
120: ST 0,-5(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 6
121: LDC 0,0(0) 
122: ST 0,-6(5) 
* Store back the result of the assignment operation
123: LD 0,-5(5) Load to memory the address and result value
124: LD 1,-6(5) 
125: ST 1,0(0) 
126: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
127: LD 0,-3(5) Value of i
128: ST 0,-6(5) 
* Loading Constant 5 to register 0 and save to memory with offset 7
129: LDC 0,5(0) 
130: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
131: LD 0,-6(5) Load Left hand side
132: LD 1,-7(5) Load Right hand side
133: SUB 0,0,1 Subtract for Comparison
134: JLT 0,2(7) Jump to next instruction if true
135: LDC 0,0(0) Load 0 (false)
136: LDA 7,1(7) Unconditional Jump
137: LDC 0,1(0) Load 1 (true)
138: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
141: LD 0,-3(5) Value of i
142: ST 0,-8(5) 
* Load index calculated at offset 8 and base address of array a[] and save it to offset 7
143: LD 0,-2(5) Original Address of a, PO: 3, SA: 2, P*: 5
144: LD 1,-8(5) Load index value to register
145: SUB 0,0,1 Substract the offset to the address
146: ST 0,-7(5) Store the address given the index at offset 7
* --- Operation Expression ---
147: LD 0,-3(5) Value of i
148: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
149: LDC 0,1(0) 
150: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
151: LD 0,-9(5) Load Left hand side
152: LD 1,-10(5) Load Right hand side
153: ADD 0,0,1 Operation
154: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
155: LD 0,-7(5) Load to memory the address and result value
156: LD 1,-8(5) 
157: ST 1,0(0) 
158: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
159: LDA 0,-3(5) Load address for var (i)
160: ST 0,-7(5) &i
* --- Operation Expression ---
161: LD 0,-3(5) Value of i
162: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
163: LDC 0,1(0) 
164: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
165: LD 0,-9(5) Load Left hand side
166: LD 1,-10(5) Load Right hand side
167: ADD 0,0,1 Operation
168: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
169: LD 0,-7(5) Load to memory the address and result value
170: LD 1,-8(5) 
171: ST 1,0(0) 
172: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
173: LDA 7,-45(7) Jump to test after body
* Load the test value to register 0
139: LD 0,-5(5) Load test value
140: JLE 0,33(7) Jump to end if test <= 0 (false)
* --- Calling printArray() ---
* Offset: 4
* Adding argument 1
174: LD 0,-2(5) Original Address of a, PO: 3, SA: 2, P*: 5
175: ST 0,-7(5) 
176: ST 0,-6(5) Storing argument
* Create new activation record
177: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
178: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
179: LDA 0,1(7) Save the return address in the accumulator
180: LDA 7,-169(7) Jump to printArray()
181: LD 5,0(5) Pop the frame and return to the current frame
182: ST 0,-4(5) Store return value
* --- Calling printArray() ---
* --- Calling printArray2() ---
* Offset: 4
* Create new activation record
183: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
184: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
185: LDA 0,1(7) Save the return address in the accumulator
186: LDA 7,-122(7) Jump to printArray2()
187: LD 5,0(5) Pop the frame and return to the current frame
188: ST 0,-4(5) Store return value
* --- Calling printArray2() ---
189: LD 7,-1(5) Return to caller
* --- Function Declaration (makeArray) ---
* --- Function Declaration (main) ---
190: ST 0,-1(5) Store return
* --- Calling makeArray() ---
* Offset: 2
* Adding argument 1
191: LDA 0,0(6) Address of arr, PO: 2, SA: 0, P*: 6
192: ST 0,-5(5) 
193: ST 0,-4(5) Storing argument
* Create new activation record
194: ST 5,-2(5) Save address of current frame pointer to memory with offset 2
195: LDA 5,-2(5) Load the frame pointer so that it starts at offset 2
196: LDA 0,1(7) Save the return address in the accumulator
197: LDA 7,-80(7) Jump to makeArray()
198: LD 5,0(5) Pop the frame and return to the current frame
199: ST 0,-2(5) Store return value
* --- Calling makeArray() ---
* --- Return Expression ---
* Loading Constant 0 to register 0 and save to memory with offset 3
200: LDC 0,0(0) 
201: ST 0,-3(5) 
202: LD 1,0(0) Save value from return expression
203: LD 7,-1(5) Return to caller
* --- Return Expression ---
204: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,193(7) Jump around function bodies
* --- Final ---
205: ST 5,-5(5) Original Pointer
206: LDA 5,-5(5) Push Main Frame Pointer
207: LDA 0,1(7) Load Accumulator with return pointer
208: LDA 7,-19(7) Jump to Location
209: LD 5,0(5) Pop Main Frame
210: HALT 0,0,0 Exit
* --- Final ---
