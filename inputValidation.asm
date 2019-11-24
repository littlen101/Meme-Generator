INCLUDE valid.inc






.code

selectCaption PROC,
ptrSelect:PTR BYTE,

	push ecx
	push esi
	push edx
	mov edx,ptrSelect
	call WriteString
	call ReadInt
	call WriteDec

	pop edx
	pop esi
	pop ecx
	ret
selectCaption endp




promptMode PROC,
ptrPrompt:PTR BYTE,
ptrInvalid:PTR BYTE

	push ecx
	push esi
	push edx


mov edx, ptrPrompt
call WriteString

read : call ReadInt

	CMP eax, 3; Max number of inputs
	ja badInput
	CMP eax, 0; Minimum number of inputs
	jbe badInput
	jno goodInput

	badInput :
	mov edx,ptrInvalid
	call WriteString
	jmp  read

goodInput :
pop edx
pop esi
pop ecx
ret
promptMode endp
END