INCLUDE Irvine32.inc


EXTERNDEF picOne:BYTE ;Copy this for all Pictures





EXTERNDEF botIn:BYTE
EXTERNDEF topIn:BYTE

custom PROTO,
topText:PTR BYTE,
bottomText: PTR BYTE

selectCaption PROTO,
promptMode PROTO,
ptrPrompt:PTR BYTE,