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
28: LD 1,0(5) Load return address
29: ST 0,-2(1) Store return value
30: LD 7,-1(5) Return to caller
25: JEQ 0,5(7) if false jump 5 instructions
* --- Return Expression ---
* --- Calling gcd() ---
* Offset: 6
* Adding argument 1
32: LD 0,-3(5) Value of v
33: ST 0,-7(5) 
34: ST 0,-8(5) Storing argument
* Adding argument 2
* --- Operation Expression ---
35: LD 0,-2(5) Value of u
36: ST 0,-8(5) 
* --- Operation Expression ---
* --- Operation Expression ---
37: LD 0,-2(5) Value of u
38: ST 0,-11(5) 
39: LD 0,-3(5) Value of v
40: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
41: LD 0,-11(5) Load Left hand side
42: LD 1,-12(5) Load Right hand side
43: DIV 0,0,1 Operation
44: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
45: LD 0,-3(5) Value of v
46: ST 0,-11(5) 
* Save the result of the operation expression to the address offset 9
47: LD 0,-10(5) Load Left hand side
48: LD 1,-11(5) Load Right hand side
49: MUL 0,0,1 Operation
50: ST 0,-9(5) Store value of expression
* --- Operation Expression ---
* Save the result of the operation expression to the address offset 7
51: LD 0,-8(5) Load Left hand side
52: LD 1,-9(5) Load Right hand side
53: SUB 0,0,1 Operation
54: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
55: ST 0,-9(5) Storing argument
* Create new activation record
56: ST 5,-6(5) Save address of current frame pointer to memory with offset 6
57: LDA 5,-6(5) Load the frame pointer so that it starts at offset 6
58: LDA 0,1(7) Save the return address in the accumulator
59: LDA 7,-48(7) Jump to gcd()
60: LD 5,0(5) Pop the frame and return to the current frame
* --- Calling gcd() ---
61: LD 1,0(5) Load return address
62: ST 0,-2(1) Store return value
63: LD 7,-1(5) Return to caller
31: LDA 7,32(7) jump around body
* --- If Expression ---
64: LD 7,-1(5) Return to caller
* --- Function Declaration (gcd) ---
* --- Function Declaration (main) ---
65: ST 0,-1(5) Store return
* Making Space for variable (x)
* --- Assignment Expression ---
66: LDA 0,-2(5) Load address for var (x)
67: ST 0,-4(5) &x
* --- Calling input() ---
* Offset: 5
* Create new activation record
68: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
69: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
70: LDA 0,1(7) Save the return address in the accumulator
71: LDA 7,-68(7) Jump to input()
72: LD 5,0(5) Pop the frame and return to the current frame
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
* Loading Constant 10 to register 0 and save to memory with offset 5
79: LDC 0,10(0) 
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
* Offset: 4
* Adding argument 1
85: LD 0,-2(5) Value of x
86: ST 0,-5(5) 
87: ST 0,-6(5) Storing argument
* Adding argument 2
88: LD 0,0(6) Value of y
89: ST 0,-5(6) 
90: ST 0,-7(5) Storing argument
* Create new activation record
91: ST 5,-12(5) Save address of current frame pointer to memory with offset 12
92: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
93: LDA 0,1(7) Save the return address in the accumulator
94: LDA 7,-83(7) Jump to gcd()
95: LD 5,-8(5) Pop the frame and return to the current frame
* --- Calling gcd() ---
96: ST 0,-5(5) Storing argument
* Create new activation record
97: ST 5,-8(5) Save address of current frame pointer to memory with offset 8
98: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
99: LDA 0,1(7) Save the return address in the accumulator
100: LDA 7,-94(7) Jump to output()
101: LD 5,-5(5) Pop the frame and return to the current frame
* --- Calling output() ---
102: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,91(7) Jump around function bodies
* --- Final ---
103: ST 5,-1(5) Original Pointer
104: LDA 5,-1(5) Push Main Frame Pointer
105: LDA 0,1(7) Load Accumulator with return pointer
106: LDA 7,-42(7) Jump to Location
107: LD 5,0(5) Pop Main Frame
108: HALT 0,0,0 Exit
* --- Final ---
