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
* --- Function Declaration (five) ---
12: ST 0,-1(5) Store return
* Making Space for variable (a)
* --- While Expression ---
* --- Operation Expression ---
13: LD 0,-2(5) Value of a
14: ST 0,-5(5) 
* Loading Constant 5 to register 0 and save to memory with offset 6
15: LDC 0,5(0) 
16: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
17: LD 0,-5(5) Load Left hand side
18: LD 1,-6(5) Load Right hand side
19: SUB 0,0,1 Subtract for Comparison
20: JLT 0,2(7) Jump to next instruction if true
21: LDC 0,0(0) Load 0 (false)
22: LDA 7,1(7) Unconditional Jump
23: LDC 0,1(0) Load 1 (true)
24: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
27: LDA 0,-2(5) Load address for var (a)
28: ST 0,-6(5) &a
* --- Operation Expression ---
29: LD 0,-2(5) Value of a
30: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
31: LDC 0,1(0) 
32: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
33: LD 0,-8(5) Load Left hand side
34: LD 1,-9(5) Load Right hand side
35: ADD 0,0,1 Operation
36: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
37: LD 0,-6(5) Load to memory the address and result value
38: LD 1,-7(5) 
39: ST 1,0(0) 
40: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
41: LDA 7,-27(7) Jump to test after body
* Load the test value to register 0
25: LD 0,-4(5) Load test value
26: JLE 0,15(7) Jump to end if test <= 0 (false)
* --- Return Expression ---
42: LD 0,-2(5) Value of a
43: ST 0,-4(5) 
44: LD 1,0(5) Load return address
45: ST 0,-2(1) Store return value
46: LD 7,-1(5) Return to caller
47: LD 7,-1(5) Return to caller
* --- Function Declaration (five) ---
* --- Function Declaration (main) ---
48: ST 0,-1(5) Store return
* Making Space for variable (a)
* --- Assignment Expression ---
49: LDA 0,-2(5) Load address for var (a)
50: ST 0,-4(5) &a
* Loading Constant 0 to register 0 and save to memory with offset 5
51: LDC 0,0(0) 
52: ST 0,-5(5) 
* Store back the result of the assignment operation
53: LD 0,-4(5) Load to memory the address and result value
54: LD 1,-5(5) 
55: ST 1,0(0) 
56: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
57: LDA 0,-2(5) Load address for var (a)
58: ST 0,-4(5) &a
* --- Calling five() ---
* Offset: 5
* Adding argument 1
59: LD 0,-2(5) Value of a
60: ST 0,-6(5) 
61: ST 0,-7(5) Storing argument
* Create new activation record
62: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
63: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
64: LDA 0,1(7) Save the return address in the accumulator
65: LDA 7,-54(7) Jump to five()
66: LD 5,0(5) Pop the frame and return to the current frame
67: ST 0,-5(5) Store return value
* --- Calling five() ---
* Store back the result of the assignment operation
68: LD 0,-4(5) Load to memory the address and result value
69: LD 1,-5(5) 
70: ST 1,0(0) 
71: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 3
* Adding argument 1
72: LD 0,-2(5) Value of a
73: ST 0,-4(5) 
74: ST 0,-5(5) Storing argument
* Create new activation record
75: ST 5,-8(5) Save address of current frame pointer to memory with offset 8
76: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
77: LDA 0,1(7) Save the return address in the accumulator
78: LDA 7,-72(7) Jump to output()
79: LD 5,-5(5) Pop the frame and return to the current frame
80: ST 0,-3(5) Store return value
* --- Calling output() ---
81: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,70(7) Jump around function bodies
* --- Final ---
82: ST 5,0(5) Original Pointer
83: LDA 5,0(5) Push Main Frame Pointer
84: LDA 0,1(7) Load Accumulator with return pointer
85: LDA 7,-38(7) Jump to Location
86: LD 5,0(5) Pop Main Frame
87: HALT 0,0,0 Exit
* --- Final ---
