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
* Making Space for variable (fac)
* Making Space for variable (x)
* --- Assignment Expression ---
13: LDA 0,-3(5) Load address for var (x)
14: ST 0,-5(5) &x
* --- Calling input() ---
* Offset: 6
* Create new activation record
15: ST 5,-6(5) Save address of current frame pointer to memory with offset 6
16: LDA 5,-6(5) Load the frame pointer so that it starts at offset 6
17: LDA 0,1(7) Save the return address in the accumulator
18: LDA 7,-15(7) Jump to input()
19: LD 5,0(5) Pop the frame and return to the current frame
20: ST 0,-6(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
21: LD 0,-5(5) Load to memory the address and result value
22: LD 1,-6(5) 
23: ST 1,0(0) 
24: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
25: LDA 0,-2(5) Load address for var (fac)
26: ST 0,-5(5) &fac
* Loading Constant 1 to register 0 and save to memory with offset 6
27: LDC 0,1(0) 
28: ST 0,-6(5) 
* Store back the result of the assignment operation
29: LD 0,-5(5) Load to memory the address and result value
30: LD 1,-6(5) 
31: ST 1,0(0) 
32: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 4
* Adding argument 1
33: LD 0,-3(5) Value of x
34: ST 0,-5(5) 
35: ST 0,-6(5) Storing argument
* Create new activation record
36: ST 5,-10(5) Save address of current frame pointer to memory with offset 10
37: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
38: LDA 0,1(7) Save the return address in the accumulator
39: LDA 7,-33(7) Jump to output()
40: LD 5,-6(5) Pop the frame and return to the current frame
41: ST 0,-4(5) Store return value
* --- Calling output() ---
* --- While Expression ---
* --- Operation Expression ---
42: LD 0,-3(5) Value of x
43: ST 0,-6(5) 
* Loading Constant 1 to register 0 and save to memory with offset 7
44: LDC 0,1(0) 
45: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
46: LD 0,-6(5) Load Left hand side
47: LD 1,-7(5) Load Right hand side
48: SUB 0,0,1 Subtract for Comparison
49: JGT 0,2(7) Jump to next instruction if true
50: LDC 0,0(0) Load 0 (false)
51: LDA 7,1(7) Unconditional Jump
52: LDC 0,1(0) Load 1 (true)
53: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
56: LDA 0,-2(5) Load address for var (fac)
57: ST 0,-7(5) &fac
* --- Operation Expression ---
58: LD 0,-2(5) Value of fac
59: ST 0,-9(5) 
60: LD 0,-3(5) Value of x
61: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
62: LD 0,-9(5) Load Left hand side
63: LD 1,-10(5) Load Right hand side
64: MUL 0,0,1 Operation
65: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
66: LD 0,-7(5) Load to memory the address and result value
67: LD 1,-8(5) 
68: ST 1,0(0) 
69: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
70: LDA 0,-3(5) Load address for var (x)
71: ST 0,-7(5) &x
* --- Operation Expression ---
72: LD 0,-3(5) Value of x
73: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
74: LDC 0,1(0) 
75: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
76: LD 0,-9(5) Load Left hand side
77: LD 1,-10(5) Load Right hand side
78: SUB 0,0,1 Operation
79: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
80: LD 0,-7(5) Load to memory the address and result value
81: LD 1,-8(5) 
82: ST 1,0(0) 
83: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
84: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
54: LD 0,-5(5) Load test value
55: JLE 0,29(7) Jump to end if test <= 0 (false)
* --- Calling output() ---
* Offset: 4
* Adding argument 1
85: LD 0,-2(5) Value of fac
86: ST 0,-5(5) 
87: ST 0,-6(5) Storing argument
* Create new activation record
88: ST 5,-14(5) Save address of current frame pointer to memory with offset 14
89: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
90: LDA 0,1(7) Save the return address in the accumulator
91: LDA 7,-85(7) Jump to output()
92: LD 5,-10(5) Pop the frame and return to the current frame
93: ST 0,-4(5) Store return value
* --- Calling output() ---
94: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,83(7) Jump around function bodies
* --- Final ---
95: ST 5,0(5) Original Pointer
96: LDA 5,0(5) Push Main Frame Pointer
97: LDA 0,1(7) Load Accumulator with return pointer
98: LDA 7,-87(7) Jump to Location
99: LD 5,0(5) Pop Main Frame
100: HALT 0,0,0 Exit
* --- Final ---
