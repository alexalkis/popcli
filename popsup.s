************************************************************************
*   HandlerInterface()
*
*   This code is needed to convert the calling sequence performed by
*   the input.task for the input stream management into something
*   that a C program can understand.
*
*   This routine expects a pointer to an InputEvent in A0, a pointer
*   to a data area in A1.  These values are transferred to the stack
*   in the order that a C program would need to find them.  Since the
*   actual handler is written in C, this works out fine. 
*
*   Author: Rob Peck, 12/1/85

                        .macro SYS function loadFrom
                        .ifnc   "\loadFrom",""
                        move.l  \loadFrom,a6
                        .endif
                        jsr     (_LVO\function).W(a6)
                        .endm

	

	
	.global mystart
mystart:
	move.l  d0,-(sp)
	move.l	a0,-(sp)
        move.l  0x04.w,a6
        move.l  a6,_SysBase
        lea.l   _dosname,a1
        moveq   #33,d0          | 33 is for dos >=kickstart1.2
        SYS     OpenLibrary
        move.l  d0,_DOSBase
        jeq     .nodos
|	lea.l	_utilname,a1
|	moveq	#0,d0
|	SYS	OpenLibrary
|	move.l	d0,___UtilityBase
|	jeq	.nodos
	jsr	__main
.nodos:	addq.l	#8,sp
	rts
	
	.text
	.even
	.global	_HandlerInterface
_HandlerInterface:
	movem.L	A0/A1,-(A7)
	jsr	_myhandler
	addq.L	#8,A7
	rts


	.global __Backstdout
	.global _SysBase
	.global _DOSBase
	.global _stdout
|	.global ___UtilityBase
	.data
	.even
__Backstdout:	.long 0
_stdout:	.long 0
_SysBase:	.long 0
_DOSBase:	.long 0
| ___UtilityBase:	.long 0
_dosname:       .asciz "dos.library"
	.even
|_utilname:       .asciz "utility.library"
|	.even	


_LVORawDoFmt    = -522	
	.text
	.even
	.global _mysprintf
_mysprintf:
        movem.l a2-a3/a6,-(sp)

        move.l  4*4(sp),a3
        move.l  5*4(sp),a0
        lea     6*4(sp),a1
        lea.l   stuffChar(pc),a2
        move.l  _SysBase,a6
        jsr     _LVORawDoFmt(a6)
        movem.l (sp)+,a2/a3/a6
        rts

stuffChar:
	moveb  d0,(a3)+
        rts

	
