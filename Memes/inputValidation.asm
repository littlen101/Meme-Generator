INCLUDE valid.inc


.data




.code

selectCaption PROC,ptrInvalidC : PTR BYTE

	push ecx
	push esi
	push edx

readC : call ReadInt
	CMP eax, 10; Max number of inputs
	jae badInputC
	CMP eax, 0; Minimum number of inputs
	jb badInputC
goodInputC :
	pop edx
	pop esi
	pop ecx
	ret
badInputC :
	mov edx, ptrInvalidC
	call WriteString
	jmp  readC

selectCaption endp

selectTemplate PROC,invalidT : PTR BYTE

	push ecx
	push esi
	push edx

readT: call ReadInt
	CMP eax, 4; Max number of inputs
	jae badInputT
	CMP eax, 1; Minimum number of inputs
	jb badInputT
goodInputT :
	pop edx
	pop esi
	pop ecx
	ret
badInputT :
	mov edx, invalidT
	call WriteString
	jmp  readT

selectTemplate endp


promptMode PROC,
ptrPrompt:PTR BYTE,
ptrInvalid:PTR BYTE

	push ecx
	push esi
	push edx


mov edx, ptrPrompt
call WriteString

read : call ReadInt
	CMP eax,99
	je goodInput
	CMP eax, 3; Max number of inputs
	ja badInput
	CMP eax, 0; Minimum number of inputs +1
	jbe badInput
goodInput :
	pop edx
	pop esi
	pop ecx
	ret
badInput :
	mov edx,ptrInvalid
	call WriteString
	jmp  read
promptMode endp




selectP PROC, ; Select Photo
	ptrPic : PTR BYTE,
	ptrInvalidP : PTR BYTE

	push ecx
	push esi
	push edx

	mov edx, ptrPic
	call WriteString
	
	readP : call ReadInt

	CMP eax, 10; Max number of inputs
	ja badInputP
	CMP eax, 0; Minimum number of inputs
	jb badInputP

goodInputP:
	pop edx
	pop esi
	pop ecx
	ret
badInputP :
	mov edx, ptrInvalidP
	call WriteString
	jmp  readP
selectP endp


END