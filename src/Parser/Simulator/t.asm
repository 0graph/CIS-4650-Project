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
* Making space for array variable (arr[5])
* --- Function Declaration (main) ---
12: ST 0,-1(5) Store return
* Making Space for variable (x)
* --- Assignment Expression ---
13: LDA 0,-2(5) Load address for var (x)
14: ST 0,-4(5) &x
* Loading Constant 6 to register 0 and save to memory with offset 6
15: LDC 0,6(0) 
16: ST 0,-6(5) 
* Check that index is valid
17: LDC 1,-5(1) Load Size
18: SUB 2,0,1 Check size
19: JGE 2,1000(7) Check size
* Load index calculated at offset 6 and base address of array arr[] and save it to offset 5
20: LDA 0,0(6) Address of arr, PO: 2, SA: 0, P*: 6
21: LD 1,-6(5) Load index value to register
22: SUB 0,0,1 Substract the offset to the address
23: LD 0,0(0) Load the value at the arr[index] address to the AC
24: ST 0,-5(5) Value of arr[index]
* Store back the result of the assignment operation
25: LD 0,-4(5) Load to memory the address and result value
26: LD 1,-5(5) 
27: ST 1,0(0) 
28: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
29: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,18(7) Jump around function bodies
* --- Final ---
30: ST 5,-5(5) Original Pointer
31: LDA 5,-5(5) Push Main Frame Pointer
32: LDA 0,1(7) Load Accumulator with return pointer
33: LDA 7,-22(7) Jump to Location
34: LD 5,0(5) Pop Main Frame
35: HALT 0,0,0 Exit
* --- Final ---
