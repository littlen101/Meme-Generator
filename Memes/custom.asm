INCLUDE valid.inc



.code


custom PROC,
	firstText : PTR BYTE,
	secondText : PTR BYTE

	pushad
	

	mov edx, firstText
	call WriteString
	mov edx, OFFSET firstIn
	mov ecx, 30
	call ReadString

	mov edx, secondText
	call WriteString
	mov edx, OFFSET secondIn
	mov ecx, 30
	call ReadString


	call Clrscr;				PRINT MEME  Expand to include different templates
	mov edx, OFFSET firstIn
	call WriteString
	call Crlf

	mov edx, OFFSET secondIn
	call WriteString
	call Crlf

	mov edx, OFFSET memeList
	call WriteString
	call Crlf

	

	call WaitMsg
	call Crlf

popad
ret
custom endp


END