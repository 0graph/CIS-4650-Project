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
* --- Function Declaration (add) ---
12: ST 0,-1(5) Store return
* Making Space for variable (x)
* Making Space for variable (y)
* Making Space for variable (c)
* --- Assignment Expression ---
13: LDA 0,-4(5) Load address for var (c)
14: ST 0,-6(5) &c
* --- Operation Expression ---
15: LD 0,-2(5) Value of x
16: ST 0,-8(5) 
17: LD 0,-3(5) Value of y
18: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
19: LD 0,-8(5) Load Left hand side
20: LD 1,-9(5) Load Right hand side
21: ADD 0,0,1 Operation
22: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
23: LD 0,-6(5) Load to memory the address and result value
24: LD 1,-7(5) 
25: ST 1,0(0) 
26: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
* --- Return Expression ---
27: LD 0,-4(5) Value of c
28: ST 0,-6(5) 
29: LD 1,0(0) Save value from return expression
30: LD 7,-1(5) Return to caller
* --- Return Expression ---
31: LD 7,-1(5) Return to caller
* --- Function Declaration (add) ---
* --- Function Declaration (main) ---
32: ST 0,-1(5) Store return
* Making Space for variable (k)
* --- Assignment Expression ---
33: LDA 0,-2(5) Load address for var (k)
34: ST 0,-4(5) &k
* --- Calling add() ---
* Offset: 5
* Adding argument 1
* Loading Constant 3 to register 0 and save to memory with offset 6
35: LDC 0,3(0) 
36: ST 0,-6(5) 
37: ST 0,-7(5) Storing argument
* Adding argument 2
* Loading Constant 9 to register 0 and save to memory with offset 6
38: LDC 0,9(0) 
39: ST 0,-6(5) 
40: ST 0,-8(5) Storing argument
* Create new activation record
41: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
42: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
43: LDA 0,1(7) Save the return address in the accumulator
44: LDA 7,-33(7) Jump to add()
45: LD 5,0(5) Pop the frame and return to the current frame
46: ST 0,-5(5) Store return value
* --- Calling add() ---
* Store back the result of the assignment operation
47: LD 0,-4(5) Load to memory the address and result value
48: LD 1,-5(5) 
49: ST 1,0(0) 
50: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 3
* Adding argument 1
51: LD 0,-2(5) Value of k
52: ST 0,-4(5) 
53: ST 0,-5(5) Storing argument
* Create new activation record
54: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
55: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
56: LDA 0,1(7) Save the return address in the accumulator
57: LDA 7,-51(7) Jump to output()
58: LD 5,0(5) Pop the frame and return to the current frame
59: ST 0,-3(5) Store return value
* --- Calling output() ---
60: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,49(7) Jump around function bodies
* --- Final ---
61: ST 5,0(5) Original Pointer
62: LDA 5,0(5) Push Main Frame Pointer
63: LDA 0,1(7) Load Accumulator with return pointer
64: LDA 7,-33(7) Jump to Location
65: LD 5,0(5) Pop Main Frame
66: HALT 0,0,0 Exit
* --- Final ---
