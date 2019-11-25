INCLUDE valid.inc


.data




.code

selectCaption PROC,
ptrSelect:PTR BYTE,ptrInvalidC : PTR BYTE

	push ecx
	push esi
	push edx
	mov edx,ptrSelect
	call WriteString
	
	

	readC : call ReadDec
	CMP eax, 10; Max number of inputs
	ja badInputC
	CMP eax, 0; Minimum number of inputs
	jbe badInputC
	jno goodInputC
	badInputC :
mov edx, ptrInvalidC
call WriteString
jmp  readC
goodInputC :


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
	CMP eax,99
	je goodInput
	CMP eax, 3; Max number of inputs
	ja badInput
	CMP eax, 0; Minimum number of inputs +1
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
	jbe badInputP
	jno goodInputP

	badInputP :
mov edx, ptrInvalidP
call WriteString
jmp  readP

goodInputP:

	pop edx
	pop esi
	pop ecx
	ret
	selectP endp


END