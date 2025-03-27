* Standard Prelude
0: LD 6,0(0) Load the global pointer with max address
1: LDA 5,0(6) Load the frame pointer
2: ST 0,0(0) Clear Location 0
* End Standard Prelude
* Making Space for variable (x)
* Entering Function Declaration (input)
3: ST 0,-1(5) Store return
* Making Space for variable (z)
* Entering Function Declaration (gcd)
4: ST 0,-1(5) Store return
* Making Space for variable (c)
* Entering Function Declaration (main)
5: ST 0,-1(5) Store return
* --- Calling gcd() ---
* --- Calling input() ---
6: ST 5,-2(5) Save address of current frame pointer to memory with offset 2
7: LDA 5,-1(5) Load the frame pointer so that it starts at offset 1
8: LDA 0,-1(7) Save the return address in the accumulator
9: LDA 7,-9(7) Jump to input()
10: LD 5,-1(7) Pop the frame and return to the current frame
* --- Calling input() ---
11: ST 5,-1(5) Save address of current frame pointer to memory with offset 1
12: LDA 5,-1(5) Load the frame pointer so that it starts at offset 1
13: LDA 0,-1(7) Save the return address in the accumulator
14: LDA 7,-14(7) Jump to gcd()
15: LD 5,0(7) Pop the frame and return to the current frame
* --- Calling gcd() ---

