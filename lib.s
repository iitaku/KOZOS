	.file	"lib.c"
	.h8300h
	.section .text
	.align 1
	.global _memset
_memset:
	mov.l	er6,@-er7
	mov.l	er7,er6
	mov.l	er0,er3
	bra	.L2
.L3:
	mov.b	r1l,@er3
	adds	#1,er3
	subs	#1,er2
.L2:
	mov.l	er2,er2
	bgt	.L3
	mov.l	@er7+,er6
	rts
	.size	_memset, .-_memset
	.align 1
	.global _memcpy
_memcpy:
	mov.l	er6,@-er7
	mov.l	er7,er6
	mov.l	er4,@-er7
	mov.l	er0,er4
	mov.l	er2,er0
	mov.l	er4,er3
	bra	.L7
.L8:
	mov.b	@er1+,r2l
	mov.b	r2l,@er3
	adds	#1,er3
	subs	#1,er0
.L7:
	mov.l	er0,er0
	bgt	.L8
	mov.l	er4,er0
	mov.l	@er7+,er4
	mov.l	@er7+,er6
	rts
	.size	_memcpy, .-_memcpy
	.align 1
	.global _memcmp
_memcmp:
	mov.l	er6,@-er7
	mov.l	er7,er6
	mov.l	er4,@-er7
	mov.l	er2,er4
	bra	.L12
.L13:
	mov.b	@er0+,r3l
	mov.b	@er1+,r2l
	cmp.b	r2l,r3l
	beq	.L14
	mov.b	@er0,r3l
	mov.b	@er1,r2l
	cmp.b	r2l,r3l
	bhs	.L16
	mov.w	#1,r0
	bra	.L18
.L16:
	mov.w	#-1,r0
	bra	.L18
.L14:
	subs	#1,er4
.L12:
	mov.l	er4,er4
	bgt	.L13
	sub.w	r0,r0
.L18:
	mov.l	@er7+,er4
	mov.l	@er7+,er6
	rts
	.size	_memcmp, .-_memcmp
	.align 1
	.global _strlen
_strlen:
	mov.l	er6,@-er7
	mov.l	er7,er6
	mov.l	er0,er1
.L22:
	mov.w	r0,r3
	sub.w	r1,r3
	mov.b	@er0+,r2l
	bne	.L22
	mov.w	r3,r0
	mov.l	@er7+,er6
	rts
	.size	_strlen, .-_strlen
	.align 1
	.global _strcpy
_strcpy:
	mov.l	er6,@-er7
	mov.l	er7,er6
	mov.l	er0,er3
	bra	.L28
.L29:
	mov.b	r2l,@er3
	adds	#1,er3
	adds	#1,er1
.L28:
	mov.b	@er3,r2l
	beq	.L30
	mov.b	@er1,r2l
	bne	.L29
.L30:
	mov.l	@er7+,er6
	rts
	.size	_strcpy, .-_strcpy
	.align 1
	.global _strcmp
_strcmp:
	mov.l	er6,@-er7
	mov.l	er7,er6
	bra	.L34
.L35:
	cmp.b	r2l,r3l
	beq	.L36
	bhs	.L38
	mov.w	#1,r0
	bra	.L40
.L38:
	mov.w	#-1,r0
	bra	.L40
.L36:
	adds	#1,er0
	adds	#1,er1
.L34:
	mov.b	@er0,r3l
	beq	.L41
	mov.b	@er1,r2l
	bne	.L35
.L41:
	sub.w	r0,r0
.L40:
	mov.l	@er7+,er6
	rts
	.size	_strcmp, .-_strcmp
	.align 1
	.global _strncmp
_strncmp:
	mov.l	er6,@-er7
	mov.l	er7,er6
	mov.l	er4,@-er7
	mov.l	er0,er4
	mov.w	r2,r0
	bra	.L45
.L46:
	cmp.b	r3l,r2l
	beq	.L47
	bhs	.L49
	mov.w	#1,r0
	bra	.L51
.L49:
	mov.w	#-1,r0
	bra	.L51
.L47:
	adds	#1,er4
	adds	#1,er1
	subs	#1,er0
.L45:
	mov.b	@er4,r2l
	beq	.L52
	mov.b	@er1,r3l
	beq	.L52
	mov.w	r0,r0
	bgt	.L46
.L52:
	sub.w	r0,r0
.L51:
	mov.l	@er7+,er4
	mov.l	@er7+,er6
	rts
	.size	_strncmp, .-_strncmp
	.align 1
	.global _putc
_putc:
	mov.l	er6,@-er7
	mov.l	er7,er6
	mov.l	er4,@-er7
	mov.b	r0l,r4l
	cmp.b	#10,r0l
	bne	.L57
	mov.b	#13,r1l
	mov.w	#1,r0
	jsr	@_serial_send_byte
.L57:
	mov.b	r4l,r1l
	mov.w	#1,r0
	jsr	@_serial_send_byte
	mov.l	@er7+,er4
	mov.l	@er7+,er6
	rts
	.size	_putc, .-_putc
	.align 1
	.global _puts
_puts:
	mov.l	er6,@-er7
	mov.l	er7,er6
	mov.l	er4,@-er7
	mov.l	er0,er4
	bra	.L61
.L62:
	adds	#1,er4
	jsr	@_putc
.L61:
	mov.b	@er4,r0l
	bne	.L62
	sub.w	r0,r0
	mov.l	@er7+,er4
	mov.l	@er7+,er6
	rts
	.size	_puts, .-_puts
	.ident	"GCC: (GNU) 4.2.4"
	.end
