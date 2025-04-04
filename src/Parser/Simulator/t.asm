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
* Making space for array variable (a[1])
* Making Space for variable (low)
* Making Space for variable (high)
* Making Space for variable (k)
* Making Space for variable (z)
* Making Space for variable (i)
* --- Assignment Expression ---
13: LDA 0,-5(5) Load address for var (k)
14: ST 0,-9(5) &k
15: LD 0,-3(5) Value of low
16: ST 0,-10(5) 
* Store back the result of the assignment operation
17: LD 0,-9(5) Load to memory the address and result value
18: LD 1,-10(5) 
19: ST 1,0(0) 
20: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
21: LDA 0,-6(5) Load address for var (z)
22: ST 0,-9(5) &z
23: LD 0,-3(5) Value of low
24: ST 0,-11(5) 
* Check that index is valid
25: LDC 1,-1(1) Load Size
26: SUB 2,0,1 Check size
27: JGE 2,1000(7) Jump to error if out of range
28: LDC 1,0(1) Load Size
29: SUB 2,0,1 Check size
30: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
31: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
32: LD 1,-11(5) Load index value to register
33: SUB 0,0,1 Substract the offset to the address
34: LD 0,0(0) Load the value at the a[index] address to the AC
35: ST 0,-10(5) Value of a[index]
* Store back the result of the assignment operation
36: LD 0,-9(5) Load to memory the address and result value
37: LD 1,-10(5) 
38: ST 1,0(0) 
39: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
40: LDA 0,-7(5) Load address for var (i)
41: ST 0,-9(5) &i
* --- Operation Expression ---
42: LD 0,-3(5) Value of low
43: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
44: LDC 0,1(0) 
45: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
46: LD 0,-11(5) Load Left hand side
47: LD 1,-12(5) Load Right hand side
48: ADD 0,0,1 Operation
49: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
50: LD 0,-9(5) Load to memory the address and result value
51: LD 1,-10(5) 
52: ST 1,0(0) 
53: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
54: LD 0,-7(5) Value of i
55: ST 0,-10(5) 
56: LD 0,-4(5) Value of high
57: ST 0,-11(5) 
* Save the result of the operation expression to the address offset 9
58: LD 0,-10(5) Load Left hand side
59: LD 1,-11(5) Load Right hand side
60: SUB 0,0,1 Subtract for Comparison
61: JLT 0,2(7) Jump to next instruction if true
62: LDC 0,0(0) Load 0 (false)
63: LDA 7,1(7) Unconditional Jump
64: LDC 0,1(0) Load 1 (true)
65: ST 0,-9(5) Store value of expression
* --- Operation Expression ---
* --- If Expression ---
* --- Operation Expression ---
68: LD 0,-7(5) Value of i
69: ST 0,-13(5) 
* Check that index is valid
70: LDC 1,-1(1) Load Size
71: SUB 2,0,1 Check size
72: JGE 2,1000(7) Jump to error if out of range
73: LDC 1,0(1) Load Size
74: SUB 2,0,1 Check size
75: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 13 and base address of array a[] and save it to offset 12
76: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
77: LD 1,-13(5) Load index value to register
78: SUB 0,0,1 Substract the offset to the address
79: LD 0,0(0) Load the value at the a[index] address to the AC
80: ST 0,-12(5) Value of a[index]
81: LD 0,-6(5) Value of z
82: ST 0,-13(5) 
* Save the result of the operation expression to the address offset 11
83: LD 0,-12(5) Load Left hand side
84: LD 1,-13(5) Load Right hand side
85: SUB 0,0,1 Subtract for Comparison
86: JLT 0,2(7) Jump to next instruction if true
87: LDC 0,0(0) Load 0 (false)
88: LDA 7,1(7) Unconditional Jump
89: LDC 0,1(0) Load 1 (true)
90: ST 0,-11(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
92: LDA 0,-6(5) Load address for var (z)
93: ST 0,-12(5) &z
94: LD 0,-7(5) Value of i
95: ST 0,-14(5) 
* Check that index is valid
96: LDC 1,-1(1) Load Size
97: SUB 2,0,1 Check size
98: JGE 2,1000(7) Jump to error if out of range
99: LDC 1,0(1) Load Size
100: SUB 2,0,1 Check size
101: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 14 and base address of array a[] and save it to offset 13
102: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
103: LD 1,-14(5) Load index value to register
104: SUB 0,0,1 Substract the offset to the address
105: LD 0,0(0) Load the value at the a[index] address to the AC
106: ST 0,-13(5) Value of a[index]
* Store back the result of the assignment operation
107: LD 0,-12(5) Load to memory the address and result value
108: LD 1,-13(5) 
109: ST 1,0(0) 
110: ST 1,-11(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
111: LDA 0,-5(5) Load address for var (k)
112: ST 0,-12(5) &k
113: LD 0,-7(5) Value of i
114: ST 0,-13(5) 
* Store back the result of the assignment operation
115: LD 0,-12(5) Load to memory the address and result value
116: LD 1,-13(5) 
117: ST 1,0(0) 
118: ST 1,-11(5) Value Stored!
* --- Assignment Expression ---
91: JEQ 0,28(7) if false jump 28 instructions
119: LDA 7,0(7) jump around body
* --- If Expression ---
* --- Assignment Expression ---
120: LDA 0,-7(5) Load address for var (i)
121: ST 0,-11(5) &i
* --- Operation Expression ---
122: LD 0,-7(5) Value of i
123: ST 0,-13(5) 
* Loading Constant 1 to register 0 and save to memory with offset 14
124: LDC 0,1(0) 
125: ST 0,-14(5) 
* Save the result of the operation expression to the address offset 12
126: LD 0,-13(5) Load Left hand side
127: LD 1,-14(5) Load Right hand side
128: ADD 0,0,1 Operation
129: ST 0,-12(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
130: LD 0,-11(5) Load to memory the address and result value
131: LD 1,-12(5) 
132: ST 1,0(0) 
133: ST 1,-10(5) Value Stored!
* --- Assignment Expression ---
134: LDA 7,-79(7) Jump to test after body
* Load the test value to register 0
66: LD 0,-9(5) Load test value
67: JLE 0,67(7) Jump to end if test <= 0 (false)
* --- Return Expression ---
135: LD 0,-5(5) Value of k
136: ST 0,-9(5) 
137: LD 1,0(0) Save value from return expression
138: LD 7,-1(5) Return to caller
* --- Return Expression ---
139: LD 7,-1(5) Return to caller
* --- Function Declaration (minloc) ---
* --- Function Declaration (sort) ---
140: ST 0,-1(5) Store return
* Making space for array variable (a[1])
* Making Space for variable (low)
* Making Space for variable (high)
* Making Space for variable (k)
* Making Space for variable (i)
* --- Assignment Expression ---
141: LDA 0,-6(5) Load address for var (i)
142: ST 0,-8(5) &i
143: LD 0,-3(5) Value of low
144: ST 0,-9(5) 
* Store back the result of the assignment operation
145: LD 0,-8(5) Load to memory the address and result value
146: LD 1,-9(5) 
147: ST 1,0(0) 
148: ST 1,-7(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
149: LD 0,-6(5) Value of i
150: ST 0,-9(5) 
* --- Operation Expression ---
151: LD 0,-4(5) Value of high
152: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
153: LDC 0,1(0) 
154: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
155: LD 0,-11(5) Load Left hand side
156: LD 1,-12(5) Load Right hand side
157: SUB 0,0,1 Operation
158: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Save the result of the operation expression to the address offset 8
159: LD 0,-9(5) Load Left hand side
160: LD 1,-10(5) Load Right hand side
161: SUB 0,0,1 Subtract for Comparison
162: JLT 0,2(7) Jump to next instruction if true
163: LDC 0,0(0) Load 0 (false)
164: LDA 7,1(7) Unconditional Jump
165: LDC 0,1(0) Load 1 (true)
166: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Making Space for variable (t)
* --- Assignment Expression ---
169: LDA 0,-5(5) Load address for var (k)
170: ST 0,-10(5) &k
* --- Calling minloc() ---
* Offset: 11
* Adding argument 1
171: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
172: ST 0,-14(5) 
173: ST 0,-13(5) Storing argument
* Adding argument 2
174: LD 0,-6(5) Value of i
175: ST 0,-15(5) 
176: ST 0,-14(5) Storing argument
* Adding argument 3
177: LD 0,-4(5) Value of high
178: ST 0,-16(5) 
179: ST 0,-15(5) Storing argument
* Create new activation record
180: ST 5,-11(5) Save address of current frame pointer to memory with offset 11
181: LDA 5,-11(5) Load the frame pointer so that it starts at offset 11
182: LDA 0,1(7) Save the return address in the accumulator
183: LDA 7,-172(7) Jump to minloc()
184: LD 5,0(5) Pop the frame and return to the current frame
185: ST 0,-11(5) Store return value
* --- Calling minloc() ---
* Store back the result of the assignment operation
186: LD 0,-10(5) Load to memory the address and result value
187: LD 1,-11(5) 
188: ST 1,0(0) 
189: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
190: LDA 0,-7(5) Load address for var (t)
191: ST 0,-10(5) &t
192: LD 0,-5(5) Value of k
193: ST 0,-12(5) 
* Check that index is valid
194: LDC 1,-1(1) Load Size
195: SUB 2,0,1 Check size
196: JGE 2,1000(7) Jump to error if out of range
197: LDC 1,0(1) Load Size
198: SUB 2,0,1 Check size
199: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 12 and base address of array a[] and save it to offset 11
200: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
201: LD 1,-12(5) Load index value to register
202: SUB 0,0,1 Substract the offset to the address
203: LD 0,0(0) Load the value at the a[index] address to the AC
204: ST 0,-11(5) Value of a[index]
* Store back the result of the assignment operation
205: LD 0,-10(5) Load to memory the address and result value
206: LD 1,-11(5) 
207: ST 1,0(0) 
208: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
209: LD 0,-5(5) Value of k
210: ST 0,-11(5) 
* Check that index is valid
211: LDC 1,-1(1) Load Size
212: SUB 2,0,1 Check size
213: JGE 2,1000(7) Jump to error if out of range
214: LDC 1,0(1) Load Size
215: SUB 2,0,1 Check size
216: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
217: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
218: LD 1,-11(5) Load index value to register
219: SUB 0,0,1 Substract the offset to the address
220: ST 0,-10(5) Store the address given the index at offset 10
221: LD 0,-6(5) Value of i
222: ST 0,-12(5) 
* Check that index is valid
223: LDC 1,-1(1) Load Size
224: SUB 2,0,1 Check size
225: JGE 2,1000(7) Jump to error if out of range
226: LDC 1,0(1) Load Size
227: SUB 2,0,1 Check size
228: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 12 and base address of array a[] and save it to offset 11
229: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
230: LD 1,-12(5) Load index value to register
231: SUB 0,0,1 Substract the offset to the address
232: LD 0,0(0) Load the value at the a[index] address to the AC
233: ST 0,-11(5) Value of a[index]
* Store back the result of the assignment operation
234: LD 0,-10(5) Load to memory the address and result value
235: LD 1,-11(5) 
236: ST 1,0(0) 
237: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
238: LD 0,-6(5) Value of i
239: ST 0,-11(5) 
* Check that index is valid
240: LDC 1,-1(1) Load Size
241: SUB 2,0,1 Check size
242: JGE 2,1000(7) Jump to error if out of range
243: LDC 1,0(1) Load Size
244: SUB 2,0,1 Check size
245: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
246: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
247: LD 1,-11(5) Load index value to register
248: SUB 0,0,1 Substract the offset to the address
249: ST 0,-10(5) Store the address given the index at offset 10
250: LD 0,-7(5) Value of t
251: ST 0,-11(5) 
* Store back the result of the assignment operation
252: LD 0,-10(5) Load to memory the address and result value
253: LD 1,-11(5) 
254: ST 1,0(0) 
255: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
256: LDA 0,-6(5) Load address for var (i)
257: ST 0,-10(5) &i
* --- Operation Expression ---
258: LD 0,-6(5) Value of i
259: ST 0,-12(5) 
* Loading Constant 1 to register 0 and save to memory with offset 13
260: LDC 0,1(0) 
261: ST 0,-13(5) 
* Save the result of the operation expression to the address offset 11
262: LD 0,-12(5) Load Left hand side
263: LD 1,-13(5) Load Right hand side
264: ADD 0,0,1 Operation
265: ST 0,-11(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
266: LD 0,-10(5) Load to memory the address and result value
267: LD 1,-11(5) 
268: ST 1,0(0) 
269: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
270: LDA 7,-120(7) Jump to test after body
* Load the test value to register 0
167: LD 0,-8(5) Load test value
168: JLE 0,102(7) Jump to end if test <= 0 (false)
271: LD 7,-1(5) Return to caller
* --- Function Declaration (sort) ---
* --- Function Declaration (main) ---
272: ST 0,-1(5) Store return
* Making Space for variable (i)
* --- Assignment Expression ---
273: LDA 0,-2(5) Load address for var (i)
274: ST 0,-4(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 5
275: LDC 0,0(0) 
276: ST 0,-5(5) 
* Store back the result of the assignment operation
277: LD 0,-4(5) Load to memory the address and result value
278: LD 1,-5(5) 
279: ST 1,0(0) 
280: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
281: LD 0,-2(5) Value of i
282: ST 0,-5(5) 
* Loading Constant 10 to register 0 and save to memory with offset 6
283: LDC 0,10(0) 
284: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
285: LD 0,-5(5) Load Left hand side
286: LD 1,-6(5) Load Right hand side
287: SUB 0,0,1 Subtract for Comparison
288: JLT 0,2(7) Jump to next instruction if true
289: LDC 0,0(0) Load 0 (false)
290: LDA 7,1(7) Unconditional Jump
291: LDC 0,1(0) Load 1 (true)
292: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
295: LD 0,-2(5) Value of i
296: ST 0,-7(5) 
* Check that index is valid
297: LDC 1,-10(1) Load Size
298: SUB 2,0,1 Check size
299: JGE 2,1000(7) Jump to error if out of range
300: LDC 1,0(1) Load Size
301: SUB 2,0,1 Check size
302: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 7 and base address of array x[] and save it to offset 6
303: LDA 0,0(6) Address of x, PO: 2, SA: 0, P*: 6
304: LD 1,-7(5) Load index value to register
305: SUB 0,0,1 Substract the offset to the address
306: ST 0,-6(5) Store the address given the index at offset 6
* --- Calling input() ---
* Offset: 7
* Create new activation record
307: ST 5,-7(5) Save address of current frame pointer to memory with offset 7
308: LDA 5,-7(5) Load the frame pointer so that it starts at offset 7
309: LDA 0,1(7) Save the return address in the accumulator
310: LDA 7,-307(7) Jump to input()
311: LD 5,0(5) Pop the frame and return to the current frame
312: ST 0,-7(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
313: LD 0,-6(5) Load to memory the address and result value
314: LD 1,-7(5) 
315: ST 1,0(0) 
316: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
317: LDA 0,-2(5) Load address for var (i)
318: ST 0,-6(5) &i
* --- Operation Expression ---
319: LD 0,-2(5) Value of i
320: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
321: LDC 0,1(0) 
322: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
323: LD 0,-8(5) Load Left hand side
324: LD 1,-9(5) Load Right hand side
325: ADD 0,0,1 Operation
326: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
327: LD 0,-6(5) Load to memory the address and result value
328: LD 1,-7(5) 
329: ST 1,0(0) 
330: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
331: LDA 7,-49(7) Jump to test after body
* Load the test value to register 0
293: LD 0,-4(5) Load test value
294: JLE 0,37(7) Jump to end if test <= 0 (false)
* --- Calling sort() ---
* Offset: 3
* Adding argument 1
332: LDA 0,0(6) Address of x, PO: 2, SA: 0, P*: 6
333: ST 0,-6(5) 
334: ST 0,-5(5) Storing argument
* Adding argument 2
* Loading Constant 0 to register 0 and save to memory with offset 7
335: LDC 0,0(0) 
336: ST 0,-7(5) 
337: ST 0,-6(5) Storing argument
* Adding argument 3
* Loading Constant 10 to register 0 and save to memory with offset 8
338: LDC 0,10(0) 
339: ST 0,-8(5) 
340: ST 0,-7(5) Storing argument
* Create new activation record
341: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
342: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
343: LDA 0,1(7) Save the return address in the accumulator
344: LDA 7,-205(7) Jump to sort()
345: LD 5,0(5) Pop the frame and return to the current frame
346: ST 0,-3(5) Store return value
* --- Calling sort() ---
* --- Assignment Expression ---
347: LDA 0,-2(5) Load address for var (i)
348: ST 0,-4(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 5
349: LDC 0,0(0) 
350: ST 0,-5(5) 
* Store back the result of the assignment operation
351: LD 0,-4(5) Load to memory the address and result value
352: LD 1,-5(5) 
353: ST 1,0(0) 
354: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
355: LD 0,-2(5) Value of i
356: ST 0,-5(5) 
* Loading Constant 10 to register 0 and save to memory with offset 6
357: LDC 0,10(0) 
358: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
359: LD 0,-5(5) Load Left hand side
360: LD 1,-6(5) Load Right hand side
361: SUB 0,0,1 Subtract for Comparison
362: JLT 0,2(7) Jump to next instruction if true
363: LDC 0,0(0) Load 0 (false)
364: LDA 7,1(7) Unconditional Jump
365: LDC 0,1(0) Load 1 (true)
366: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Calling output() ---
* Offset: 5
* Adding argument 1
369: LD 0,-2(5) Value of i
370: ST 0,-9(5) 
* Check that index is valid
371: LDC 1,-10(1) Load Size
372: SUB 2,0,1 Check size
373: JGE 2,1000(7) Jump to error if out of range
374: LDC 1,0(1) Load Size
375: SUB 2,0,1 Check size
376: JLT 2,1000(7) Jump to error if out of range
* Load index calculated at offset 9 and base address of array x[] and save it to offset 8
377: LDA 0,0(6) Address of x, PO: 2, SA: 0, P*: 6
378: LD 1,-9(5) Load index value to register
379: SUB 0,0,1 Substract the offset to the address
380: LD 0,0(0) Load the value at the x[index] address to the AC
381: ST 0,-8(5) Value of x[index]
382: ST 0,-7(5) Storing argument
* Create new activation record
383: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
384: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
385: LDA 0,1(7) Save the return address in the accumulator
386: LDA 7,-380(7) Jump to output()
387: LD 5,0(5) Pop the frame and return to the current frame
388: ST 0,-5(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
389: LDA 0,-2(5) Load address for var (i)
390: ST 0,-6(5) &i
* --- Operation Expression ---
391: LD 0,-2(5) Value of i
392: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
393: LDC 0,1(0) 
394: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
395: LD 0,-8(5) Load Left hand side
396: LD 1,-9(5) Load Right hand side
397: ADD 0,0,1 Operation
398: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
399: LD 0,-6(5) Load to memory the address and result value
400: LD 1,-7(5) 
401: ST 1,0(0) 
402: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
403: LDA 7,-47(7) Jump to test after body
* Load the test value to register 0
367: LD 0,-4(5) Load test value
368: JLE 0,35(7) Jump to end if test <= 0 (false)
404: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,393(7) Jump around function bodies
* --- Final ---
405: ST 5,-10(5) Original Pointer
406: LDA 5,-10(5) Push Main Frame Pointer
407: LDA 0,1(7) Load Accumulator with return pointer
408: LDA 7,-137(7) Jump to Location
409: LD 5,0(5) Pop Main Frame
410: HALT 0,0,0 Exit
* --- Final ---
