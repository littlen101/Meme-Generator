;
;	>>> Simple picture display in assembler <<<
;
;	2011-09-16 by JAC! 


	org $2000

start	mwa #dl $230		;Set DL points
	mva #$34 708		;Set 3 colors
	mva #$38 709
	mva #$0e 710
	jmp *

dl	.local
dc	= $0e			;Antic mode E/graphics 15
	
	.byte $70,$70,$70	;3*8=24 blank lines in PAL

	.byte $40+dc		;LMS instruction for upper half
	.word picture
:95	.byte dc		;1+95=96 lines, 40 bytes each

	.byte $40+dc		;LMS instruction for upper half
	.word picture+$f00	;Will be at 4k boundary
:95	.byte dc		;1+95=96 lines, 40 bytes each

	.byte $41		;Restart with vertical blank
	.word dl
	.endl

	;Picture has $1e00 bytes, $f00 for the upper half, $f00 for the lower half
	;In order to prevent ANTIC from cross a 4k boundary, we chose the base address
	;in a way that the upper half is in the first 4k, and the lower half in 2nd 4k.
 
	org $2100
picture	ins "SpaceHarrier.pic"