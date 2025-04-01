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
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
25: LDA 0,-2(5) Load address to register
26: LD 1,-11(5) Load index value to register
27: SUB 0,0,1 Substract the offset to the address
28: LD 0,0(0) Load the value at the a[index] address to the AC
29: ST 0,-10(5) Value of a[index]
* Store back the result of the assignment operation
30: LD 0,-9(5) Load to memory the address and result value
31: LD 1,-10(5) 
32: ST 1,0(0) 
33: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
34: LDA 0,-7(5) Load address for var (i)
35: ST 0,-9(5) &i
* --- Operation Expression ---
36: LD 0,-3(5) Value of low
37: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
38: LDC 0,1(0) 
39: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
40: LD 0,-11(5) Load Left hand side
41: LD 1,-12(5) Load Right hand side
42: ADD 0,0,1 Operation
43: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
44: LD 0,-9(5) Load to memory the address and result value
45: LD 1,-10(5) 
46: ST 1,0(0) 
47: ST 1,-8(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
48: LD 0,-7(5) Value of i
49: ST 0,-10(5) 
50: LD 0,-4(5) Value of high
51: ST 0,-11(5) 
* Save the result of the operation expression to the address offset 9
52: LD 0,-10(5) Load Left hand side
53: LD 1,-11(5) Load Right hand side
54: SUB 0,0,1 Subtract for Comparison
55: JLT 0,2(7) Jump to next instruction if true
56: LDC 0,0(0) Load 0 (false)
57: LDA 7,1(7) Unconditional Jump
58: LDC 0,1(0) Load 1 (true)
59: ST 0,-9(5) Store value of expression
* --- Operation Expression ---
* --- If Expression ---
* --- Operation Expression ---
62: LD 0,-7(5) Value of i
63: ST 0,-13(5) 
* Load index calculated at offset 13 and base address of array a[] and save it to offset 12
64: LDA 0,-2(5) Load address to register
65: LD 1,-13(5) Load index value to register
66: SUB 0,0,1 Substract the offset to the address
67: LD 0,0(0) Load the value at the a[index] address to the AC
68: ST 0,-12(5) Value of a[index]
69: LD 0,-6(5) Value of x
70: ST 0,-13(5) 
* Save the result of the operation expression to the address offset 11
71: LD 0,-12(5) Load Left hand side
72: LD 1,-13(5) Load Right hand side
73: SUB 0,0,1 Subtract for Comparison
74: JLT 0,2(7) Jump to next instruction if true
75: LDC 0,0(0) Load 0 (false)
76: LDA 7,1(7) Unconditional Jump
77: LDC 0,1(0) Load 1 (true)
78: ST 0,-11(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
80: LDA 0,-6(5) Load address for var (x)
81: ST 0,-12(5) &x
82: LD 0,-7(5) Value of i
83: ST 0,-14(5) 
* Load index calculated at offset 14 and base address of array a[] and save it to offset 13
84: LDA 0,-2(5) Load address to register
85: LD 1,-14(5) Load index value to register
86: SUB 0,0,1 Substract the offset to the address
87: LD 0,0(0) Load the value at the a[index] address to the AC
88: ST 0,-13(5) Value of a[index]
* Store back the result of the assignment operation
89: LD 0,-12(5) Load to memory the address and result value
90: LD 1,-13(5) 
91: ST 1,0(0) 
92: ST 1,-11(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
93: LDA 0,-5(5) Load address for var (k)
94: ST 0,-12(5) &k
95: LD 0,-7(5) Value of i
96: ST 0,-13(5) 
* Store back the result of the assignment operation
97: LD 0,-12(5) Load to memory the address and result value
98: LD 1,-13(5) 
99: ST 1,0(0) 
100: ST 1,-11(5) Value Stored!
* --- Assignment Expression ---
79: JEQ 0,21(7) if false jump 21 instructions
101: LDA 7,0(7) jump around body
* --- If Expression ---
* --- Assignment Expression ---
102: LDA 0,-7(5) Load address for var (i)
103: ST 0,-11(5) &i
* --- Operation Expression ---
104: LD 0,-7(5) Value of i
105: ST 0,-13(5) 
* Loading Constant 1 to register 0 and save to memory with offset 14
106: LDC 0,1(0) 
107: ST 0,-14(5) 
* Save the result of the operation expression to the address offset 12
108: LD 0,-13(5) Load Left hand side
109: LD 1,-14(5) Load Right hand side
110: ADD 0,0,1 Operation
111: ST 0,-12(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
112: LD 0,-11(5) Load to memory the address and result value
113: LD 1,-12(5) 
114: ST 1,0(0) 
115: ST 1,-10(5) Value Stored!
* --- Assignment Expression ---
116: LDA 7,-67(7) Jump to test after body
* Load the test value to register 0
60: LD 0,-9(5) Load test value
61: JLE 0,55(7) Jump to end if test <= 0 (false)
* --- Return Expression ---
117: LD 0,-5(5) Value of k
118: ST 0,-9(5) 
119: LD 1,0(0) Save value from return expression
120: LD 7,-1(5) Return to caller
* --- Return Expression ---
121: LD 7,-1(5) Return to caller
* --- Function Declaration (minloc) ---
* --- Function Declaration (sort) ---
122: ST 0,-1(5) Store return
* Making space for array variable (a[1])
* Making Space for variable (low)
* Making Space for variable (high)
* Making Space for variable (k)
* Making Space for variable (i)
* --- Assignment Expression ---
123: LDA 0,-6(5) Load address for var (i)
124: ST 0,-8(5) &i
125: LD 0,-3(5) Value of low
126: ST 0,-9(5) 
* Store back the result of the assignment operation
127: LD 0,-8(5) Load to memory the address and result value
128: LD 1,-9(5) 
129: ST 1,0(0) 
130: ST 1,-7(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
131: LD 0,-6(5) Value of i
132: ST 0,-9(5) 
* --- Operation Expression ---
133: LD 0,-4(5) Value of high
134: ST 0,-11(5) 
* Loading Constant 1 to register 0 and save to memory with offset 12
135: LDC 0,1(0) 
136: ST 0,-12(5) 
* Save the result of the operation expression to the address offset 10
137: LD 0,-11(5) Load Left hand side
138: LD 1,-12(5) Load Right hand side
139: SUB 0,0,1 Operation
140: ST 0,-10(5) Store value of expression
* --- Operation Expression ---
* Save the result of the operation expression to the address offset 8
141: LD 0,-9(5) Load Left hand side
142: LD 1,-10(5) Load Right hand side
143: SUB 0,0,1 Subtract for Comparison
144: JLT 0,2(7) Jump to next instruction if true
145: LDC 0,0(0) Load 0 (false)
146: LDA 7,1(7) Unconditional Jump
147: LDC 0,1(0) Load 1 (true)
148: ST 0,-8(5) Store value of expression
* --- Operation Expression ---
* Making Space for variable (t)
* --- Assignment Expression ---
151: LDA 0,-5(5) Load address for var (k)
152: ST 0,-10(5) &k
* --- Calling minloc() ---
* Offset: 11
* Adding argument 1
153: LDA 0,-2(5) Address of a
154: LD 0,0(0) Derefence the pointer to the address of a
155: ST 0,-12(5) 
156: ST 0,-12(5) Storing argument
* Adding argument 2
157: LD 0,-6(5) Value of i
158: ST 0,-12(5) 
159: ST 0,-13(5) Storing argument
* Adding argument 3
160: LD 0,-4(5) Value of high
161: ST 0,-12(5) 
162: ST 0,-14(5) Storing argument
* Create new activation record
163: ST 5,-11(5) Save address of current frame pointer to memory with offset 11
164: LDA 5,-11(5) Load the frame pointer so that it starts at offset 11
165: LDA 0,1(7) Save the return address in the accumulator
166: LDA 7,-155(7) Jump to minloc()
167: LD 5,0(5) Pop the frame and return to the current frame
168: ST 0,-11(5) Store return value
* --- Calling minloc() ---
* Store back the result of the assignment operation
169: LD 0,-10(5) Load to memory the address and result value
170: LD 1,-11(5) 
171: ST 1,0(0) 
172: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
173: LDA 0,-7(5) Load address for var (t)
174: ST 0,-10(5) &t
175: LD 0,-5(5) Value of k
176: ST 0,-12(5) 
* Load index calculated at offset 12 and base address of array a[] and save it to offset 11
177: LDA 0,-2(5) Load address to register
178: LD 1,-12(5) Load index value to register
179: SUB 0,0,1 Substract the offset to the address
180: LD 0,0(0) Load the value at the a[index] address to the AC
181: ST 0,-11(5) Value of a[index]
* Store back the result of the assignment operation
182: LD 0,-10(5) Load to memory the address and result value
183: LD 1,-11(5) 
184: ST 1,0(0) 
185: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
186: LD 0,-5(5) Value of k
187: ST 0,-11(5) 
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
188: LDA 0,-2(5) Load address to register
189: LD 1,-11(5) Load index value to register
190: SUB 0,0,1 Substract the offset to the address
191: ST 0,-10(5) Store the address given the index at offset 10
192: LD 0,-6(5) Value of i
193: ST 0,-12(5) 
* Load index calculated at offset 12 and base address of array a[] and save it to offset 11
194: LDA 0,-2(5) Load address to register
195: LD 1,-12(5) Load index value to register
196: SUB 0,0,1 Substract the offset to the address
197: LD 0,0(0) Load the value at the a[index] address to the AC
198: ST 0,-11(5) Value of a[index]
* Store back the result of the assignment operation
199: LD 0,-10(5) Load to memory the address and result value
200: LD 1,-11(5) 
201: ST 1,0(0) 
202: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 9
* Adding argument 1
203: LD 0,-5(5) Value of k
204: ST 0,-11(5) 
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
205: LDA 0,-2(5) Load address to register
206: LD 1,-11(5) Load index value to register
207: SUB 0,0,1 Substract the offset to the address
208: LD 0,0(0) Load the value at the a[index] address to the AC
209: ST 0,-10(5) Value of a[index]
210: ST 0,-10(5) Storing argument
* Create new activation record
211: ST 5,-9(5) Save address of current frame pointer to memory with offset 20
212: LDA 5,-9(5) Load the frame pointer so that it starts at offset 9
213: LDA 0,1(7) Save the return address in the accumulator
214: LDA 7,-208(7) Jump to output()
215: LD 5,0(5) Pop the frame and return to the current frame
216: ST 0,-9(5) Store return value
* --- Calling output() ---
* --- Calling output() ---
* Offset: 9
* Adding argument 1
217: LD 0,-6(5) Value of i
218: ST 0,-10(5) 
219: ST 0,-10(5) Storing argument
* Create new activation record
220: ST 5,-9(5) Save address of current frame pointer to memory with offset 29
221: LDA 5,-9(5) Load the frame pointer so that it starts at offset 9
222: LDA 0,1(7) Save the return address in the accumulator
223: LDA 7,-217(7) Jump to output()
224: LD 5,0(5) Pop the frame and return to the current frame
225: ST 0,-9(5) Store return value
* --- Calling output() ---
* --- Calling output() ---
* Offset: 9
* Adding argument 1
226: LD 0,-6(5) Value of i
227: ST 0,-10(5) 
228: ST 0,-10(5) Storing argument
* Create new activation record
229: ST 5,-9(5) Save address of current frame pointer to memory with offset 38
230: LDA 5,-9(5) Load the frame pointer so that it starts at offset 9
231: LDA 0,1(7) Save the return address in the accumulator
232: LDA 7,-226(7) Jump to output()
233: LD 5,0(5) Pop the frame and return to the current frame
234: ST 0,-9(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
235: LD 0,-6(5) Value of i
236: ST 0,-11(5) 
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
237: LDA 0,-2(5) Load address to register
238: LD 1,-11(5) Load index value to register
239: SUB 0,0,1 Substract the offset to the address
240: ST 0,-10(5) Store the address given the index at offset 10
241: LD 0,-7(5) Value of t
242: ST 0,-11(5) 
* Store back the result of the assignment operation
243: LD 0,-10(5) Load to memory the address and result value
244: LD 1,-11(5) 
245: ST 1,0(0) 
246: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
* --- Calling output() ---
* Offset: 9
* Adding argument 1
247: LD 0,-6(5) Value of i
248: ST 0,-11(5) 
* Load index calculated at offset 11 and base address of array a[] and save it to offset 10
249: LDA 0,-2(5) Load address to register
250: LD 1,-11(5) Load index value to register
251: SUB 0,0,1 Substract the offset to the address
252: LD 0,0(0) Load the value at the a[index] address to the AC
253: ST 0,-10(5) Value of a[index]
254: ST 0,-10(5) Storing argument
* Create new activation record
255: ST 5,-9(5) Save address of current frame pointer to memory with offset 47
256: LDA 5,-9(5) Load the frame pointer so that it starts at offset 9
257: LDA 0,1(7) Save the return address in the accumulator
258: LDA 7,-252(7) Jump to output()
259: LD 5,0(5) Pop the frame and return to the current frame
260: ST 0,-9(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
261: LDA 0,-6(5) Load address for var (i)
262: ST 0,-10(5) &i
* --- Operation Expression ---
263: LD 0,-6(5) Value of i
264: ST 0,-12(5) 
* Loading Constant 1 to register 0 and save to memory with offset 13
265: LDC 0,1(0) 
266: ST 0,-13(5) 
* Save the result of the operation expression to the address offset 11
267: LD 0,-12(5) Load Left hand side
268: LD 1,-13(5) Load Right hand side
269: ADD 0,0,1 Operation
270: ST 0,-11(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
271: LD 0,-10(5) Load to memory the address and result value
272: LD 1,-11(5) 
273: ST 1,0(0) 
274: ST 1,-9(5) Value Stored!
* --- Assignment Expression ---
275: LDA 7,-143(7) Jump to test after body
* Load the test value to register 0
149: LD 0,-8(5) Load test value
150: JLE 0,125(7) Jump to end if test <= 0 (false)
276: LD 7,-1(5) Return to caller
* --- Function Declaration (sort) ---
* --- Function Declaration (main) ---
277: ST 0,-1(5) Store return
* Making Space for variable (i)
* --- Assignment Expression ---
278: LDA 0,-2(5) Load address for var (i)
279: ST 0,-4(5) &i
* Loading Constant 0 to register 0 and save to memory with offset 5
280: LDC 0,0(0) 
281: ST 0,-5(5) 
* Store back the result of the assignment operation
282: LD 0,-4(5) Load to memory the address and result value
283: LD 1,-5(5) 
284: ST 1,0(0) 
285: ST 1,-3(5) Value Stored!
* --- Assignment Expression ---
* --- While Expression ---
* --- Operation Expression ---
286: LD 0,-2(5) Value of i
287: ST 0,-5(5) 
* Loading Constant 10 to register 0 and save to memory with offset 6
288: LDC 0,10(0) 
289: ST 0,-6(5) 
* Save the result of the operation expression to the address offset 4
290: LD 0,-5(5) Load Left hand side
291: LD 1,-6(5) Load Right hand side
292: SUB 0,0,1 Subtract for Comparison
293: JLT 0,2(7) Jump to next instruction if true
294: LDC 0,0(0) Load 0 (false)
295: LDA 7,1(7) Unconditional Jump
296: LDC 0,1(0) Load 1 (true)
297: ST 0,-4(5) Store value of expression
* --- Operation Expression ---
* --- Assignment Expression ---
300: LD 0,-2(5) Value of i
301: ST 0,-7(5) 
* Load index calculated at offset 7 and base address of array x[] and save it to offset 6
302: LDA 0,0(6) Load address to register
303: LD 1,-7(5) Load index value to register
304: SUB 0,0,1 Substract the offset to the address
305: ST 0,-6(5) Store the address given the index at offset 6
* --- Calling input() ---
* Offset: 7
* Create new activation record
306: ST 5,-7(5) Save address of current frame pointer to memory with offset 7
307: LDA 5,-7(5) Load the frame pointer so that it starts at offset 7
308: LDA 0,1(7) Save the return address in the accumulator
309: LDA 7,-306(7) Jump to input()
310: LD 5,0(5) Pop the frame and return to the current frame
311: ST 0,-7(5) Store return value
* --- Calling input() ---
* Store back the result of the assignment operation
312: LD 0,-6(5) Load to memory the address and result value
313: LD 1,-7(5) 
314: ST 1,0(0) 
315: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
* --- Assignment Expression ---
316: LDA 0,-2(5) Load address for var (i)
317: ST 0,-6(5) &i
* --- Operation Expression ---
318: LD 0,-2(5) Value of i
319: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
320: LDC 0,1(0) 
321: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
322: LD 0,-8(5) Load Left hand side
323: LD 1,-9(5) Load Right hand side
324: ADD 0,0,1 Operation
325: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
326: LD 0,-6(5) Load to memory the address and result value
327: LD 1,-7(5) 
328: ST 1,0(0) 
329: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
330: LDA 7,-43(7) Jump to test after body
* Load the test value to register 0
298: LD 0,-4(5) Load test value
299: JLE 0,31(7) Jump to end if test <= 0 (false)
* --- Calling sort() ---
* Offset: 3
* Adding argument 1
331: LDA 0,0(6) Address of x
332: LD 0,0(0) Derefence the pointer to the address of x
333: ST 0,-4(6) 
334: ST 0,-4(5) Storing argument
* Adding argument 2
* Loading Constant 0 to register 0 and save to memory with offset 4
335: LDC 0,0(0) 
336: ST 0,-4(5) 
337: ST 0,-5(5) Storing argument
* Adding argument 3
* Loading Constant 10 to register 0 and save to memory with offset 4
338: LDC 0,10(0) 
339: ST 0,-4(5) 
340: ST 0,-6(5) Storing argument
* Create new activation record
341: ST 5,-3(5) Save address of current frame pointer to memory with offset 10
342: LDA 5,-3(5) Load the frame pointer so that it starts at offset 3
343: LDA 0,1(7) Save the return address in the accumulator
344: LDA 7,-223(7) Jump to sort()
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
370: ST 0,-7(5) 
* Load index calculated at offset 7 and base address of array x[] and save it to offset 6
371: LDA 0,0(6) Load address to register
372: LD 1,-7(5) Load index value to register
373: SUB 0,0,1 Substract the offset to the address
374: LD 0,0(0) Load the value at the x[index] address to the AC
375: ST 0,-6(6) Value of x[index]
376: ST 0,-6(5) Storing argument
* Create new activation record
377: ST 5,-5(5) Save address of current frame pointer to memory with offset 15
378: LDA 5,-5(5) Load the frame pointer so that it starts at offset 5
379: LDA 0,1(7) Save the return address in the accumulator
380: LDA 7,-374(7) Jump to output()
381: LD 5,0(5) Pop the frame and return to the current frame
382: ST 0,-5(5) Store return value
* --- Calling output() ---
* --- Assignment Expression ---
383: LDA 0,-2(5) Load address for var (i)
384: ST 0,-6(5) &i
* --- Operation Expression ---
385: LD 0,-2(5) Value of i
386: ST 0,-8(5) 
* Loading Constant 1 to register 0 and save to memory with offset 9
387: LDC 0,1(0) 
388: ST 0,-9(5) 
* Save the result of the operation expression to the address offset 7
389: LD 0,-8(5) Load Left hand side
390: LD 1,-9(5) Load Right hand side
391: ADD 0,0,1 Operation
392: ST 0,-7(5) Store value of expression
* --- Operation Expression ---
* Store back the result of the assignment operation
393: LD 0,-6(5) Load to memory the address and result value
394: LD 1,-7(5) 
395: ST 1,0(0) 
396: ST 1,-5(5) Value Stored!
* --- Assignment Expression ---
397: LDA 7,-41(7) Jump to test after body
* Load the test value to register 0
367: LD 0,-4(5) Load test value
368: JLE 0,29(7) Jump to end if test <= 0 (false)
398: LD 7,-1(5) Return to caller
* --- Function Declaration (main) ---
11: LDA 7,387(7) Jump around function bodies
* --- Final ---
399: ST 5,-10(5) Original Pointer
400: LDA 5,-10(5) Push Main Frame Pointer
401: LDA 0,1(7) Load Accumulator with return pointer
402: LDA 7,-126(7) Jump to Location
403: LD 5,0(5) Pop Main Frame
404: HALT 0,0,0 Exit
* --- Final ---
