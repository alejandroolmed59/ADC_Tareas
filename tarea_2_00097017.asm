		org 100h
		;EJERCICIO 1
		mov ax, 0000h
		mov bx, 0000h
		mov bx, 9d
		add ax, bx
		mov bx, 7d
		add ax, bx
		mov bx, 0d
		add ax, bx
		mov bx, 1d
		add ax, bx
		mov bx, 7d
		add ax, bx

		mov bx, 5d; Dividir entre 5 
		div bx ; En ax(cociente) queda 4!

		mov cl, "M"
		mov [200h],cl
		mov cl, "e"
		mov [201h],cl
		mov cl, " "
		mov [202h],cl
		mov cl, "r"
		mov [203h],cl
		mov cl, "e"
		mov [204h],cl
		mov cl, "c"
		mov [205h],cl
		mov cl, "u"
		mov [206h],cl
		mov cl, "p"
		mov [207h],cl
		mov cl, "e"
		mov [208h],cl
		mov cl, "r"
		mov [209h],cl
		mov cl, "o"
		mov [20Ah],cl


 ;;EJERCICIO 2
		mov ax ,2d
		mov bx, 0000h
		mov cx ,0000h
		mov dx, 0000h
		mov cx, 2d ; variable empezando en dos
		mov bx, 0h; contador en 1
		mul cx
		mov [bx+210h], ax

bucle1:	inc bx
		mul cx
		mov [bx+210h], ax
		cmp ax, 0Xff ; Para 
		jb bucle1
bucle2: inc bx
		inc bx
		mul cx
		mov [bx+210h], ax
		cmp bx, 12d Si ; Si ya estuvieron las 11 veces
		jbe bucle2

;EJERCICIO 3
		mov ax, 0000h
		mov bx, 0000h
		mov cx, 0000h
		mov dx, 0000h

		mov dx, 0d
		mov [220h], dx ;Casos trivial 1
		mov dx, 1h
		mov [221h], dx ; Caso trivial 2
		mov bx, 1h  ;Será mi contador para la "recursion"

while1:
		inc bx 
		mov ax, [220h+bx-1h]  ;Funciona como variable x-1
		mov cx, [220h+bx-2h] ; Funciona como variable x-2
		add ax, cx

		cmp ax,  0xff
		jb while2

		mov [220h+bx], ax
		cmp bx, 10h ;Mientras no se haya llegado a 16 la iteracion sigue (hexa)
		jb while1

while2:
		mov ah, [220h+bx] ;Cuando se excedan del numero maximo para dos bits, se usaran dos celdas
		mov al, [220h+bx+1h]
		inc bx
		inc bx
		mov ax, [220h+bx-1h]
		mov bx, [220h+bx-3h]
		cmp bx, 10h ;Mientras no se haya llegado a 16 la iteracion sigue (hexa)
		jb while1


fin:	int 10h

