INCLUDE valid.inc



.code


custom PROC,
topText : PTR BYTE,
	bottomText : PTR BYTE

	pushad
	

	mov edx, topText
	call WriteString
	mov edx, OFFSET topIn
	mov ecx, 30
	call ReadString

	mov edx, bottomText
	call WriteString
	mov edx, OFFSET botIn
	mov ecx, 30
	call ReadString


	call Clrscr;				PRINT MEME
	mov edx, OFFSET topIn
	
	call WriteString
	call Crlf
	mov edx, OFFSET picOne
	
	call WriteString
	call Crlf
	mov edx, OFFSET botIn
	
	call WriteString
	
	call Crlf
	call WaitMsg
	call Crlf

popad
ret
custom endp


END