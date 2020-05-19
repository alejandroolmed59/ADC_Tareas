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
    add     dx, 30d
	mov 	dh, bh ; fila
	mov 	bh, 0h
	int 	10h
	ret

phrase:	mov 	di, 0d
lupi:	mov 	cl, [msg+di]
    mov 	bh, 13d ; fila
	call    m_cursr
	call 	w_char
	inc	di
	cmp 	di, len
	jb	lupi
    
    mov 	di, 0d
lupi2:	mov 	cl, [msg2+di]
        mov 	bh, 17d ; fila
        call    m_cursr
        call 	w_char
        inc	di
        cmp 	di, len2
        jb	lupi2
        ret


section .data
msg	db 	"Sometimes  "
msg2	db 	"I dream about cheese "
len 	equ	$-msg
len2 	equ	$-msg2
