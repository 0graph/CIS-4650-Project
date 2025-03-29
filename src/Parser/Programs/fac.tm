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
20: LD 0,-2(5) Load the return value to the accumulator
21: ST 0,-6(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
22: LD 0,-5(5) Load to memory the address and result value
23: LD 1,-6(5) 
24: ST 1,0(0) 
25: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
26: LDA 0,-2(5) Load address for var (fac)
27: ST 0,-5(5) &fac
* Loading Constant 1 to register 0 and save to memory with offset 6
28: LDC 0,1(0) 
29: ST 0,-6(5) 
* Store back the result of the assignment operation
30: LD 0,-5(5) Load to memory the address and result value
31: LD 1,-6(5) 
32: ST 1,0(0) 
33: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
34: LD 0,-3(5) Value of x
35: ST 0,-6(5) 
* Loading Constant 1 to register 0 and save to memory with offset 7
36: LDC 0,1(0) 
37: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
38: LD 0,-6(5) Load Left hand side
39: LD 1,-7(5) Load Right hand side
40: SUB 0,0,1 Subtract for Comparison
41: JGT 0,2(7) Jump to next instruction if true
42: LDC 0,0(0) Load 0 (false)
43: LDA 7,1(7) Unconditional Jump
44: LDC 0,1(0) Load 1 (true)
45: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
48: LDA 0,-2(5) Load address for var (fac)
49: ST 0,-7(5) &fac
* --- Operation Expression ---
50: LD 0,-2(5) Value of fac
51: ST 0,-9(5) 
52: LD 0,-3(5) Value of x
53: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
54: LD 0,-9(5) Load Left hand side
55: LD 1,-10(5) Load Right hand side
56: MUL 0,0,1 Operation
57: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
58: LD 0,-7(5) Load to memory the address and result value
59: LD 1,-8(5) 
60: ST 1,0(0) 
61: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
62: LDA 0,-3(5) Load address for var (x)
63: ST 0,-7(5) &x
* --- Operation Expression ---
64: LD 0,-3(5) Value of x
65: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
66: LDC 0,1(0) 
67: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
68: LD 0,-9(5) Load Left hand side
69: LD 1,-10(5) Load Right hand side
70: SUB 0,0,1 Operation
71: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
72: LD 0,-7(5) Load to memory the address and result value
73: LD 1,-8(5) 
74: ST 1,0(0) 
75: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
76: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
46: LD 0,-5(5) Load test value
47: JLE 0,29(7) Jump to end if test <= 0 (false)
* --- Calling output() ---
* Offset: 4
* Adding argument 1
77: LD 0,-2(5) Value of fac
78: ST 0,-5(5) 
79: ST 0,-6(5) Storing argument
* Create new activation record
80: ST 5,-10(5) Save address of current frame pointer to memory with offset 10
81: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
82: LDA 0,1(7) Save the return address in the accumulator
83: LDA 7,-77(7) Jump to output()
84: LD 5,-6(5) Pop the frame and return to the current frame
85: LD 0,-2(5) Load the return value to the accumulator
86: ST 0,-4(5) Store return value
* --- Calling output() ---
87: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,76(7) Jump around function bodies
* --- Final ---
88: ST 5,0(5) Original Pointer
89: LDA 5,0(5) Push Main Frame Pointer
90: LDA 0,1(7) Load Accumulator with return pointer
91: LDA 7,-80(7) Jump to Location
92: LD 5,0(5) Pop Main Frame
93: HALT 0,0,0 Exit
* --- Final ---
