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
* Making Space for variable (a)
* --- Assignment Expression ---
13: LDA 0,-2(5) Load address for var (a)
14: ST 0,-1(5) &a
* Loading Constant 1 to register 0 and save to memory with offset 2
15: LDC 0,1(0) 
16: ST 0,-2(5) 
* Store back the result of the assignment operation
17: LD 0,-1(5) Load to memory the address and result value
18: LD 1,-2(5) 
19: ST 1,0(0) 
20: ST 1,0(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
21: LDA 0,-2(5) Load address for var (a)
22: ST 0,-1(5) &a
* --- Operation Expression ---
* Loading Constant 1 to register 0 and save to memory with offset 3
23: LDC 0,1(0) 
24: ST 0,-3(5) 
* Loading Constant 2 to register 0 and save to memory with offset 4
25: LDC 0,2(0) 
26: ST 0,-4(5) 
* Save the result of the operation expression to the address offset 2
27: LD 0,-3(5) Load Left hand side
28: LD 1,-4(5) Load Right hand side
29: SUB 0,0,1 Subtract for Comparison
30: JGT 0,2(7) Jump to next instruction if true
31: LDC 0,0(0) Load 0 (false)
32: LDA 7,1(7) Unconditional Jump
33: LDC 0,1(0) Load 1 (true)
34: ST 0,-2(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
35: LD 0,-1(5) Load to memory the address and result value
36: LD 1,-2(5) 
37: ST 1,0(0) 
38: ST 1,0(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
39: LDA 0,-2(5) Load address for var (a)
40: ST 0,-1(5) &a
* --- Operation Expression ---
* Loading Constant 1 to register 0 and save to memory with offset 3
41: LDC 0,1(0) 
42: ST 0,-3(5) 
* Loading Constant 0 to register 0 and save to memory with offset 4
43: LDC 0,0(0) 
44: ST 0,-4(5) 
* Save the result of the operation expression to the address offset 2
45: LD 0,-3(5) Load Left hand side
46: LD 1,-4(5) Load Right hand side
47: JLE 0,4(7) Jump to END if LHS <= 0
48: JLE 1,2(7) Jump to ZERO if RHS <= 0
49: LDC 0,1(0) LHS = 1
50: LDA 7,1(7) Jump to END
51: LDC 0,0(0) LHS = 0
52: ST 0,-2(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
53: LD 0,-1(5) Load to memory the address and result value
54: LD 1,-2(5) 
55: ST 1,0(0) 
56: ST 1,0(5) Value Stored!
* --- Assignment Expression ---
57: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,46(7) Jump around function bodies
* --- Final ---
58: ST 5,0(5) Original Pointer
59: LDA 5,0(5) Push Main Frame Pointer
60: LDA 0,-1(7) Load Accumulator with return pointer
61: LDA 7,-50(7) Jump to Location
62: LD 5,0(5) Pop Main Frame
63: HALT 0,0,0 Exit
* --- Final ---