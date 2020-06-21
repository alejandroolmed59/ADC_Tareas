org 	100h

section .text

	call 	grafico	; Llamada a iniciar modo grafico 13h

	mov di, 0h
horizontal1:	mov 	cx, 100d ; Columna 
            add	cx, di	 ; Offset
            mov	dx, 50d ; Fila
            call 	pixel
            inc 	di
            cmp 	di, 50d
            jne 	horizontal1

    mov di, 0h
vertical1:  mov cx, 125d;
            mov dx, 50d
            add dx, di
            call pixel
            inc di
            cmp di,126d ;El 126d no se dibuja
            jne vertical1
        
    mov di, 0h
horizontal2:  mov cx, 50d
              add cx, di
              mov dx, 175d
              call pixel
              inc di
              cmp di,75d
              jne horizontal2

    mov di, 0h
vertical2: mov cx,50d
            mov dx, 125d ;QUIERO LLEGAR HASTA 175d
            add dx, di
            call pixel
            inc di
            cmp di,50d
            jne vertical2
            call fin



fin:   call 	kb	 ; Utilizamos espera de alguna tecla
	int 	20h


grafico:mov	ah, 00h
	mov	al, 13h
	int 	10h
	ret

pixel:	mov	ah, 0Ch
	mov	al, 0100b
	int 	10h
	ret

kb: 	mov	ah, 00h
	int 	16h
	ret

section .data