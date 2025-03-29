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
* Making space for array variable (x[10])
* --- Function Declaration (minloc) ---
12: ST 0,-1(5) Store return
* Making space for array variable (a[0])
* Making Space for variable (low)
* Making Space for variable (high)
* Making Space for variable (k)
* Making Space for variable (x)
* Making Space for variable (i)
* --- Assignment Expression ---
13: LDA 0,-4(5) Load address for var (k)
14: ST 0,-8(5) &k
15: LD 0,-2(5) Value of low
16: ST 0,-9(5) 
* Store back the result of the assignment operation
17: LD 0,-8(5) Load to memory the address and result value
18: LD 1,-9(5) 
19: ST 1,0(0) 
20: ST 1,-7(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
21: LDA 0,-5(5) Load address for var (x)
22: ST 0,-8(5) &x
23: LD 0,-2(5) Value of low
24: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array a[] and save it to offset 9
25: LDA 0,-2(5) Load address to register
26: LD 1,-10(5) Load index value to register
27: SUB 0,0,1 Substract the offset to the address
28: LD 0,0(0) Load the value at the a[index] address to the AC
29: ST 0,-9(5) Value of a[index]
* Store back the result of the assignment operation
30: LD 0,-8(5) Load to memory the address and result value
31: LD 1,-9(5) 
32: ST 1,0(0) 
33: ST 1,-7(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
34: LDA 0,-6(5) Load address for var (i)
35: ST 0,-8(5) &i
* --- Operation Expression ---
36: LD 0,-2(5) Value of low
37: ST 0,-10(5) 
* Loading Constant 1 to register 0 and save to memory with offset 11
38: LDC 0,1(0) 
39: ST 0,-11(5) 
* Save the result of the operation expression to the address offset 9
40: LD 0,-10(5) Load Left hand side
41: LD 1,-11(5) Load Right hand side
42: ADD 0,0,1 Operation
43: ST 0,-9(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
44: LD 0,-8(5) Load to memory the address and result value
45: LD 1,-9(5) 
46: ST 1,0(0) 
47: ST 1,-7(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
48: LD 0,-6(5) Value of i
49: ST 0,-9(5) 
50: LD 0,-3(5) Value of high
51: ST 0,-10(5) 
* Save the result of the operation expression to the address offset 8
52: LD 0,-9(5) Load Left hand side
53: LD 1,-10(5) Load Right hand side
54: SUB 0,0,1 Subtract for Comparison
55: JLT 0,2(7) Jump to next instruction if true
56: LDC 0,0(0) Load 0 (false)
57: LDA 7,1(7) Unconditional Jump
58: LDC 0,1(0) Load 1 (true)
59: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* --- If Expression ---
* --- Operation Expression ---
62: LD 0,-6(5) Value of i
63: ST 0,-12(5) 
* Load index calculated at offset 12 and base address of array a[] and save it to offset 11
64: LDA 0,-2(5) Load address to register
65: LD 1,-12(5) Load index value to register
66: SUB 0,0,1 Substract the offset to the address
67: LD 0,0(0) Load the value at the a[index] address to the AC
68: ST 0,-11(5) Value of a[index]
69: LD 0,-5(5) Value of x
70: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
71: LD 0,-11(5) Load Left hand side
72: LD 1,-12(5) Load Right hand side
73: SUB 0,0,1 Subtract for Comparison
74: JLT 0,2(7) Jump to next instruction if true
75: LDC 0,0(0) Load 0 (false)
76: LDA 7,1(7) Unconditional Jump
77: LDC 0,1(0) Load 1 (true)
78: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
80: LDA 0,-5(5) Load address for var (x)
81: ST 0,-11(5) &x
82: LD 0,-6(5) Value of i
83: ST 0,-13(5) 
* Load index calculated at offset 13 and base address of array a[] and save it to offset 12
84: LDA 0,-2(5) Load address to register
85: LD 1,-13(5) Load index value to register
86: SUB 0,0,1 Substract the offset to the address
87: LD 0,0(0) Load the value at the a[index] address to the AC
88: ST 0,-12(5) Value of a[index]
* Store back the result of the assignment operation
89: LD 0,-11(5) Load to memory the address and result value
90: LD 1,-12(5) 
91: ST 1,0(0) 
92: ST 1,-10(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
93: LDA 0,-4(5) Load address for var (k)
94: ST 0,-11(5) &k
95: LD 0,-6(5) Value of i
96: ST 0,-12(5) 
* Store back the result of the assignment operation
97: LD 0,-11(5) Load to memory the address and result value
98: LD 1,-12(5) 
99: ST 1,0(0) 
100: ST 1,-10(5) Value Stored!
* --- Assignment Expression ---
79: JEQ 0,21(7) if false jump 21 instructions
101: LDA 7,0(7) jump around body
* --- If Expression ---
* --- Assignment Expression ---
102: LDA 0,-6(5) Load address for var (i)
103: ST 0,-10(5) &i
* --- Operation Expression ---
104: LD 0,-6(5) Value of i
105: ST 0,-12(5) 
* Loading Constant 1 to register 0 and save to memory with offset 13
106: LDC 0,1(0) 
107: ST 0,-13(5) 
* Save the result of the operation expression to the address offset 11
108: LD 0,-12(5) Load Left hand side
109: LD 1,-13(5) Load Right hand side
110: ADD 0,0,1 Operation
111: ST 0,-11(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
112: LD 0,-10(5) Load to memory the address and result value
113: LD 1,-11(5) 
114: ST 1,0(0) 
115: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
116: LDA 7,-67(7) Jump to test after body
* Load the test value to register 0
60: LD 0,-8(5) Load test value
61: JLE 0,55(7) Jump to end if test <= 0 (false)
* --- Return Expression ---
117: LD 0,-4(5) Value of k
118: ST 0,-8(5) 
119: LD 1,0(0) Save value from return expression
120: LD 7,-1(5) Return to caller
* --- Return Expression ---
121: LD 7,-1(5) Return to caller
* --- Function Declaration (minloc) ---
* --- Function Declaration (sort) ---
122: ST 0,-1(5) Store return
* Making space for array variable (a[0])
* Making Space for variable (low)
* Making Space for variable (high)
* Making Space for variable (k)
* Making Space for variable (i)
* --- Assignment Expression ---
123: LDA 0,-5(5) Load address for var (i)
124: ST 0,-7(5) &i
125: LD 0,-2(5) Value of low
126: ST 0,-8(5) 
* Store back the result of the assignment operation
127: LD 0,-7(5) Load to memory the address and result value
128: LD 1,-8(5) 
129: ST 1,0(0) 
130: ST 1,-6(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
131: LD 0,-5(5) Value of i
132: ST 0,-8(5) 
* --- Operation Expression ---
133: LD 0,-3(5) Value of high
134: ST 0,-10(5) 
* Loading Constant 1 to register 0 and save to memory with offset 11
135: LDC 0,1(0) 
136: ST 0,-11(5) 
* Save the result of the operation expression to the address offset 9
137: LD 0,-10(5) Load Left hand side
138: LD 1,-11(5) Load Right hand side
139: SUB 0,0,1 Operation
140: ST 0,-9(5) Store value of expression
* --- Operation Expression ---
* Save the result of the operation expression to the address offset 7
141: LD 0,-8(5) Load Left hand side
142: LD 1,-9(5) Load Right hand side
143: SUB 0,0,1 Subtract for Comparison
144: JLT 0,2(7) Jump to next instruction if true
145: LDC 0,0(0) Load 0 (false)
146: LDA 7,1(7) Unconditional Jump
147: LDC 0,1(0) Load 1 (true)
148: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Making Space for variable (t)
* --- Assignment Expression ---
151: LDA 0,-4(5) Load address for var (k)
152: ST 0,-9(5) &k
* --- Calling minloc() ---
* Offset: 10
* Adding argument 1
153: LD 0,-2(5) Value of a
154: ST 0,-11(5) 
155: ST 0,-12(5) Storing argument
* Adding argument 2
156: LD 0,-5(5) Value of i
157: ST 0,-11(5) 
158: ST 0,-13(5) Storing argument
* Adding argument 3
159: LD 0,-3(5) Value of high
160: ST 0,-11(5) 
161: ST 0,-14(5) Storing argument
* Create new activation record
162: ST 5,-10(5) Save address of current frame pointer to memory with offset 10
163: LDA 5,-10(5) Load the frame pointer so that it starts at offset 10
164: LDA 0,1(7) Save the return address in the accumulator
165: LDA 7,-154(7) Jump to minloc()
166: LD 5,0(5) Pop the frame and return to the current frame
167: ST 0,-10(5) Store return value
* --- Calling minloc() ---
* Store back the result of the assignment operation
168: LD 0,-9(5) Load to memory the address and result value
169: LD 1,-10(5) 
170: ST 1,0(0) 
171: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
172: LDA 0,-6(5) Load address for var (t)
173: ST 0,-9(5) &t
174: LD 0,-4(5) Value of k
175: ST 0,-11(5) 
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
176: LDA 0,-2(5) Load address to register
177: LD 1,-11(5) Load index value to register
178: SUB 0,0,1 Substract the offset to the address
179: LD 0,0(0) Load the value at the a[index] address to the AC
180: ST 0,-10(5) Value of a[index]
* Store back the result of the assignment operation
181: LD 0,-9(5) Load to memory the address and result value
182: LD 1,-10(5) 
183: ST 1,0(0) 
184: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
185: LD 0,-4(5) Value of k
186: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array a[] and save it to offset 9
187: LDA 0,-2(5) Load address to register
188: LD 1,-10(5) Load index value to register
189: SUB 0,0,1 Substract the offset to the address
190: ST 0,-9(5) Store the address given the index at offset 9
191: LD 0,-5(5) Value of i
192: ST 0,-11(5) 
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
193: LDA 0,-2(5) Load address to register
194: LD 1,-11(5) Load index value to register
195: SUB 0,0,1 Substract the offset to the address
196: LD 0,0(0) Load the value at the a[index] address to the AC
197: ST 0,-10(5) Value of a[index]
* Store back the result of the assignment operation
198: LD 0,-9(5) Load to memory the address and result value
199: LD 1,-10(5) 
200: ST 1,0(0) 
201: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
202: LD 0,-5(5) Value of i
203: ST 0,-10(5) 
* Load index calculated at offset 10 and base address of array a[] and save it to offset 9
204: LDA 0,-2(5) Load address to register
205: LD 1,-10(5) Load index value to register
206: SUB 0,0,1 Substract the offset to the address
207: ST 0,-9(5) Store the address given the index at offset 9
208: LD 0,-6(5) Value of t
209: ST 0,-10(5) 
* Store back the result of the assignment operation
210: LD 0,-9(5) Load to memory the address and result value
211: LD 1,-10(5) 
212: ST 1,0(0) 
213: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
214: LDA 0,-5(5) Load address for var (i)
215: ST 0,-9(5) &i
* --- Operation Expression ---
216: LD 0,-5(5) Value of i
217: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
218: LDC 0,1(0) 
219: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
220: LD 0,-11(5) Load Left hand side
221: LD 1,-12(5) Load Right hand side
222: ADD 0,0,1 Operation
223: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
224: LD 0,-9(5) Load to memory the address and result value
225: LD 1,-10(5) 
226: ST 1,0(0) 
227: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
228: LDA 7,-96(7) Jump to test after body
* Load the test value to register 0
149: LD 0,-7(5) Load test value
150: JLE 0,78(7) Jump to end if test <= 0 (false)
229: LD 7,-1(5) Return to caller
* --- Function Declaration (sort) ---
* --- Function Declaration (main) ---
230: ST 0,-1(5) Store return
* Making Space for variable (i)
* --- Assignment Expression ---
231: LDA 0,-2(5) Load address for var (i)
232: ST 0,-4(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 5
233: LDC 0,0(0) 
234: ST 0,-5(5) 
* Store back the result of the assignment operation
235: LD 0,-4(5) Load to memory the address and result value
236: LD 1,-5(5) 
237: ST 1,0(0) 
238: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
239: LD 0,-2(5) Value of i
240: ST 0,-5(5) 
* Loading Constant 10 to register 0 and save to memory with offset 6
241: LDC 0,10(0) 
242: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
243: LD 0,-5(5) Load Left hand side
244: LD 1,-6(5) Load Right hand side
245: SUB 0,0,1 Subtract for Comparison
246: JLT 0,2(7) Jump to next instruction if true
247: LDC 0,0(0) Load 0 (false)
248: LDA 7,1(7) Unconditional Jump
249: LDC 0,1(0) Load 1 (true)
250: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
253: LD 0,-2(5) Value of i
254: ST 0,-7(5) 
* Load index calculated at offset 7 and base address of array x[] and save it to offset 6
255: LDA 0,0(6) Load address to register
256: LD 1,-7(5) Load index value to register
257: SUB 0,0,1 Substract the offset to the address
258: ST 0,-6(5) Store the address given the index at offset 6
* --- Calling input() ---
* Offset: 7
* Create new activation record
259: ST 5,-7(5) Save address of current frame pointer to memory with offset 7
260: LDA 5,-7(5) Load the frame pointer so that it starts at offset 7
261: LDA 0,1(7) Save the return address in the accumulator
262: LDA 7,-259(7) Jump to input()
263: LD 5,0(5) Pop the frame and return to the current frame
264: ST 0,-7(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
265: LD 0,-6(5) Load to memory the address and result value
266: LD 1,-7(5) 
267: ST 1,0(0) 
268: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
269: LDA 0,-2(5) Load address for var (i)
270: ST 0,-6(5) &i
* --- Operation Expression ---
271: LD 0,-2(5) Value of i
272: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
273: LDC 0,1(0) 
274: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
275: LD 0,-8(5) Load Left hand side
276: LD 1,-9(5) Load Right hand side
277: ADD 0,0,1 Operation
278: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
279: LD 0,-6(5) Load to memory the address and result value
280: LD 1,-7(5) 
281: ST 1,0(0) 
282: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
283: LDA 7,-43(7) Jump to test after body
* Load the test value to register 0
251: LD 0,-4(5) Load test value
252: JLE 0,31(7) Jump to end if test <= 0 (false)
* --- Calling sort() ---
* Offset: 3
* Adding argument 1
284: LD 0,0(6) Value of x
285: ST 0,-4(6) 
286: ST 0,-5(5) Storing argument
* Adding argument 2
* Loading Constant 0 to register 0 and save to memory with offset 4
287: LDC 0,0(0) 
288: ST 0,-4(5) 
289: ST 0,-6(5) Storing argument
* Adding argument 3
* Loading Constant 10 to register 0 and save to memory with offset 4
290: LDC 0,10(0) 
291: ST 0,-4(5) 
292: ST 0,-7(5) Storing argument
* Create new activation record
293: ST 5,-3(5) Save address of current frame pointer to memory with offset 10
294: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
295: LDA 0,1(7) Save the return address in the accumulator
296: LDA 7,-175(7) Jump to sort()
297: LD 5,0(5) Pop the frame and return to the current frame
298: ST 0,-3(5) Store return value
* --- Calling sort() ---
* --- Assignment Expression ---
299: LDA 0,-2(5) Load address for var (i)
300: ST 0,-4(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 5
301: LDC 0,0(0) 
302: ST 0,-5(5) 
* Store back the result of the assignment operation
303: LD 0,-4(5) Load to memory the address and result value
304: LD 1,-5(5) 
305: ST 1,0(0) 
306: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
307: LD 0,-2(5) Value of i
308: ST 0,-5(5) 
* Loading Constant 10 to register 0 and save to memory with offset 6
309: LDC 0,10(0) 
310: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
311: LD 0,-5(5) Load Left hand side
312: LD 1,-6(5) Load Right hand side
313: SUB 0,0,1 Subtract for Comparison
314: JLT 0,2(7) Jump to next instruction if true
315: LDC 0,0(0) Load 0 (false)
316: LDA 7,1(7) Unconditional Jump
317: LDC 0,1(0) Load 1 (true)
318: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Calling output() ---
* Offset: 5
* Adding argument 1
321: LD 0,-2(5) Value of i
322: ST 0,-7(5) 
* Load index calculated at offset 7 and base address of array x[] and save it to offset 6
323: LDA 0,0(6) Load address to register
324: LD 1,-7(5) Load index value to register
325: SUB 0,0,1 Substract the offset to the address
326: LD 0,0(0) Load the value at the x[index] address to the AC
327: ST 0,-6(6) Value of x[index]
328: ST 0,-7(5) Storing argument
* Create new activation record
329: ST 5,-5(5) Save address of current frame pointer to memory with offset 15
330: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
331: LDA 0,1(7) Save the return address in the accumulator
332: LDA 7,-326(7) Jump to output()
333: LD 5,0(5) Pop the frame and return to the current frame
334: ST 0,-5(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
335: LDA 0,-2(5) Load address for var (i)
336: ST 0,-6(5) &i
* --- Operation Expression ---
337: LD 0,-2(5) Value of i
338: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
339: LDC 0,1(0) 
340: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
341: LD 0,-8(5) Load Left hand side
342: LD 1,-9(5) Load Right hand side
343: ADD 0,0,1 Operation
344: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
345: LD 0,-6(5) Load to memory the address and result value
346: LD 1,-7(5) 
347: ST 1,0(0) 
348: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
349: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
319: LD 0,-4(5) Load test value
320: JLE 0,29(7) Jump to end if test <= 0 (false)
350: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,339(7) Jump around function bodies
* --- Final ---
351: ST 5,-10(5) Original Pointer
352: LDA 5,-10(5) Push Main Frame Pointer
353: LDA 0,1(7) Load Accumulator with return pointer
354: LDA 7,-125(7) Jump to Location
355: LD 5,0(5) Pop Main Frame
356: HALT 0,0,0 Exit
* --- Final ---
