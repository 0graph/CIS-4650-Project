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
* Making Space for variable (x)
* Making Space for variable (y)
* --- Function Declaration (f) ---
12: ST 0,-1(5) Store return
* Making Space for variable (n)
* --- Calling g() ---
* Offset: 3
* Adding argument 1
13: LD 0,-2(5) Value of n
14: ST 0,-6(5) 
15: ST 0,-5(5) Storing argument
* Create new activation record
16: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
17: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
18: LDA 0,1(7) Save the return address in the accumulator
19: LDA 7,17(7) Patched jump to g
20: LD 5,0(5) Pop the frame and return to the current frame
21: ST 0,-3(5) Store return value
* --- Calling g() ---
* --- Assignment Expression ---
22: LDA 0,-1(6) Load address for var (y)
23: ST 0,-4(5) &y
* --- Operation Expression ---
24: LD 0,-1(6) Value of y
25: ST 0,-6(5) 
* Loading Constant 1 to register 0 and save to memory with offset 7
26: LDC 0,1(0) 
27: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
28: LD 0,-6(5) Load Left hand side
29: LD 1,-7(5) Load Right hand side
30: SUB 0,0,1 Operation
31: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
32: LD 0,-4(5) Load to memory the address and result value
33: LD 1,-5(5) 
34: ST 1,0(0) 
35: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
36: LD 7,-1(5) Return to caller
* --- Function Declaration (f) ---
* --- Function Declaration (g) ---
37: ST 0,-1(5) Store return
* Making Space for variable (m)
* --- Assignment Expression ---
38: LDA 0,-2(5) Load address for var (m)
39: ST 0,-4(5) &m
* --- Operation Expression ---
40: LD 0,-2(5) Value of m
41: ST 0,-6(5) 
* Loading Constant 1 to register 0 and save to memory with offset 7
42: LDC 0,1(0) 
43: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
44: LD 0,-6(5) Load Left hand side
45: LD 1,-7(5) Load Right hand side
46: SUB 0,0,1 Operation
47: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
48: LD 0,-4(5) Load to memory the address and result value
49: LD 1,-5(5) 
50: ST 1,0(0) 
51: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- If Expression ---
* --- Operation Expression ---
52: LD 0,-2(5) Value of m
53: ST 0,-5(5) 
* Loading Constant 0 to register 0 and save to memory with offset 6
54: LDC 0,0(0) 
55: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
56: LD 0,-5(5) Load Left hand side
57: LD 1,-6(5) Load Right hand side
58: SUB 0,0,1 Subtract for Comparison
59: JGT 0,2(7) Jump to next instruction if true
60: LDC 0,0(0) Load 0 (false)
61: LDA 7,1(7) Unconditional Jump
62: LDC 0,1(0) Load 1 (true)
63: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Calling f() ---
* Offset: 4
* Adding argument 1
65: LD 0,-2(5) Value of m
66: ST 0,-7(5) 
67: ST 0,-6(5) Storing argument
* Create new activation record
68: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
69: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
70: LDA 0,1(7) Save the return address in the accumulator
71: LDA 7,-60(7) Jump to f()
72: LD 5,0(5) Pop the frame and return to the current frame
73: ST 0,-4(5) Store return value
* --- Calling f() ---
* --- Assignment Expression ---
74: LDA 0,-1(6) Load address for var (y)
75: ST 0,-5(5) &y
* --- Operation Expression ---
76: LD 0,-1(6) Value of y
77: ST 0,-7(5) 
* Loading Constant 1 to register 0 and save to memory with offset 8
78: LDC 0,1(0) 
79: ST 0,-8(5) 
* Save the result of the operation expression to the address offset 6
80: LD 0,-7(5) Load Left hand side
81: LD 1,-8(5) Load Right hand side
82: SUB 0,0,1 Operation
83: ST 0,-6(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
84: LD 0,-5(5) Load to memory the address and result value
85: LD 1,-6(5) 
86: ST 1,0(0) 
87: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- Calling g() ---
* Offset: 4
* Adding argument 1
88: LD 0,-2(5) Value of m
89: ST 0,-7(5) 
90: ST 0,-6(5) Storing argument
* Create new activation record
91: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
92: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
93: LDA 0,1(7) Save the return address in the accumulator
94: LDA 7,-58(7) Jump to g()
95: LD 5,0(5) Pop the frame and return to the current frame
96: ST 0,-4(5) Store return value
* --- Calling g() ---
64: JEQ 0,33(7) if false jump 33 instructions
97: LDA 7,0(7) jump around body
* --- If Expression ---
98: LD 7,-1(5) Return to caller
* --- Function Declaration (g) ---
* --- Function Declaration (main) ---
99: ST 0,-1(5) Store return
* --- Assignment Expression ---
100: LDA 0,0(6) Load address for var (x)
101: ST 0,-3(5) &x
* --- Calling input() ---
* Offset: 4
* Create new activation record
102: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
103: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
104: LDA 0,1(7) Save the return address in the accumulator
105: LDA 7,-102(7) Jump to input()
106: LD 5,0(5) Pop the frame and return to the current frame
107: ST 0,-4(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
108: LD 0,-3(5) Load to memory the address and result value
109: LD 1,-4(5) 
110: ST 1,0(0) 
111: ST 1,-2(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
112: LDA 0,-1(6) Load address for var (y)
113: ST 0,-3(5) &y
* --- Calling input() ---
* Offset: 4
* Create new activation record
114: ST 5,-4(5) Save address of current frame pointer to memory with offset 4
115: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
116: LDA 0,1(7) Save the return address in the accumulator
117: LDA 7,-114(7) Jump to input()
118: LD 5,0(5) Pop the frame and return to the current frame
119: ST 0,-4(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
120: LD 0,-3(5) Load to memory the address and result value
121: LD 1,-4(5) 
122: ST 1,0(0) 
123: ST 1,-2(5) Value Stored!
* --- Assignment Expression ---
* --- Calling g() ---
* Offset: 2
* Adding argument 1
124: LD 0,0(6) Value of x
125: ST 0,-5(5) 
126: ST 0,-4(5) Storing argument
* Create new activation record
127: ST 5,-2(5) Save address of current frame pointer to memory with offset 2
128: LDA 5,-2(5) Load the frame pointer so that it starts at offset 2
129: LDA 0,1(7) Save the return address in the accumulator
130: LDA 7,-94(7) Jump to g()
131: LD 5,0(5) Pop the frame and return to the current frame
132: ST 0,-2(5) Store return value
* --- Calling g() ---
* --- Calling output() ---
* Offset: 2
* Adding argument 1
133: LD 0,0(6) Value of x
134: ST 0,-5(5) 
135: ST 0,-4(5) Storing argument
* Create new activation record
136: ST 5,-2(5) Save address of current frame pointer to memory with offset 2
137: LDA 5,-2(5) Load the frame pointer so that it starts at offset 2
138: LDA 0,1(7) Save the return address in the accumulator
139: LDA 7,-133(7) Jump to output()
140: LD 5,0(5) Pop the frame and return to the current frame
141: ST 0,-2(5) Store return value
* --- Calling output() ---
* --- Calling output() ---
* Offset: 2
* Adding argument 1
142: LD 0,-1(6) Value of y
143: ST 0,-5(5) 
144: ST 0,-4(5) Storing argument
* Create new activation record
145: ST 5,-2(5) Save address of current frame pointer to memory with offset 2
146: LDA 5,-2(5) Load the frame pointer so that it starts at offset 2
147: LDA 0,1(7) Save the return address in the accumulator
148: LDA 7,-142(7) Jump to output()
149: LD 5,0(5) Pop the frame and return to the current frame
150: ST 0,-2(5) Store return value
* --- Calling output() ---
151: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,140(7) Jump around function bodies
* --- Final ---
152: ST 5,-2(5) Original Pointer
153: LDA 5,-2(5) Push Main Frame Pointer
154: LDA 0,1(7) Load Accumulator with return pointer
155: LDA 7,-57(7) Jump to Location
156: LD 5,0(5) Pop Main Frame
157: HALT 0,0,0 Exit
* --- Final ---
