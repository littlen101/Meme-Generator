.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

INCLUDE valid.inc
.data

idNum dword ?
startup BYTE "Welcome to the meme creator\nYou can choose between random generation(1), use premade templates(2), or create your own(3)\n",0
inPrompt BYTE "Please select a creation mode (1-3).", 0
promptBad BYTE "Invalid input, please enter again", 0
capSel BYTE "Select a caption:",0

.code
main proc
mov edx, OFFSET startup
call WriteString



INVOKE promptMode, inPrompt, ADDR promptBad
INVOKE selectCaption, ADDR capSel
mov idNum,eax
call WriteDec


exit
main endp
end main


