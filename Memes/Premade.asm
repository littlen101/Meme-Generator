Include valid.inc

.data

pickCaption BYTE "Please choose captions from the following list",0



captionList BYTE "#0 Partner:                             ",0Ah,0
			BYTE "#1 Nick Lewis:                          ",0Ah,0 
			BYTE "#2 Student: I'VE HAD ENOUGH!!!          ",0Ah,0
			BYTE "#3 Me: Hey, you do the lab?             ",0Ah,0
			BYTE "#4 Dr.Silaghi and me looking at my error",0Ah,0 ;5
			BYTE "#5 Dr.Silaghi: The lab isn't that hard  ",0Ah,0
			BYTE "#6 The Lab:                             ",0Ah,0
			BYTE "#7 Guy with 4.0: DONE! GGEZ LOL         ",0Ah,0
			BYTE "#8 The rest of the class:               ",0Ah,0
			BYTE "#9 Partner: Sorry can't lol, this wifi  ",0Ah,0

buff = 3
captionSize BYTE 2Ah
captionListLength BYTE 10
captionAddress DWORD ?
firstCaption BYTE ?
firstAddress DWORD ?
secondCaption BYTE ?
secondAddress DWORD ?


.code
premade PROC,
	chooseTemplate : PTR BYTE,
	promptBad : PTR BYTE,
	
	pushad

	; Prompt User to choose a template for their meme
	mov edx, chooseTemplate
	call WriteString
	call Crlf

	; Save Choice in ebx for later template use
	INVOKE selectTemplate, promptBad
	mov ebx, eax

	; Prompt choice of captions
	mov edx, OFFSET  pickCaption
	call WriteString
	call Crlf

	; Print Captions
	mov esi, 0
	mov ecx, DWORD PTR captionListLength

	PrintCaption:
		movzx eax, captionSize
		mul esi
		lea edx, captionList[eax]
		call WriteString
		call Crlf
		inc esi
		loop PrintCaption

	; Save Choice in eax with validation
	INVOKE selectCaption, promptBad
	mov DWORD PTR firstCaption, eax

	INVOKE selectCaption, promptBad
	mov DWORD PTR secondCaption, eax

	cmp ebx,3
	je t3
	cmp ebx,2
	je t2

	; Print MEME
	t1: ;Template 1
	call Clrscr
	movzx eax,captionSize
	movzx ebx, firstCaption
	mul ebx
	lea edx, captionList[eax + buff]
	call WriteString
	call Crlf

	movzx eax,captionSize
	movzx ebx,secondCaption
	mul ebx
	lea edx, captionList[eax + buff]
	call WriteString
	call Crlf

	mov edx, OFFSET picOne
	call WriteString
	call Crlf

	call WaitMsg
	call Crlf

	jmp return

	t2: ;Template 2
	call Clrscr
	movzx eax,captionSize
	movzx ebx, firstCaption
	mul ebx
	lea edx, captionList[eax + buff]
	call WriteString
	call Crlf

	mov edx, OFFSET picOne
	call WriteString
	call Crlf


	movzx eax,captionSize
	movzx ebx,secondCaption
	mul ebx
	lea edx, captionList[eax + buff]
	call WriteString
	call Crlf

	jmp return

	t3: ;Template 3
	call Clrscr
	mov edx, OFFSET picOne
	call WriteString
	call Crlf

	movzx eax,captionSize
	movzx ebx, firstCaption
	mul ebx
	lea edx, captionList[eax + buff]
	call WriteString
	call Crlf

	movzx eax,captionSize
	movzx ebx,secondCaption
	mul ebx
	lea edx, captionList[eax + buff]
	call WriteString
	call Crlf
	

	call WaitMsg
	call Crlf

	return:
	popad 
	ret
Premade endp
end