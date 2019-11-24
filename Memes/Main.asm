.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.code
main proc
	Invoke ExitProcess, 0
main endp

end main