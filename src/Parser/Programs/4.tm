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
* Making Space for variable (x)
* --- Function Declaration (mut) ---
12: ST 0,-1(5) Store return
* Making Space for variable (y)
* Making Space for variable (z)
* --- Assignment Expression ---
13: LDA 0,-3(5) Load address for var (z)
14: ST 0,-5(5) &z
* --- Operation Expression ---
15: LD 0,-2(5) Value of y
16: ST 0,-7(5) 
17: LD 0,0(6) Value of x
18: ST 0,-8(6) 
* Save the result of the operation expression to the address offset 6
19: LD 0,-7(5) Load Left hand side
20: LD 1,-8(5) Load Right hand side
21: MUL 0,0,1 Operation
22: ST 0,-6(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
23: LD 0,-5(5) Load to memory the address and result value
24: LD 1,-6(5) 
25: ST 1,0(0) 
26: ST 1,-4(5) Value Stored!
* --- Assignment Expression ---
* --- Return Expression ---
27: LD 0,-3(5) Value of z
28: ST 0,-5(5) 
29: LD 1,0(0) Save value from return expression
30: LD 7,-1(5) Return to caller
* --- Return Expression ---
31: LD 7,-1(5) Return to caller
* --- Function Declaration (mut) ---
* --- Function Declaration (main) ---
32: ST 0,-1(5) Store return
* Making Space for variable (y)
* --- Assignment Expression ---
33: LDA 0,0(6) Load address for var (x)
34: ST 0,-4(5) &x
* Loading Constant 5 to register 0 and save to memory with offset 5
35: LDC 0,5(0) 
36: ST 0,-5(5) 
* Store back the result of the assignment operation
37: LD 0,-4(5) Load to memory the address and result value
38: LD 1,-5(5) 
39: ST 1,0(0) 
40: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
41: LDA 0,-2(5) Load address for var (y)
42: ST 0,-4(5) &y
* --- Calling mut() ---
* Offset: 5
* Adding argument 1
* Loading Constant 5 to register 0 and save to memory with offset 6
43: LDC 0,5(0) 
44: ST 0,-6(5) 
45: ST 0,-7(5) Storing argument
* Create new activation record
46: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
47: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
48: LDA 0,1(7) Save the return address in the accumulator
49: LDA 7,-38(7) Jump to mut()
50: LD 5,0(5) Pop the frame and return to the current frame
51: ST 0,-5(5) Store return value
* --- Calling mut() ---
* Store back the result of the assignment operation
52: LD 0,-4(5) Load to memory the address and result value
53: LD 1,-5(5) 
54: ST 1,0(0) 
55: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 3
* Adding argument 1
56: LD 0,-2(5) Value of y
57: ST 0,-4(5) 
58: ST 0,-5(5) Storing argument
* Create new activation record
59: ST 5,-3(5) Save address of current frame pointer to memory with offset 8
60: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
61: LDA 0,1(7) Save the return address in the accumulator
62: LDA 7,-56(7) Jump to output()
63: LD 5,0(5) Pop the frame and return to the current frame
64: ST 0,-3(5) Store return value
* --- Calling output() ---
* --- Calling output() ---
* Offset: 3
* Adding argument 1
65: LD 0,0(6) Value of x
66: ST 0,-4(6) 
67: ST 0,-5(5) Storing argument
* Create new activation record
68: ST 5,-3(5) Save address of current frame pointer to memory with offset 11
69: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
70: LDA 0,1(7) Save the return address in the accumulator
71: LDA 7,-65(7) Jump to output()
72: LD 5,0(5) Pop the frame and return to the current frame
73: ST 0,-3(5) Store return value
* --- Calling output() ---
74: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,63(7) Jump around function bodies
* --- Final ---
75: ST 5,-1(5) Original Pointer
76: LDA 5,-1(5) Push Main Frame Pointer
77: LDA 0,1(7) Load Accumulator with return pointer
78: LDA 7,-47(7) Jump to Location
79: LD 5,0(5) Pop Main Frame
80: HALT 0,0,0 Exit
* --- Final ---
