	.module assign55.c
	.area text
	.dbfile M:\SYSC20~2\Assignments\ASSIGN~4\PART5~1\assign55.c
	.dbfunc e main _main fI
_main::
	.dbline -1
	.dbline 9
; // By Korey Conway and Tanzeel Rana
; 
; // This has not been done yet. We might try submitting something to the Prof directly
; 
; #include <hcs12dp256.h>
; #include <stdio.h>
; 
; int main()
; {
	.dbline 10
; 	return 0;
	ldd #0
	.dbline -2
L3:
	.dbline 0 ; func end
	rts
	.dbend
