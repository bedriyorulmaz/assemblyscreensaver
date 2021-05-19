		;this code is without pixel swap
		;it will display the image in the middle of LCD
		;but with blueish colors
		;see if you can modify it to swap B and R color components
		;and fix the colors of the displayed image
		AREA	demo, CODE, READONLY
		EXPORT	__main
		IMPORT  image
		ENTRY
__main	PROC
		movs    r5,#0
		movs    r6,#0
imagedraw
		movs 	r1,#0
		movs 	r2,#0
		movs 	r3,#0
		movs 	r4,#0
		ldr		r1, =0x40010000
		ldr     r2, =image
		
		movs    r3, r5        ;row counter
nr		str     r3, [r1]       ;store row to row register
		movs    r4, r6       ;col counter
nc		str     r4, [r1, #0x4] ;store col to col register  
		ldr     r0, [r2]       ;load the next pixel from image	
		adds    r2, r2, #4     ;point to the next pixel in the image
		str     r0, [r1, #0x8] ;store the pixel to pixel register
		adds    r4, r4, #1     ;increment the col counter
		movs    r7,r6
		adds    r7,r7,#80
		cmp     r4,r7       ;check if we reached end of row
		bne     nc
		movs    r7,#0
		adds    r3, r3, #1     ;increment the row counter
		movs	r7,r5
		adds	r7,r7,#60
		cmp     r3, r7     ;check if we reached end of image
		bne     nr
		movs    r2, #1
		str     r2, [r1, #0xc] ;refresh screen
		movs    r2, #2
		str     r2, [r1, #0xc];clear screen
		
		
plusplus		
		cmp     r5,#180  ;check if the bottom base of the picture has reached the limit
		bne		plusplus1
		beq    	subplus;If it has, move on to the next stage

plusplus1
		cmp     r6,#240 ;If the right base reaches before the bottom base reaches, the picture is shifted diagonally to the left.
		beq		plussub
		movs    r7,#0
		adds	r6,r6,#20
		adds    r5,r5,#20
		b		imagedraw



imagedraw1
		movs 	r1,#0
		movs 	r2,#0
		movs 	r3,#0
		movs 	r4,#0
		ldr		r1, =0x40010000
		ldr     r2, =image
		
		movs    r3, r5        ;row counter
nr1		str     r3, [r1]       ;store row to row register
		movs    r4, r6       ;col counter
nc1		str     r4, [r1, #0x4] ;store col to col register  
		ldr     r0, [r2]       ;load the next pixel from image	
		adds    r2, r2, #4     ;point to the next pixel in the image
		str     r0, [r1, #0x8] ;store the pixel to pixel register
		adds    r4, r4, #1     ;increment the col counter
		movs    r7,r6
		adds    r7,r7,#80
		cmp     r4,r7       ;check if we reached end of row
		bne     nc1
		movs    r7,#0
		adds    r3, r3, #1     ;increment the row counter
		movs	r7,r5
		adds	r7,r7,#60
		cmp     r3, r7     ;check if we reached end of image
		bne     nr1
		movs    r2, #1
		str     r2, [r1, #0xc] ;refresh screen
		movs    r2, #2
		str     r2, [r1, #0xc];clear screen
subplus	
		
		cmp		r6,#240 ;it is checked whether the right base of the picture has reached 320.
		
		bne     subplus1
		beq		subsub
subplus1
		cmp    r5,#0; if the top of the picture reaches the border before the right base, it is shifted towards the right cross
		beq    plusplus
		subs   r5,r5,#20
		adds   r6,r6,#20
		b		imagedraw1
		
imagedraw2
		movs 	r1,#0
		movs 	r2,#0
		movs 	r3,#0
		movs 	r4,#0
		ldr		r1, =0x40010000
		ldr     r2, =image
		
		movs    r3, r5        ;row counter
nr2		str     r3, [r1]       ;store row to row register
		movs    r4, r6       ;col counter
nc2		str     r4, [r1, #0x4] ;store col to col register  
		ldr     r0, [r2]       ;load the next pixel from image	
		adds    r2, r2, #4     ;point to the next pixel in the image
		str     r0, [r1, #0x8] ;store the pixel to pixel register
		adds    r4, r4, #1     ;increment the col counter
		movs    r7,r6
		adds    r7,r7,#80
		cmp     r4,r7       ;check if we reached end of row
		bne     nc2
		movs    r7,#0
		adds    r3, r3, #1     ;increment the row counter
		movs	r7,r5
		adds	r7,r7,#60
		cmp     r3, r7     ;check if we reached end of image
		bne     nr2
		movs    r2, #1
		str     r2, [r1, #0xc] ;refresh screen
		movs    r2, #2
		str     r2, [r1, #0xc]		;clear screen

subsub	
		cmp		r5,#0  ;it is checked whether the upper side of the picture reaches 0.
		bne		subsub1
		beq		plussub
subsub1
		cmp    r6 ,#0	;checked if it reaches the left side first from the top of the picture
		beq    subplus
		subs   r6,r6,#20
		subs   r5,r5,#20
		b		imagedraw2
imagedraw3
		movs 	r1,#0
		movs 	r2,#0
		movs 	r3,#0
		movs 	r4,#0
		ldr		r1, =0x40010000
		ldr     r2, =image
		
		movs    r3, r5        ;row counter
nr3		str     r3, [r1]       ;store row to row register
		movs    r4, r6       ;col counter
nc3		str     r4, [r1, #0x4] ;store col to col register  
		ldr     r0, [r2]       ;load the next pixel from image	
		adds    r2, r2, #4     ;point to the next pixel in the image
		str     r0, [r1, #0x8] ;store the pixel to pixel register
		adds    r4, r4, #1     ;increment the col counter
		movs    r7,r6
		adds    r7,r7,#80
		cmp     r4,r7       ;check if we reached end of row
		bne     nc3
		movs    r7,#0
		adds    r3, r3, #1     ;increment the row counter
		movs	r7,r5
		adds	r7,r7,#60
		cmp     r3, r7     ;check if we reached end of image
		bne     nr3
		movs    r2, #1
		str     r2, [r1, #0xc] ;refresh screen
		movs    r2, #2
		str     r2, [r1, #0xc]		;clear screen
plussub	
		cmp     r6,#0	;it is checked whether the left side of the picture is 0
		bne     plussub1
		beq		plusplus
plussub1
		cmp     r5,#180	;From the left side of the picture, first check if the bottom base has reached the limit.
		beq		subsub
		adds   r5,r5,#20
		subs   r6,r6,#20
		b		imagedraw3

stop    b       stop		
		ENDP