INCLUDE Irvine32.inc
selectP PROTO,ptrPic:PTR BYTE,ptrInvalidP:PTR BYTE

EXTERNDEF memeList:BYTE ; List of memes

EXTERNDEF captionListLength:BYTE ; Number of Captions Avaliable 





EXTERNDEF firstIn:BYTE
EXTERNDEF secondIn:BYTE

premade PROTO,
chooseTemplate : PTR BYTE,
promptBad : PTR BYTE,

selectTemplate PROTO,invalidT:PTR BYTE
custom PROTO,
firstText:PTR BYTE,
secondText : PTR BYTE

selectCaption PROTO,ptrInvalidC:PTR BYTE

promptMode PROTO,
ptrPrompt:PTR BYTE,ptrInvalid:PTR BYTE