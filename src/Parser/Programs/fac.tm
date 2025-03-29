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
* --- While Expression ---
* --- Operation Expression ---
33: LD 0,-3(5) Value of x
34: ST 0,-6(5) 
* Loading Constant 1 to register 0 and save to memory with offset 7
35: LDC 0,1(0) 
36: ST 0,-7(5) 
* Save the result of the operation expression to the address offset 5
37: LD 0,-6(5) Load Left hand side
38: LD 1,-7(5) Load Right hand side
39: SUB 0,0,1 Subtract for Comparison
40: JGT 0,2(7) Jump to next instruction if true
41: LDC 0,0(0) Load 0 (false)
42: LDA 7,1(7) Unconditional Jump
43: LDC 0,1(0) Load 1 (true)
44: ST 0,-5(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
47: LDA 0,-2(5) Load address for var (fac)
48: ST 0,-7(5) &fac
* --- Operation Expression ---
49: LD 0,-2(5) Value of fac
50: ST 0,-9(5) 
51: LD 0,-3(5) Value of x
52: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
53: LD 0,-9(5) Load Left hand side
54: LD 1,-10(5) Load Right hand side
55: MUL 0,0,1 Operation
56: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
57: LD 0,-7(5) Load to memory the address and result value
58: LD 1,-8(5) 
59: ST 1,0(0) 
60: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
61: LDA 0,-3(5) Load address for var (x)
62: ST 0,-7(5) &x
* --- Operation Expression ---
63: LD 0,-3(5) Value of x
64: ST 0,-9(5) 
* Loading Constant 1 to register 0 and save to memory with offset 10
65: LDC 0,1(0) 
66: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
67: LD 0,-9(5) Load Left hand side
68: LD 1,-10(5) Load Right hand side
69: SUB 0,0,1 Operation
70: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
71: LD 0,-7(5) Load to memory the address and result value
72: LD 1,-8(5) 
73: ST 1,0(0) 
74: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
75: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
45: LD 0,-5(5) Load test value
46: JLE 0,29(7) Jump to end if test <= 0 (false)
* --- Calling output() ---
* Offset: 4
* Adding argument 1
76: LD 0,-2(5) Value of fac
77: ST 0,-5(5) 
78: ST 0,-6(5) Storing argument
* Create new activation record
79: ST 5,-4(5) Save address of current frame pointer to memory with offset 10
80: LDA 5,-4(5) Load the frame pointer so that it starts at offset 4
81: LDA 0,1(7) Save the return address in the accumulator
82: LDA 7,-76(7) Jump to output()
83: LD 5,0(5) Pop the frame and return to the current frame
84: ST 0,-4(5) Store return value
* --- Calling output() ---
85: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,74(7) Jump around function bodies
* --- Final ---
86: ST 5,0(5) Original Pointer
87: LDA 5,0(5) Push Main Frame Pointer
88: LDA 0,1(7) Load Accumulator with return pointer
89: LDA 7,-78(7) Jump to Location
90: LD 5,0(5) Pop Main Frame
91: HALT 0,0,0 Exit
* --- Final ---
