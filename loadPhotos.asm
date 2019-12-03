.386
.model flat, STDCALL
INCLUDE valid.inc

.data

picOne BYTE  "  (> ” ” < )", 13, 10
picOne2 BYTE "  (= 'o' = )", 13, 10
picOne3 BYTE "-(, , )-(, , )-", 0

picTwo BYTE "--.. | ::::::::, -': : : : : : : : - -~''''¯¯''-„: : : : : :\",13,10
picTwo1 BYTE "--.. | :::::::: | : : : : : : : : : _„„--~'''''~-„: : : : : ' |", 13, 10
picTwo2 BYTE "--..'|:::::::,' : : : : : : : _„„ - : : : : : : : : ~--„_ : | '", 13, 10
picTwo3 BYTE "--- | :::::: | : : : „--~~'''~~''''''''-„…_..„~''''''''''''¯¯|", 13, 10
picTwo4 BYTE "--- | :::: : , ':_„„-|: : :_„---~: : :|''¯¯''''|: ~---„_: |", 13, 10
picTwo5 BYTE "--.., ~- , _ / '' : : : | : _ o__): : | : : : : | _o__): \.. |", 13, 10
picTwo6 BYTE "--.. / , '-,: : : : : ''-,_______,-'': : : : ''-„______\",13,10
picTwo7 BYTE "--..\: : | : : : : : : : : : : : : : : „ : : : : : -, : : : : : : \",13,10
picTwo8 BYTE "---',:': : : : : : : : : : : : : , -'__: : : :_', : : : : , '", 13, 10
picTwo9 BYTE "---.'-,-': : : : : : ___„ - : : : '' : : ¯''~~'' : ': : ~--|", 13, 10
picTwo10 BYTE "----. | : , : : : : : : : : : : : : : : : : : : : : : : |", 13, 10
picTwo11 BYTE "----.'|: \: : : : : : : : -,„_„„-~~--~--„_: : : |", 13, 10
picTwo12 BYTE "----.. | : \ : : : : : : : : : : : : ------ - ~: : : : : |", 0

picThree BYTE "        ___------__", 13, 10
picThree1 BYTE "       ___------__", 13, 10
picThree2 BYTE " |\__-- /\       _-", 13, 10
picThree3 BYTE " |/    __      -", 13, 10
picThree4 BYTE " //\  /  \    /__", 13, 10
picThree5 BYTE " |  o|  0|__     --_", 13, 10
picThree6 BYTE " \\____-- __ \   ___-", 13, 10
picThree7 BYTE " (@@    __/  / /_", 13, 10
picThree8 BYTE "    -_____---   --_", 13, 10
picThree9 BYTE "     //  \ \\   ___-", 13, 10
picThree10 BYTE "   //|\__/  \\  \",13,10
picThree11 BYTE "   \_-\_____/  \-\",13,10
picThree12 BYTE "        // \\--\|  ", 13, 10
picThree13 BYTE "   ____//  ||_", 0

num1 BYTE "1: ", 13, 10, 0
num2 BYTE "2: ", 13, 10, 0
num3 BYTE "3: ", 13, 10, 0
num4 BYTE "4: ", 13, 10, 0


topIn BYTE 51 DUP(? )
botIn BYTE 51 DUP(? )


.code


printSingle PROC,
pNum:DWORD
	

	pushad
	cmp pNum, 1
	je p1
	cmp pNum, 2
	je p2
	cmp pNum, 3
	je p3
	jmp bottom


	p1:
		mov edx, OFFSET picOne
		
		jmp bottom
	p2:
		mov edx, OFFSET picTwo
		
		jmp bottom
	p3:
		mov edx, OFFSET picThree
		
		jmp bottom





		bottom:
		call WriteString


	popad
	ret
	printSingle ENDP



printAll PROC
pushad

	mov edx, OFFSET num1
	mov eax, lightGreen
	call SetTextColor
	call WriteString
	mov eax,white
	call SetTextColor
	mov edx, OFFSET picOne
	call WriteString
	call CrlF

	mov edx,OFFSET num2
	mov eax, lightGreen
	call SetTextColor
	call WriteString
	mov edx,OFFSET picTwo
	mov eax, white
	call SetTextColor
	call WriteString
	call CrlF

	
	mov edx, OFFSET num3
	mov eax, lightGreen
	call SetTextColor
	call WriteString
	mov edx,OFFSET picThree
	mov eax, white
	call SetTextColor
	call WriteString
	call CrlF


	






	popad 
	ret
printAll endp

END