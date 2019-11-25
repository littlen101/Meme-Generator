INCLUDE Irvine32.inc
selectP PROTO,ptrPic:PTR BYTE,ptrInvalidP:PTR BYTE

EXTERNDEF picOne:BYTE ;Copy this for all Pictures





EXTERNDEF firstIn:BYTE
EXTERNDEF secondIn:BYTE

premade PROTO,
chooseTemplate : PTR BYTE,
promptBad : PTR BYTE,


custom PROTO,
firstText:PTR BYTE,
secondText : PTR BYTE

selectCaption PROTO,ptrInvalidC:PTR BYTE
promptMode PROTO,
ptrPrompt:PTR BYTE,ptrInvalid:PTR BYTE