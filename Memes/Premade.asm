Include valid.inc

.data

pickCaption BYTE "Please choose captions from the following list",0



captionList BYTE "Partner:                             ",0Ah,0
			BYTE "Nick Lewis:                          ",0Ah,0
			BYTE "Student: I'VE HAD ENOUGH!!!          ",0Ah,0
			BYTE "Me: Hey you do the lab               ",0Ah,0
			BYTE "Dr.Silaghi and me looking at my error",0Ah,0 ;5
			BYTE "Dr.Silaghi: The lab isn't that hard  ",0Ah,0
			BYTE "The Lab:                             ",0Ah,0
			BYTE "Guy with 4.0: DONE! GGEZ LOL         ",0Ah,0
			BYTE "The rest of the class:               ",0Ah,0
			BYTE "Partner: Sorry can't lol, this wifi  ",0Ah,0


captionSize BYTE 26h
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
	call ReadInt
	mov ebx, eax

	; Prompt choice of captions
	mov edx, OFFSET  pickCaption
	call WriteString
	call Crlf

	; Print Captions
	mov esi, 0
	mov ecx, DWORD PTR captionListLength

	PrintCaption:
		mov ebx, DWORD PTR (captionSize * esi)
		mov edx, DWORD PTR captionList[ebx]
		call WriteString
		call Crlf
		inc esi
		loop PrintCaption

	; Save Choice in eax with validation
	INVOKE selectCaption, ADDR promptBad
	mov DWORD PTR firstCaption, eax

	INVOKE selectCaption, ADDR promptBad
	mov DWORD PTR secondCaption, eax


	; Print MEME
	t1: ;Template 1
	call Clrscr
	mov edx, OFFSET (captionList[captionSize * firstCaption])
	call WriteString
	call Crlf

	mov edx, OFFSET (captionList[captionSize * secondCaption])
	call WriteString
	call Crlf

	mov edx, OFFSET picOne
	call WriteString
	call Crlf

	call WaitMsg
	call Crlf

	popad 
	ret
Premade endp
end