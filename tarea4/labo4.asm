org 	100h

section .text

	mov 	dx, msg
	call 	w_strng


reset:	xor 	si, si 	;lo mimso que: mov si, 0000h
lupi:	call 	kb
	mov	[300h+si], al ; CS:0300h en adelante
    sub al, 30h  ;Corrigo para tener el hex a decimal
	mov [210h+si], al
    cmp 	si, 04h
	je	res ;LA condicion de paro sera cuando si sea 4[0-4]=5(longitud del carnet)
	inc 	si
	jmp 	lupi

mostrar:mov 	dx, nl
	call	w_strng
	mov	byte [300h+si], "$"
	mov 	dx, 300h
	call 	w_strng
	call 	kb	; solo detenemos la ejecución
	int 	20h

texto:	 mov 	ah, 0h
	int 	16h
	ret
	ret

kb: 	mov	ah, 1h
	int 	21h
	ret

w_strng:mov	ah, 09h
	int 	21h
	ret


;comparar: xor si,si
;compararaux:  mov bl, [200h+si]
;	cmp bl, [210h+si]
;	jne lupi
;	inc si
;	cmp si, 05h
;	je mostrarbienvenido
;	jmp compararaux

mostrarmsg:
    mov ah,09h
    int 21h
    ret

res:mov ax, [210h] ; Primer numero uso ax para que sea mi dividendo
    add ax, [211h] ; Sumo los siguiente numeros
    add ax, [212h]
    add ax, [213h]
    add ax, [214h]
    mov ah, 00h
    mov bl, 5d ; Sera mi divisor
    div bl
    mov [220h], al

    mov dx, msg1
    cmp al, 01h
    je mostrarmsg
    mov dx, msg2
    cmp al, 02h
    je mostrarmsg
    mov dx, msg3
    cmp al, 03h
    je mostrarmsg
    mov dx, msg4
    cmp al, 04h
    je mostrarmsg
    mov dx, msg5
    cmp al, 05h
    je mostrarmsg
    mov dx, msg6
    cmp al, 06h
    je mostrarmsg
    mov dx, msg7
    cmp al, 07h
    je mostrarmsg
    mov dx, msg8
    cmp al, 08h
    je mostrarmsg
    mov dx, msg9
    cmp al, 09h
    je mostrarmsg
    mov dx, msg10
    cmp al, 0Ah
    je mostrarmsg
    
   


section .data
msg 	db 	"Ingresa tu carnet: $"
nl	db 	0xA, 0xD, "$"

section .data
msg1 	db 	" Solo necesito el 0 $"
nl1	db 	0xA, 0xD, "$"

section .data
msg2 	db 	" Aun se pasa $"
nl2	db 	0xA, 0xD, "$"

section .data
msg3 	db 	" Hay salud $"
nl3	db 	0xA, 0xD, "$"

section .data
msg4 	db 	" Me recupero $"
nl4	db 	0xA, 0xD, "$"

section .data
msg5 	db 	" En el segundo $"
nl5	db 	0xA, 0xD, "$"

section .data
msg6 	db 	" Peor es nada $"
nl6	db 	0xA, 0xD, "$"

section .data
msg7 	db 	" Muy bien $"
nl7	db 	0xA, 0xD, "$"

section .data
msg8 	db 	" Colocho $"
nl8	db 	0xA, 0xD, "$"

section .data
msg9 	db 	" Siempre me esfuerzo $"
nl9	db 	0xA, 0xD, "$"

section .data
msg10 	db 	" PERFECTO SOLO DIOS $"
nl10	db 	0xA, 0xD, "$"