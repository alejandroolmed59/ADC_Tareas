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
		cmp ax, 0Xff ; Si ya estuvieron las 11 veces
		jb bucle1
bucle2: inc bx
		inc bx
		mul cx
		mov [bx+210h], ax
		cmp bx, 12d
		jbe bucle2


fin:	int 10h

