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
14: ST 0,-4(5) &a
* Loading Constant 0 to register 0 and save to memory with offset 5
15: LDC 0,0(0) 
16: ST 0,-5(5) 
* Store back the result of the assignment operation
17: LD 0,-4(5) Load to memory the address and result value
18: LD 1,-5(5) 
19: ST 1,0(0) 
20: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
21: LD 0,-2(5) Value of a
22: ST 0,-5(5) 
* Loading Constant 5 to register 0 and save to memory with offset 6
23: LDC 0,5(0) 
24: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
25: LD 0,-5(5) Load Left hand side
26: LD 1,-6(5) Load Right hand side
27: SUB 0,0,1 Subtract for Comparison
28: JLT 0,2(7) Jump to next instruction if true
29: LDC 0,0(0) Load 0 (false)
30: LDA 7,1(7) Unconditional Jump
31: LDC 0,1(0) Load 1 (true)
32: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
34: LDA 0,-2(5) Load address for var (a)
35: ST 0,-6(5) &a
* --- Operation Expression ---
36: LD 0,-2(5) Value of a
37: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
38: LDC 0,1(0) 
39: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
40: LD 0,-8(5) Load Left hand side
41: LD 1,-9(5) Load Right hand side
42: ADD 0,0,1 Operation
43: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
44: LD 0,-6(5) Load to memory the address and result value
45: LD 1,-7(5) 
46: ST 1,0(0) 
47: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
48: LDA 7,-21(7) Jump to test after body
* Load the test value to register 0
33: LD 0,-4(5) Load test value
34: JLE 0,-48(7) Jump to end if test <= 0 (false)
* --- Calling output() ---
* Offset: 3
* Adding argument 1
49: LD 0,-2(5) Value of a
50: ST 0,-4(5) 
51: ST 0,-5(5) Storing argument
* Create new activation record
52: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
53: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
54: LDA 0,1(7) Save the return address in the accumulator
55: LDA 7,-48(7) Jump to output()
56: LD 5,0(5) Pop the frame and return to the current frame
* --- Calling output() ---
57: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,46(7) Jump around function bodies
* --- Final ---
58: ST 5,0(5) Original Pointer
59: LDA 5,0(5) Push Main Frame Pointer
60: LDA 0,1(7) Load Accumulator with return pointer
61: LDA 7,-50(7) Jump to Location
62: LD 5,0(5) Pop Main Frame
63: HALT 0,0,0 Exit
* --- Final ---