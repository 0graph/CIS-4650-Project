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
* Making Space for variable (c)
* Making Space for variable (x)
* Making Space for variable (y)
* --- Assignment Expression ---
13: LDA 0,-3(5) Load address for var (x)
14: ST 0,-6(5) &x
* Loading Constant 2 to register 0 and save to memory with offset 7
15: LDC 0,2(0) 
16: ST 0,-7(5) 
* Store back the result of the assignment operation
17: LD 0,-6(5) Load to memory the address and result value
18: LD 1,-7(5) 
19: ST 1,0(0) 
20: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
21: LDA 0,-4(5) Load address for var (y)
22: ST 0,-6(5) &y
* Loading Constant 10 to register 0 and save to memory with offset 7
23: LDC 0,10(0) 
24: ST 0,-7(5) 
* Store back the result of the assignment operation
25: LD 0,-6(5) Load to memory the address and result value
26: LD 1,-7(5) 
27: ST 1,0(0) 
28: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
29: LDA 0,-2(5) Load address for var (c)
30: ST 0,-6(5) &c
* --- Operation Expression ---
31: LD 0,-4(5) Value of y
32: ST 0,-8(5) 
33: LD 0,-3(5) Value of x
34: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
35: LD 0,-8(5) Load Left hand side
36: LD 1,-9(5) Load Right hand side
37: MUL 0,0,1 Operation
38: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
39: LD 0,-6(5) Load to memory the address and result value
40: LD 1,-7(5) 
41: ST 1,0(0) 
42: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 5
* Adding argument 1
43: LD 0,-2(5) Value of c
44: ST 0,-6(5) 
45: ST 0,-7(5) Storing argument
* Create new activation record
46: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
47: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
48: LDA 0,1(7) Save the return address in the accumulator
49: LDA 7,-43(7) Jump to output()
50: LD 5,0(5) Pop the frame and return to the current frame
51: ST 0,-5(5) Store return value
* --- Calling output() ---
52: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,41(7) Jump around function bodies
* --- Final ---
53: ST 5,0(5) Original Pointer
54: LDA 5,0(5) Push Main Frame Pointer
55: LDA 0,1(7) Load Accumulator with return pointer
56: LDA 7,-45(7) Jump to Location
57: LD 5,0(5) Pop Main Frame
58: HALT 0,0,0 Exit
* --- Final ---
