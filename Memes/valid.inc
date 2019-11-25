INCLUDE Irvine32.inc
selectP PROTO,ptrPic:PTR BYTE,ptrInvalidP:PTR BYTE

EXTERNDEF picOne:BYTE ;Copy this for all Pictures





EXTERNDEF botIn:BYTE
EXTERNDEF topIn:BYTE

custom PROTO,
topText:PTR BYTE,
bottomText: PTR BYTE

selectCaption PROTO,ptrSelect:PTR BYTE,ptrInvalidC:PTR BYTE
promptMode PROTO,
ptrPrompt:PTR BYTE,ptrInvalid:PTR BYTE