	org 	100h

section .text

	call 	texto	
	call 	cursor
	call 	phrase
	call	kbwait

	int 	20h

texto:	mov 	ah, 00h
	mov	al, 03h
	int 	10h
	ret

cursor: mov	ah, 01h
	mov 	ch, 00000000b
	mov 	cl, 00001110b
		;   IRGB
	int 	10h
	ret

w_char:	mov 	ah, 09h
	mov 	al, cl
	mov 	bh, 0h
	mov 	bl, 00001111b
	mov 	cx, 1h
	int 	10h
	ret

kbwait: mov 	ax, 0000h
	int 	16h
	ret

m_cursr:mov 	ah, 02h
	mov 	dx, di  ; columna
    add     dx, ax
	mov 	dh, bh ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 0d
lupi:	mov 	cl, [msg+di]
    mov 	bh, 9d ; fila
    mov     ax, 10d; columna
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
    
    mov 	di, 0d
lupi2:	mov 	cl, [msg2+di]
        mov 	bh, 13d ; fila
        mov     ax, 40d; columna
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, len2
        jb	lupi2
        
        mov di, 0d
lupi3:	mov 	cl, [msg3+di]
        mov 	bh, 19d ; fila
        mov     ax, 25d; columna
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, len3
        jb	lupi3
        ret


section .data1
msg	db 	"Sometimes  "
len 	equ	$-msg

section .data2
msg2	db 	"I dream "
len2 	equ	$-msg2

section .data3
msg3	db 	"About cheese "
len3 	equ	$-msg3