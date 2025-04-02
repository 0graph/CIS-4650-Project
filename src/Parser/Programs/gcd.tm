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
* Making Space for variable (y)
* --- Function Declaration (gcd) ---
12: ST 0,-1(5) Store return
* Making Space for variable (u)
* Making Space for variable (v)
* --- If Expression ---
* --- Operation Expression ---
13: LD 0,-3(5) Value of v
14: ST 0,-6(5) 
* Loading Constant 0 to register 0 and save to memory with offset 7
15: LDC 0,0(0) 
16: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
17: LD 0,-6(5) Load Left hand side
18: LD 1,-7(5) Load Right hand side
19: SUB 0,0,1 Subtract for Comparison
20: JEQ 0,2(7) Jump to next instruction if true
21: LDC 0,0(0) Load 0 (false)
22: LDA 7,1(7) Unconditional Jump
23: LDC 0,1(0) Load 1 (true)
24: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* --- Return Expression ---
26: LD 0,-2(5) Value of u
27: ST 0,-6(5) 
28: LD 1,0(0) Save value from return expression
29: LD 7,-1(5) Return to caller
* --- Return Expression ---
25: JEQ 0,5(7) if false jump 5 instructions
* --- Return Expression ---
* --- Calling gcd() ---
* Offset: 7
* Adding argument 1
31: LD 0,-3(5) Value of v
32: ST 0,-10(5) 
33: ST 0,-9(5) Storing argument
* Adding argument 2
* --- Operation Expression ---
34: LD 0,-2(5) Value of u
35: ST 0,-12(5) 
* --- Operation Expression ---
* --- Operation Expression ---
36: LD 0,-2(5) Value of u
37: ST 0,-15(5) 
38: LD 0,-3(5) Value of v
39: ST 0,-16(5) 
* Save the result of the operation expression to the address offset 14
40: LD 0,-15(5) Load Left hand side
41: LD 1,-16(5) Load Right hand side
42: DIV 0,0,1 Operation
43: ST 0,-14(5) Store value of expression
* --- Operation Expression ---
44: LD 0,-3(5) Value of v
45: ST 0,-15(5) 
* Save the result of the operation expression to the address offset 13
46: LD 0,-14(5) Load Left hand side
47: LD 1,-15(5) Load Right hand side
48: MUL 0,0,1 Operation
49: ST 0,-13(5) Store value of expression
* --- Operation Expression ---
* Save the result of the operation expression to the address offset 11
50: LD 0,-12(5) Load Left hand side
51: LD 1,-13(5) Load Right hand side
52: SUB 0,0,1 Operation
53: ST 0,-11(5) Store value of expression
* --- Operation Expression ---
54: ST 0,-10(5) Storing argument
* Create new activation record
55: ST 5,-7(5) Save address of current frame pointer to memory with offset 7
56: LDA 5,-7(5) Load the frame pointer so that it starts at offset 7
57: LDA 0,1(7) Save the return address in the accumulator
58: LDA 7,-47(7) Jump to gcd()
59: LD 5,0(5) Pop the frame and return to the current frame
60: ST 0,-7(5) Store return value
* --- Calling gcd() ---
61: LD 1,0(0) Save value from return expression
62: LD 7,-1(5) Return to caller
* --- Return Expression ---
30: LDA 7,32(7) jump around body
* --- If Expression ---
63: LD 7,-1(5) Return to caller
* --- Function Declaration (gcd) ---
* --- Function Declaration (main) ---
64: ST 0,-1(5) Store return
* Making Space for variable (x)
* --- Assignment Expression ---
65: LDA 0,-2(5) Load address for var (x)
66: ST 0,-4(5) &x
* --- Calling input() ---
* Offset: 5
* Create new activation record
67: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
68: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
69: LDA 0,1(7) Save the return address in the accumulator
70: LDA 7,-67(7) Jump to input()
71: LD 5,0(5) Pop the frame and return to the current frame
72: ST 0,-5(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
73: LD 0,-4(5) Load to memory the address and result value
74: LD 1,-5(5) 
75: ST 1,0(0) 
76: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
77: LDA 0,0(6) Load address for var (y)
78: ST 0,-4(5) &y
* Loading Constant 33 to register 0 and save to memory with offset 5
79: LDC 0,33(0) 
80: ST 0,-5(5) 
* Store back the result of the assignment operation
81: LD 0,-4(5) Load to memory the address and result value
82: LD 1,-5(5) 
83: ST 1,0(0) 
84: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 3
* Adding argument 1
* --- Calling gcd() ---
* Offset: 6
* Adding argument 1
85: LD 0,-2(5) Value of x
86: ST 0,-9(5) 
87: ST 0,-8(5) Storing argument
* Adding argument 2
88: LD 0,0(6) Value of y
89: ST 0,-10(5) 
90: ST 0,-9(5) Storing argument
* Create new activation record
91: ST 5,-6(5) Save address of current frame pointer to memory with offset 6
92: LDA 5,-6(5) Load the frame pointer so that it starts at offset 6
93: LDA 0,1(7) Save the return address in the accumulator
94: LDA 7,-83(7) Jump to gcd()
95: LD 5,0(5) Pop the frame and return to the current frame
96: ST 0,-6(5) Store return value
* --- Calling gcd() ---
97: ST 0,-5(5) Storing argument
* Create new activation record
98: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
99: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
100: LDA 0,1(7) Save the return address in the accumulator
101: LDA 7,-95(7) Jump to output()
102: LD 5,0(5) Pop the frame and return to the current frame
103: ST 0,-3(5) Store return value
* --- Calling output() ---
104: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,93(7) Jump around function bodies
* --- Final ---
105: ST 5,-1(5) Original Pointer
106: LDA 5,-1(5) Push Main Frame Pointer
107: LDA 0,1(7) Load Accumulator with return pointer
108: LDA 7,-45(7) Jump to Location
109: LD 5,0(5) Pop Main Frame
110: HALT 0,0,0 Exit
* --- Final ---
