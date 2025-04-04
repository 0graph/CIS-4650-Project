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
* Making Space for variable (x)
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
21: LDA 0,-6(5) Load address for var (x)
22: ST 0,-9(5) &x
23: LD 0,-3(5) Value of low
24: ST 0,-11(5) 
* Check that index is valid
25: LDC 1,-1(1) Load Size
26: SUB 2,0,1 Check size
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
27: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
28: LD 1,-11(5) Load index value to register
29: SUB 0,0,1 Substract the offset to the address
30: LD 0,0(0) Load the value at the a[index] address to the AC
31: ST 0,-10(5) Value of a[index]
* Store back the result of the assignment operation
32: LD 0,-9(5) Load to memory the address and result value
33: LD 1,-10(5) 
34: ST 1,0(0) 
35: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
36: LDA 0,-7(5) Load address for var (i)
37: ST 0,-9(5) &i
* --- Operation Expression ---
38: LD 0,-3(5) Value of low
39: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
40: LDC 0,1(0) 
41: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
42: LD 0,-11(5) Load Left hand side
43: LD 1,-12(5) Load Right hand side
44: ADD 0,0,1 Operation
45: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
46: LD 0,-9(5) Load to memory the address and result value
47: LD 1,-10(5) 
48: ST 1,0(0) 
49: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
50: LD 0,-7(5) Value of i
51: ST 0,-10(5) 
52: LD 0,-4(5) Value of high
53: ST 0,-11(5) 
* Save the result of the operation expression to the address offset 9
54: LD 0,-10(5) Load Left hand side
55: LD 1,-11(5) Load Right hand side
56: SUB 0,0,1 Subtract for Comparison
57: JLT 0,2(7) Jump to next instruction if true
58: LDC 0,0(0) Load 0 (false)
59: LDA 7,1(7) Unconditional Jump
60: LDC 0,1(0) Load 1 (true)
61: ST 0,-9(5) Store value of expression
* --- Operation Expression ---
* --- If Expression ---
* --- Operation Expression ---
64: LD 0,-7(5) Value of i
65: ST 0,-13(5) 
* Check that index is valid
66: LDC 1,-1(1) Load Size
67: SUB 2,0,1 Check size
* Load index calculated at offset 13 and base address of array a[] and save it to offset 12
68: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
69: LD 1,-13(5) Load index value to register
70: SUB 0,0,1 Substract the offset to the address
71: LD 0,0(0) Load the value at the a[index] address to the AC
72: ST 0,-12(5) Value of a[index]
73: LD 0,-6(5) Value of x
74: ST 0,-13(5) 
* Save the result of the operation expression to the address offset 11
75: LD 0,-12(5) Load Left hand side
76: LD 1,-13(5) Load Right hand side
77: SUB 0,0,1 Subtract for Comparison
78: JLT 0,2(7) Jump to next instruction if true
79: LDC 0,0(0) Load 0 (false)
80: LDA 7,1(7) Unconditional Jump
81: LDC 0,1(0) Load 1 (true)
82: ST 0,-11(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
84: LDA 0,-6(5) Load address for var (x)
85: ST 0,-12(5) &x
86: LD 0,-7(5) Value of i
87: ST 0,-14(5) 
* Check that index is valid
88: LDC 1,-1(1) Load Size
89: SUB 2,0,1 Check size
* Load index calculated at offset 14 and base address of array a[] and save it to offset 13
90: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
91: LD 1,-14(5) Load index value to register
92: SUB 0,0,1 Substract the offset to the address
93: LD 0,0(0) Load the value at the a[index] address to the AC
94: ST 0,-13(5) Value of a[index]
* Store back the result of the assignment operation
95: LD 0,-12(5) Load to memory the address and result value
96: LD 1,-13(5) 
97: ST 1,0(0) 
98: ST 1,-11(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
99: LDA 0,-5(5) Load address for var (k)
100: ST 0,-12(5) &k
101: LD 0,-7(5) Value of i
102: ST 0,-13(5) 
* Store back the result of the assignment operation
103: LD 0,-12(5) Load to memory the address and result value
104: LD 1,-13(5) 
105: ST 1,0(0) 
106: ST 1,-11(5) Value Stored!
* --- Assignment Expression ---
83: JEQ 0,24(7) if false jump 24 instructions
107: LDA 7,0(7) jump around body
* --- If Expression ---
* --- Assignment Expression ---
108: LDA 0,-7(5) Load address for var (i)
109: ST 0,-11(5) &i
* --- Operation Expression ---
110: LD 0,-7(5) Value of i
111: ST 0,-13(5) 
* Loading Constant 1 to register 0 and save to memory with offset 14
112: LDC 0,1(0) 
113: ST 0,-14(5) 
* Save the result of the operation expression to the address offset 12
114: LD 0,-13(5) Load Left hand side
115: LD 1,-14(5) Load Right hand side
116: ADD 0,0,1 Operation
117: ST 0,-12(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
118: LD 0,-11(5) Load to memory the address and result value
119: LD 1,-12(5) 
120: ST 1,0(0) 
121: ST 1,-10(5) Value Stored!
* --- Assignment Expression ---
122: LDA 7,-71(7) Jump to test after body
* Load the test value to register 0
62: LD 0,-9(5) Load test value
63: JLE 0,59(7) Jump to end if test <= 0 (false)
* --- Return Expression ---
123: LD 0,-5(5) Value of k
124: ST 0,-9(5) 
125: LD 1,0(0) Save value from return expression
126: LD 7,-1(5) Return to caller
* --- Return Expression ---
127: LD 7,-1(5) Return to caller
* --- Function Declaration (minloc) ---
* --- Function Declaration (sort) ---
128: ST 0,-1(5) Store return
* Making space for array variable (a[1])
* Making Space for variable (low)
* Making Space for variable (high)
* Making Space for variable (k)
* Making Space for variable (i)
* --- Assignment Expression ---
129: LDA 0,-6(5) Load address for var (i)
130: ST 0,-8(5) &i
131: LD 0,-3(5) Value of low
132: ST 0,-9(5) 
* Store back the result of the assignment operation
133: LD 0,-8(5) Load to memory the address and result value
134: LD 1,-9(5) 
135: ST 1,0(0) 
136: ST 1,-7(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
137: LD 0,-6(5) Value of i
138: ST 0,-9(5) 
* --- Operation Expression ---
139: LD 0,-4(5) Value of high
140: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
141: LDC 0,1(0) 
142: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
143: LD 0,-11(5) Load Left hand side
144: LD 1,-12(5) Load Right hand side
145: SUB 0,0,1 Operation
146: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Save the result of the operation expression to the address offset 8
147: LD 0,-9(5) Load Left hand side
148: LD 1,-10(5) Load Right hand side
149: SUB 0,0,1 Subtract for Comparison
150: JLT 0,2(7) Jump to next instruction if true
151: LDC 0,0(0) Load 0 (false)
152: LDA 7,1(7) Unconditional Jump
153: LDC 0,1(0) Load 1 (true)
154: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Making Space for variable (t)
* --- Assignment Expression ---
157: LDA 0,-5(5) Load address for var (k)
158: ST 0,-10(5) &k
* --- Calling minloc() ---
* Offset: 11
* Adding argument 1
159: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
160: ST 0,-14(5) 
161: ST 0,-13(5) Storing argument
* Adding argument 2
162: LD 0,-6(5) Value of i
163: ST 0,-15(5) 
164: ST 0,-14(5) Storing argument
* Adding argument 3
165: LD 0,-4(5) Value of high
166: ST 0,-16(5) 
167: ST 0,-15(5) Storing argument
* Create new activation record
168: ST 5,-11(5) Save address of current frame pointer to memory with offset 11
169: LDA 5,-11(5) Load the frame pointer so that it starts at offset 11
170: LDA 0,1(7) Save the return address in the accumulator
171: LDA 7,-160(7) Jump to minloc()
172: LD 5,0(5) Pop the frame and return to the current frame
173: ST 0,-11(5) Store return value
* --- Calling minloc() ---
* Store back the result of the assignment operation
174: LD 0,-10(5) Load to memory the address and result value
175: LD 1,-11(5) 
176: ST 1,0(0) 
177: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
178: LDA 0,-7(5) Load address for var (t)
179: ST 0,-10(5) &t
180: LD 0,-5(5) Value of k
181: ST 0,-12(5) 
* Check that index is valid
182: LDC 1,-1(1) Load Size
183: SUB 2,0,1 Check size
* Load index calculated at offset 12 and base address of array a[] and save it to offset 11
184: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
185: LD 1,-12(5) Load index value to register
186: SUB 0,0,1 Substract the offset to the address
187: LD 0,0(0) Load the value at the a[index] address to the AC
188: ST 0,-11(5) Value of a[index]
* Store back the result of the assignment operation
189: LD 0,-10(5) Load to memory the address and result value
190: LD 1,-11(5) 
191: ST 1,0(0) 
192: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
193: LD 0,-5(5) Value of k
194: ST 0,-11(5) 
* Check that index is valid
195: LDC 1,-1(1) Load Size
196: SUB 2,0,1 Check size
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
197: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
198: LD 1,-11(5) Load index value to register
199: SUB 0,0,1 Substract the offset to the address
200: ST 0,-10(5) Store the address given the index at offset 10
201: LD 0,-6(5) Value of i
202: ST 0,-12(5) 
* Check that index is valid
203: LDC 1,-1(1) Load Size
204: SUB 2,0,1 Check size
* Load index calculated at offset 12 and base address of array a[] and save it to offset 11
205: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
206: LD 1,-12(5) Load index value to register
207: SUB 0,0,1 Substract the offset to the address
208: LD 0,0(0) Load the value at the a[index] address to the AC
209: ST 0,-11(5) Value of a[index]
* Store back the result of the assignment operation
210: LD 0,-10(5) Load to memory the address and result value
211: LD 1,-11(5) 
212: ST 1,0(0) 
213: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
214: LD 0,-6(5) Value of i
215: ST 0,-11(5) 
* Check that index is valid
216: LDC 1,-1(1) Load Size
217: SUB 2,0,1 Check size
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
218: LD 0,-2(5) Original Address of a, PO: 5, SA: 2, P*: 5
219: LD 1,-11(5) Load index value to register
220: SUB 0,0,1 Substract the offset to the address
221: ST 0,-10(5) Store the address given the index at offset 10
222: LD 0,-7(5) Value of t
223: ST 0,-11(5) 
* Store back the result of the assignment operation
224: LD 0,-10(5) Load to memory the address and result value
225: LD 1,-11(5) 
226: ST 1,0(0) 
227: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
228: LDA 0,-6(5) Load address for var (i)
229: ST 0,-10(5) &i
* --- Operation Expression ---
230: LD 0,-6(5) Value of i
231: ST 0,-12(5) 
* Loading Constant 1 to register 0 and save to memory with offset 13
232: LDC 0,1(0) 
233: ST 0,-13(5) 
* Save the result of the operation expression to the address offset 11
234: LD 0,-12(5) Load Left hand side
235: LD 1,-13(5) Load Right hand side
236: ADD 0,0,1 Operation
237: ST 0,-11(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
238: LD 0,-10(5) Load to memory the address and result value
239: LD 1,-11(5) 
240: ST 1,0(0) 
241: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
242: LDA 7,-104(7) Jump to test after body
* Load the test value to register 0
155: LD 0,-8(5) Load test value
156: JLE 0,86(7) Jump to end if test <= 0 (false)
243: LD 7,-1(5) Return to caller
* --- Function Declaration (sort) ---
* --- Function Declaration (main) ---
244: ST 0,-1(5) Store return
* Making Space for variable (i)
* --- Assignment Expression ---
245: LDA 0,-2(5) Load address for var (i)
246: ST 0,-4(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 5
247: LDC 0,0(0) 
248: ST 0,-5(5) 
* Store back the result of the assignment operation
249: LD 0,-4(5) Load to memory the address and result value
250: LD 1,-5(5) 
251: ST 1,0(0) 
252: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
253: LD 0,-2(5) Value of i
254: ST 0,-5(5) 
* Loading Constant 10 to register 0 and save to memory with offset 6
255: LDC 0,10(0) 
256: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
257: LD 0,-5(5) Load Left hand side
258: LD 1,-6(5) Load Right hand side
259: SUB 0,0,1 Subtract for Comparison
260: JLT 0,2(7) Jump to next instruction if true
261: LDC 0,0(0) Load 0 (false)
262: LDA 7,1(7) Unconditional Jump
263: LDC 0,1(0) Load 1 (true)
264: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
267: LD 0,-2(5) Value of i
268: ST 0,-7(5) 
* Check that index is valid
269: LDC 1,-10(1) Load Size
270: SUB 2,0,1 Check size
* Load index calculated at offset 7 and base address of array x[] and save it to offset 6
271: LDA 0,0(6) Address of x, PO: 2, SA: 0, P*: 6
272: LD 1,-7(5) Load index value to register
273: SUB 0,0,1 Substract the offset to the address
274: ST 0,-6(5) Store the address given the index at offset 6
* --- Calling input() ---
* Offset: 7
* Create new activation record
275: ST 5,-7(5) Save address of current frame pointer to memory with offset 7
276: LDA 5,-7(5) Load the frame pointer so that it starts at offset 7
277: LDA 0,1(7) Save the return address in the accumulator
278: LDA 7,-275(7) Jump to input()
279: LD 5,0(5) Pop the frame and return to the current frame
280: ST 0,-7(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
281: LD 0,-6(5) Load to memory the address and result value
282: LD 1,-7(5) 
283: ST 1,0(0) 
284: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
285: LDA 0,-2(5) Load address for var (i)
286: ST 0,-6(5) &i
* --- Operation Expression ---
287: LD 0,-2(5) Value of i
288: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
289: LDC 0,1(0) 
290: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
291: LD 0,-8(5) Load Left hand side
292: LD 1,-9(5) Load Right hand side
293: ADD 0,0,1 Operation
294: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
295: LD 0,-6(5) Load to memory the address and result value
296: LD 1,-7(5) 
297: ST 1,0(0) 
298: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
299: LDA 7,-45(7) Jump to test after body
* Load the test value to register 0
265: LD 0,-4(5) Load test value
266: JLE 0,33(7) Jump to end if test <= 0 (false)
* --- Calling sort() ---
* Offset: 3
* Adding argument 1
300: LDA 0,0(6) Address of x, PO: 2, SA: 0, P*: 6
301: ST 0,-6(5) 
302: ST 0,-5(5) Storing argument
* Adding argument 2
* Loading Constant 0 to register 0 and save to memory with offset 7
303: LDC 0,0(0) 
304: ST 0,-7(5) 
305: ST 0,-6(5) Storing argument
* Adding argument 3
* Loading Constant 10 to register 0 and save to memory with offset 8
306: LDC 0,10(0) 
307: ST 0,-8(5) 
308: ST 0,-7(5) Storing argument
* Create new activation record
309: ST 5,-3(5) Save address of current frame pointer to memory with offset 3
310: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
311: LDA 0,1(7) Save the return address in the accumulator
312: LDA 7,-185(7) Jump to sort()
313: LD 5,0(5) Pop the frame and return to the current frame
314: ST 0,-3(5) Store return value
* --- Calling sort() ---
* --- Assignment Expression ---
315: LDA 0,-2(5) Load address for var (i)
316: ST 0,-4(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 5
317: LDC 0,0(0) 
318: ST 0,-5(5) 
* Store back the result of the assignment operation
319: LD 0,-4(5) Load to memory the address and result value
320: LD 1,-5(5) 
321: ST 1,0(0) 
322: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
323: LD 0,-2(5) Value of i
324: ST 0,-5(5) 
* Loading Constant 10 to register 0 and save to memory with offset 6
325: LDC 0,10(0) 
326: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
327: LD 0,-5(5) Load Left hand side
328: LD 1,-6(5) Load Right hand side
329: SUB 0,0,1 Subtract for Comparison
330: JLT 0,2(7) Jump to next instruction if true
331: LDC 0,0(0) Load 0 (false)
332: LDA 7,1(7) Unconditional Jump
333: LDC 0,1(0) Load 1 (true)
334: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Calling output() ---
* Offset: 5
* Adding argument 1
337: LD 0,-2(5) Value of i
338: ST 0,-9(5) 
* Check that index is valid
339: LDC 1,-10(1) Load Size
340: SUB 2,0,1 Check size
* Load index calculated at offset 9 and base address of array x[] and save it to offset 8
341: LDA 0,0(6) Address of x, PO: 2, SA: 0, P*: 6
342: LD 1,-9(5) Load index value to register
343: SUB 0,0,1 Substract the offset to the address
344: LD 0,0(0) Load the value at the x[index] address to the AC
345: ST 0,-8(5) Value of x[index]
346: ST 0,-7(5) Storing argument
* Create new activation record
347: ST 5,-5(5) Save address of current frame pointer to memory with offset 5
348: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
349: LDA 0,1(7) Save the return address in the accumulator
350: LDA 7,-344(7) Jump to output()
351: LD 5,0(5) Pop the frame and return to the current frame
352: ST 0,-5(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
353: LDA 0,-2(5) Load address for var (i)
354: ST 0,-6(5) &i
* --- Operation Expression ---
355: LD 0,-2(5) Value of i
356: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
357: LDC 0,1(0) 
358: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
359: LD 0,-8(5) Load Left hand side
360: LD 1,-9(5) Load Right hand side
361: ADD 0,0,1 Operation
362: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
363: LD 0,-6(5) Load to memory the address and result value
364: LD 1,-7(5) 
365: ST 1,0(0) 
366: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
367: LDA 7,-43(7) Jump to test after body
* Load the test value to register 0
335: LD 0,-4(5) Load test value
336: JLE 0,31(7) Jump to end if test <= 0 (false)
368: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,357(7) Jump around function bodies
* --- Final ---
369: ST 5,-10(5) Original Pointer
370: LDA 5,-10(5) Push Main Frame Pointer
371: LDA 0,1(7) Load Accumulator with return pointer
372: LDA 7,-129(7) Jump to Location
373: LD 5,0(5) Pop Main Frame
374: HALT 0,0,0 Exit
* --- Final ---
