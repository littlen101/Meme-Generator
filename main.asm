.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

INCLUDE valid.inc
.data

idNum dword ?
startup BYTE "Welcome to the meme creator", 13, 10, "You can choose between random generation(1), use premade templates(2), or create your own(3) (or 99 to exit)", 0
inPrompt BYTE "Please select a creation mode (1-3): ", 0
promptBad BYTE "Invalid input, please enter again: ", 0
capSel BYTE "Select a caption:", 0
picSel BYTE "Select a picture (1-#):", 0
topText BYTE "Enter the top text of your meme: ",0
bottomText BYTE "Enter the bottom text of your meme: ",0


 


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
;some code
jmp promptAgain
mode3:
	INVOKE printAll
	INVOKE selectP, ADDR picSel, ADDR promptBad
	INVOKE custom, ADDR topText, ADDR bottomText
;some code
jmp promptAgain


finish:


exit
main endp
end main


