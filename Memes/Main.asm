INCLUDE valid.inc
.data

idNum dword ?
startup BYTE "Welcome to the meme creator", 0Dh, 0Ah,"You can choose between random generation(1), use premade templates(2), or create your own(3) (or 99 to exit)", 0
inPrompt BYTE "Please select a creation mode (1-3): ", 0
promptBad BYTE "Invalid input, please enter again: ", 0
capSel BYTE "Select a caption:", 0
picSel BYTE "Select a picture (0-10):", 0
firstText BYTE "Enter the first text of your meme: ",0
secondText BYTE "Enter the second text of your meme: ",0
firstTextChoose BYTE "Choose the first text of your meme: ",0
secondTextChoose BYTE "Choose the second text of your meme: ",0
selectTemplatePrompt BYTE "Please choose a template for your meme: #1 t,t,p  #2 t,p,t  #3 p,t,t",0

picNum dword ? 





.code
main proc



promptAgain :
	mov edx, OFFSET startup
	call WriteString
	call Crlf
	 INVOKE promptMode, ADDR inPrompt, ADDR promptBad
	; INVOKE selectCaption, ADDR capSel, ADDR promptBad
	; INVOKE selectP, ADDR picSel, ADDR promptBad
	mov idNum,eax


CMP eax, 1
je mode1
CMP eax,2
je mode2
CMP eax,3
je mode3
CMP eax,99
je finish
jmp promptAgain


mode1:
;some code
jmp promptAgain
mode2:
	INVOKE selectP, ADDR picSel, ADDR promptBad
	INVOKE premade, ADDR selectTemplatePrompt, ADDR promptBad
;some code
jmp promptAgain
mode3:
	INVOKE selectP, ADDR picSel, ADDR promptBad
	INVOKE custom, ADDR firstText, ADDR secondText
;some code
jmp promptAgain


finish:


exit
main endp
end main


