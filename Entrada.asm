org 100h ;Le indica al ensamblador que continúe el ensamblado a partir de la dirección 100H

section .data   ;definiendo la data antes de la compilación
    ;db significa que serán bytes crudos
    ;0ah es salto de linea
    ;0dh es retorno de carro
    ;$ significa que hasta ahí se termina la cadena, o en su lugar,colocar 24h fuera de la cadena
    ;9h es un espacio de tabulación
    encabezado: db 0ah,"***************************** PROYECTO 2 FASE 1 *****************************",0,0ah,0ah,"Laboratorio Arquitectura de Computadoras y Ensambladores 1",0,0ah,"Pedro Antonio Castro Calderon",0,0ah,"201900612",0,0ah,0ah,"*****************************************************************************$"
    texto1 db 0ah,0ah,"Ingrese el numero de la opcion que desea, o pulse ESC para salir.",'$'
    menu db 0ah,0ah,9h,"(1) Ingresar los coeficientes de la funcion",0ah,0dh,9h,"(2) Imprimir la funcion almacenada",0ah,0dh,9h,"(3) Imprimir derivada de la funcion almacenada",0ah,0dh,9h,"(4) Imprimir integral de la funcion almacenada",0ah,0dh,9h,"(5) Graficar la funcion",0ah,0dh,9h,"(6) Metodo de Newton",0ah,0dh,9h,"(7) Metodo de Steffensen",0ah,0dh,9h,"(8) Salir de la aplicacion",0ah,0dh,24h
    NuevaLinea db 0ah,'$'
    Ouput1: db "Ingrese el coeficiente de x^5: $"
    Output2: db "Ingrese el coeficiente de x^4: $"
    Output3: db "Ingrese el coeficiente de x^3: $"
    Output4: db "Ingrese el coeficiente de x^2: $"
    Output5: db "Ingrese el coeficiente de x: $"
    Output6: db "Ingrese el termino independiente: $"
    Output7: db "Coeficiente ingresado: $"
    Output8: db "Funcion almacenada exitosamente! pulse 0 para volver al menu $"
    Output9: db "x^5 $"
    Output10: db "x^4 $"
    Output11: db "x^3 $"
    Output12: db "x^2 $"
    Output13: db "x $"
    Output14: db "La funcion almacenada es f(x) = $"
    Output15: db "  Presione 0 para volver al menu $"
    Output16: db "La derivada de la funcion es f'(x) =  $"
    Output17: db "La integral de la funcion es F(x) =  $"
    Output18: db "x^6 $"
    Output19: db "+ C $"
    Output20: db "  ERROR: Solo se permiten numeros enteros, presione 0 para continuar... $"
    Output21: db "  Esta funcionalidad aun no esta disponible. $"
    Output22: db "  Saliendo del programa... $"
    Output23: db " > $"
    Output24: db "  ERROR: La opcion ingresada no es valida... $"
    Output25: db "              $"
    Output26: db " ERROR: No se ha almacenado ninguna funcion aun...$"
    Output27: db " Presione el numero de la opcion a graficar...$"
    Output28: db 0ah,0ah,9h,"(1) Graficar funcion original",0ah,0dh,9h,"(2) Graficar derivada",0ah,0dh,9h,"(3) Graficar integral",0ah,0dh,24h
    Output29: db " Prueba macro 1...$"
    Output30: db " Prueba macro 2..$"
    Output31: db " Tiene signo negativo..$"
    Output32: db " Iteracion en curso:$"
    Output33: db " Xn:$"
    Output34: db " Xn+1:$"
    Output35: db " Error de Xn+1:$"
    Output36: db "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@$"
    Output37: db " Se encontro la solucion en esta iteracion$"
    Output38: db " No se encontro la solucion en el limite permitido$"
    Output39: db " Ingrese Limite inferior: $"
	Output40: db " Ingrese Limite superior: $"
	Output41: db " Ingrese numero max. de iteraciones: $"
    negativo: db "-$"
    positivo: db "+$"
    der_x5: db '0'
    int_x5: db '0'
    s_x5: db '+'
    u_x5: db '0'
    d_x5: db '0'
    n_x5: db 0
    der_x4: db '0'
    int_x4: db '0'
    s_x4: db '+'
    u_x4: db 0
    d_x4: db 0
    n_x4: db 0
    der_x3: db '0'
    int_x3: db '0'
    s_x3: db '+'
    u_x3: db 0
    d_x3: db 0
    n_x3: db 1
    der_x2: db '0'
    int_x2: db '0'
    s_x2: db '-'
    u_x2: db 0
    d_x2: db 0
    n_x2: db 0
    der_x1: db '0'
    int_x1: db '0'
    s_x1: db '-'
    u_x1: db 0
    d_x1: db 0
    n_x1: db 1
    der_x0: db '0'
    int_x0: db '0'
    s_x0: db '+'
    u_x0: db 0
    d_x0: db 0
    n_x0: db 0
    h: dw (0)
    w: dw (0)
    coorx: db 10d
    coory: db 3d

    multiplicador: dq 10.0
    flotante: dq 12
    entero: dw 0
    no_decimales: dw 8
    punto: db ".$"

	;Para metodos numericos
    err: dq 0.005
    error: dq 0.0
    maximas_iteraciones: dw 2
    s_maximas_iteraciones: dw '+'
    x_inferior: dw -2
    s_x_inferior: dw '+'
    x_superior: dw -1
    s_x_superior: dw '+'
    xsub_n:	dq -1.5
    xsub_nmas1: dq 0.0
    temporal_word: dw 0
    iteracion_actual: dw 0

    ;Para el método de Newton
    f_x: dq 0.0
    fprima_x: dq 0.0
    constante_2: dw 2
    constante_10: dw 10

    sol_newton_tmp1: dq 0.0

    ;Para el metodo de Steffensen
    stf_tmp_x: dq 1.0
    stf_tmp_fx: dq 0.0
    stf_tmp_derecha: dq 0.0
    stf_tmp_gx_n: dq 0.0

    Signo: db 2Dh, '$'
    espacio_salida: times 100 db 0
    modo_redondeo: dw 0x0C3F

section .bss ;Reservando bytes para su posterior uso
    opcion: resb 2
    coefi5: resb 5
    coefi4: resb 6
    resultado: resb 10

section .text   ;aquí empezará la ejecución
    global _start

_start:
    ;Limpiando pantalla
    mov ah,00h              ;Poner el modo video
    mov al, 03h             ;Obtener la posición y el tamaño del cursor
    int 10h                 ;Interrupción del BIOS
	fldcw word [modo_redondeo]

    mov ah, 09h             ;Instrucción para imprimir en pantalla lo que está en dx
    mov dx, encabezado      ;Se mueve al registro dx la cadena que se encuentre en encabezado
    int 21h                 ;Interrupción del DOS

    mov ah, 09h             ;imprimimos el texto 1
    mov dx, texto1
    int 21h

    mov ah, 09h
    mov dx, menu
    int 21h

    jmp _getEntrada        ;Llamando a que un método se ejecute
    int 20h                 ;terminar Programa

;Metodo Steffensen
_metodoSteffensen:
	;Reseteamos la variable que nos dice la iteracion actual
	mov word [iteracion_actual], 1

	_metodoSteffensen_loop: ;ciclo que se repetirá (serán las iteraciones)

		mov ax, word [maximas_iteraciones]      ;movemos el valor de las maximas iteraciones a ax  
		cmp word [iteracion_actual], ax         ;lo comparamos con la iteracion actual
		ja _metodoSteffensen_fallo              ;si ya se pasó del máximo, el método falló.

		;Imprimir iteracion actual
		mov ah, 09h
		mov dx,Output32
		int 21h

		push word 0                     ;Signo para impresion
		push word [iteracion_actual]    ;Pasar el numero para imprimir
		mov si, espacio_salida          ;Donde almacenar la cadena
		call _ConvertirATexto           ;Hacer la conversion
		add sp, 4                       ;Limpiar los numeros pasados a la pila
		mov ah, 09h                     ;Preparar para imprimir
		mov dx, espacio_salida          ;Decirle que cadena imprimir
		int 21h                         ;Ejecutar la impresion

		;Imprimir separador
		mov ah, 09h
		mov dx,Output36
		int 21h

		call _lineaNueva    ;Llamando a función que imprime nueva linea

		;Imprimir Xn de esta iteracion
		mov ah, 09h
		mov dx,Output33
		int 21h

		fld qword [xsub_n]		;Cargamos xn en el fpu
		fstp qword [flotante]		;Lo ponemos en la variable utilizada por _imprimirflotante
		call _imprimirflotante      ;mandamos a imprimir el número flotante
		call _lineaNueva    ;Llamando a función que imprime nueva linea


		;Calculamos F(xn) , mandamos a llamar a la función que la calcula
		call _Calcular_f_x

		;cargando en memoria xn
		fld qword [xsub_n]
		;Le hacemos una copia porque lo modificaremos
		fstp qword [stf_tmp_x]

		;cargando en memoria f(x)
		fld qword [f_x]
		;Le hacemos una copia porque lo necesitaremos varias veces
		fst qword [stf_tmp_fx]

		;Le sumamos xn para tener F(xn)+xn
		fadd qword [xsub_n]
		;Lo guardamos en xsub_n porque necesitamos valuar F(x) en este punto
		fstp qword [xsub_n]

		;Calculamos F(xn+F(xn))
		call _Calcular_f_x
		;cargando en memoria F(xn+F(xn))
		fld qword [f_x]

		;Le restamos F(xn) para tener F(xn+F(xn))-F(xn)
		fsub qword [stf_tmp_fx]

		;Lo dividimos por F(xn) para tener (F(xn+F(xn))-F(xn))/F(xn)
		fdiv qword [stf_tmp_fx]

		;Esto equivale a g(xn), lo guardamos para poderlo usar despues y lo sacamos de la pila
		fstp qword [stf_tmp_gx_n]

		;Cargamos la copia que teniamos de F(xn)
		fld qword [stf_tmp_fx]
		;La dividimos por G(xn)
		fdiv qword [stf_tmp_gx_n]

		;Lo guardamos para poderlo usar despues y lo sacamos de la pila
		fstp qword [stf_tmp_derecha]

		;Cargamos la copia que teniamos de xn
		fld qword [stf_tmp_x]
		;Le restamos la parte calculada anteriormente, que es F(xn)/G(xn)
		fsub qword [stf_tmp_derecha]

		;Esto equivale a Xn+1, lo guardamos
		fst qword [xsub_nmas1]
		;Le restamos X_n
		fsub qword [xsub_n]
		;Valor absoluto de la resta
		fabs
		;guardarlo en error
		fstp qword [error]

		;volviendo a cargar x_n+1
		fld qword [xsub_nmas1]
		;actualizando x_n
		fstp qword [xsub_n]


		;Imprimir Xn+1 de esta iteracion
		mov ah, 09h
		mov dx,Output34
		int 21h

		fld qword [xsub_nmas1]		;Cargamos xn+1 en memoria
		fstp qword [flotante]		;Lo ponemos en la variable utilizada por _imprimirflotante
		call _imprimirflotante      ;llamando al método para imprimir flotantes
		call _lineaNueva    ;Llamando a función que imprime nueva linea


		;Imprimir error de esta iteracion
		mov ah, 09h
		mov dx,Output35
		int 21h
    

		fld qword [error]		;Cargamos el error en memoria
		fstp qword [flotante]		;Lo ponemos en la variable utilizada por _imprimirflotante
		call _imprimirflotante      ;Llamando al método para imprimir flotantes
		call _lineaNueva    ;Llamando a función que imprime nueva linea
        call _lineaNueva


		;Miramos si la tolerancia ya se cumple
		fld qword [error]
		fcom qword [err]        
		fnstsw ax
		sahf
		jbe _metodoSteffensen_exito     ;Llamando al método que muestra el exito de la operación


		inc word [iteracion_actual]     ;Incrementamos la variable de iteración_actual

		;Pausamos para poder leer los datos en pantalla
		mov ah, 08h
		int 21h

		jmp _metodoSteffensen_loop  ;Volvemos al inicio del ciclo


	_metodoSteffensen_exito:
		;Imprimir que se encontró la solucion
		mov ah, 09h
		mov dx,Output37
		int 21h
		call _lineaNueva    ;Llamando a función que imprime nueva linea

		;Pausamos para poder leer los datos en pantalla
		mov ah, 08h	
		int 21h
		ret

	_metodoSteffensen_fallo:
		;Imprimir que no se encontró la solucion
		mov ah, 09h
		mov dx,Output38
		int 21h
		call _lineaNueva    ;Llamando a función que imprime nueva linea

		;Pausamos para poder leer los datos en pantalla
		mov ah, 08h		
		int 21h
		ret


_metodoNewton:
	;Reseteamos la variable que nos dice la iteracion actual
	mov word [iteracion_actual], 1

	_metodoNewton_loop:     ;ciclo que se repetirá (serán las iteraciones)

		mov ax, word [maximas_iteraciones]      ;movemos a ah el número de máximas iteraciones
		cmp word [iteracion_actual], ax         ;lo comparamos con la iteración actual
		ja _metodoNewton_fallo                  ;si ya se sobrepasó el límite de iteraciones, el método falló

		;Imprimir iteracion actual
		mov ah, 09h
		mov dx,Output32
		int 21h

		push word 0                     ;Signo para impresion
		push word [iteracion_actual]    ;Pasar el numero para imprimir
		mov si, espacio_salida          ;Donde almacenar la cadena
		call _ConvertirATexto           ;Hacer la conversion
		add sp, 4                       ;Limpiar los numeros pasados a la pila
		mov ah, 09h                     ;Preparar para imprimir
		mov dx, espacio_salida          ;Decirle que cadena imprimir
		int 21h                         ;Ejecutar la impresion

		;Imprimir separador
		mov ah, 09h
		mov dx,Output36
		int 21h

		call _lineaNueva    ;Llamando a función que imprime nueva linea

		;Imprimir Xn de esta iteracion
		mov ah, 09h
		mov dx,Output33
		int 21h

		fld qword [xsub_n]		;Cargamos xn en memoria
		fstp qword [flotante]		;Lo ponemos en la variable utilizada por _imprimirflotante
		call _imprimirflotante      ;Llamamos al metodo que imprime flotantes
		call _lineaNueva    ;Llamando a función que imprime nueva linea

		;Calculamos F(xn)
		call _Calcular_f_x
		;Calculamos derivada de F(xn)
		call _Calcular_d_f_x

	;    ;DIVIDIENDO F(Xn) SOBRE F'(Xn)
	    fld qword [f_x]         ;cargando en memoria el numerador f(x)
	    fdiv qword [fprima_x]   ;cargando en memoria el denominador f'(x)
	    fstp qword [sol_newton_tmp1] ;almacenando en variable temporal y se saca de la pila
	    fld qword [xsub_n]      ;cargando en memoria x_sub n con la que valuamos
	    fsub qword [sol_newton_tmp1]    ;le restamos el resultado de la division
	    fst qword [xsub_nmas1]  ;Cargamos el resultado en X_n+1
	    fsub qword [xsub_n]     ;Le restamos X_n
	    fabs                    ;Valor absoluto de la resta
	    fstp qword [error]              ;guardarlo en error

	    fld qword [xsub_nmas1]  ;volviendo a cargar x_n+1
	    fstp qword [xsub_n]     ;actualizando x_n

		;Imprimir Xn+1 de esta iteracion
		mov ah, 09h
		mov dx,Output34
		int 21h

		fld qword [xsub_nmas1]		;Cargamos xn en el fpu
		fstp qword [flotante]		;Lo ponemos en la variable utilizada por _imprimirflotante
		call _imprimirflotante      ;Llamamos al metodo para imprimir flotantes
		call _lineaNueva    ;Llamando a función que imprime nueva linea


		;Imprimir error de esta iteracion
		mov ah, 09h
		mov dx,Output35
		int 21h


		fld qword [error]		;Cargamos xn en el fpu
		fstp qword [flotante]		;Lo ponemos en la variable utilizada por _imprimirflotante
		call _imprimirflotante
		call _lineaNueva    ;Llamando a función que imprime nueva linea
        call _lineaNueva

		;Miramos si la tolerancia ya se cumple
		fld qword [error]
		fcom qword [err]
		fnstsw ax
		sahf
		jbe _metodoNewton_exito     ;Llamamos a metodo de que la operación fue exitosa.


		inc word [iteracion_actual] ;incrementamos variable de iteración

		;Pausamos para poder leer los datos en pantalla
		mov ah, 08h
		int 21h

		jmp _metodoNewton_loop      ;se repite el ciclo de iteracion


	_metodoNewton_exito:
		;Imprimir que se encontro la solucion
		mov ah, 09h
		mov dx,Output37
		int 21h
		call _lineaNueva    ;Llamando a función que imprime nueva linea

		;Pausamos para poder leer los datos en pantalla
		mov ah, 08h
		int 21h
		ret

	_metodoNewton_fallo:
		;Imprimir que no se encontró la solucion
		mov ah, 09h
		mov dx,Output38
		int 21h
		call _lineaNueva    ;Llamando a función que imprime nueva linea

		;Pausamos para poder leer los datos en pantalla
		mov ah, 08h		
		int 21h
		ret


_Calcular_f_x:

	fldz        ;Cargando 0 a memoria
    fstp qword [f_x]    ;Ese 0 se resetea a f_x

    ;multiplicando con coeficiente x_5
    fld qword [xsub_n] ;Cargando x actual en memoria
    fmul qword [xsub_n] ;Multiplicando por sí mismo
    fmul qword [xsub_n]
    fmul qword [xsub_n]
    fmul qword [xsub_n]

    mov ax, 0                   ;limpiando el registro ax
    mov al, byte [n_x5]         ;movemos el número a al
    mov word [temporal_word], ax    ;lo que hay en ax lo movemos a la variable temporal
    fimul word [temporal_word]      ;multiplica el elemento más reciente de la pila con la variable temporal
    cmp byte [s_x5], '+'            ;compara el signo
    je _Calcular_f_x_x_5_es_positivo    ;si es igual se dirige al método
	fchs                                ;comando para cambio de signo
	_Calcular_f_x_x_5_es_positivo:
	fadd qword [f_x]                    ;Le suma al elemento más reciente de la pila [f_x]
    fstp qword [f_x]                    ;lo guardamos en [f_x]

	;multiplicando con coeficiente x_4
	fld qword [xsub_n] ;Cargando x actual en memoria
	fmul qword [xsub_n] ;multiplicando por sí mismo
	fmul qword [xsub_n]
	fmul qword [xsub_n]

	mov ax, 0                               ;limpiando el registro ax
	mov al, byte [n_x4]                     ;movemos el número a al
	mov word [temporal_word], ax            ;lo que hay en ax lo movemos a la variable temporal
	fimul word [temporal_word]              ;multiplica el elemento más reciente de la pila con la variable temporal
	cmp byte [s_x4], '+'                    ;compara el signo
	je _Calcular_f_x_x_4_es_positivo        ;si es igual se dirige al método
	fchs                                    ;comando para cambio de signo
	_Calcular_f_x_x_4_es_positivo:
	fadd qword [f_x]                        ;Le suma al elemento más reciente de la pila [f_x]
	fstp qword [f_x]                        ;lo guardamos en [f_x]

	;multiplicando con coeficiente x_3
	fld qword [xsub_n] ;Cargando x actual en memoria
	fmul qword [xsub_n] ;multiplicando por sí mismo
	fmul qword [xsub_n]

	mov ax, 0                           ;limpiando el registro ax
	mov al, byte [n_x3]                 ;movemos el número a al
	mov word [temporal_word], ax        ;lo que hay en ax lo movemos a la variable temporal
	fimul word [temporal_word]          ;multiplica el elemento más reciente de la pila con la variable temporal
	cmp byte [s_x3], '+'                ;compara el signo
	je _Calcular_f_x_x_3_es_positivo    ;si es igual se dirige al método
	fchs                                ;comando para cambio de signo
	_Calcular_f_x_x_3_es_positivo:
	fadd qword [f_x]                    ;Le suma al elemento más reciente de la pila [f_x]
	fstp qword [f_x]                    ;lo guardamos en [f_x]


	;multiplicando con coeficiente x_2
	fld qword [xsub_n] ;Cargando x actual en memoria
	fmul qword [xsub_n]

	mov ax, 0                               ;limpiando el registro ax
	mov al, byte [n_x2]                     ;movemos el número a al
	mov word [temporal_word], ax            ;lo que hay en ax lo movemos a la variable temporal
	fimul word [temporal_word]              ;multiplica el elemento más reciente de la pila con la variable temporal
	cmp byte [s_x2], '+'                    ;compara el signo
	je _Calcular_f_x_x_2_es_positivo        ;si es igual se dirige al método
	fchs                                    ;comando para cambio de signo
	_Calcular_f_x_x_2_es_positivo:
	fadd qword [f_x]                        ;Le suma al elemento más reciente de la pila [f_x]
	fstp qword [f_x]                        ;lo guardamos en [f_x]

	;multiplicando con coeficiente x_1
	fld qword [xsub_n] ;Cargando x actual en memoria

	mov ax, 0                           ;limpiando el registro ax
	mov al, byte [n_x1]                 ;movemos el número a al
	mov word [temporal_word], ax        ;lo que hay en ax lo movemos a la variable temporal
	fimul word [temporal_word]          ;multiplica el elemento más reciente de la pila con la variable temporal
	cmp byte [s_x1], '+'                ;compara el signo
	je _Calcular_f_x_x_1_es_positivo    ;si es igual se dirige al método
	fchs                                ;comando para cambio de signo
	_Calcular_f_x_x_1_es_positivo:
	fadd qword [f_x]                    ;Le suma al elemento más reciente de la pila [f_x]
	fstp qword [f_x]                    ;lo guardamos en [f_x]

    ;sumando la constante
    mov ax, 0                           ;limpiando el registro ax
	mov al, byte [n_x0]                 ;movemos el número a al
	mov word [temporal_word], ax        ;lo que hay en ax lo movemos a la variable temporal
    fild word [temporal_word]  	;Cargando el coeficiente entero
    cmp byte [s_x0], '+'                ;compara el signo
	je _Calcular_f_x_x_0_es_positivo    ;si es igual se dirige al método
	fchs                                ;comando para cambio de signo
	_Calcular_f_x_x_0_es_positivo:
	fadd qword [f_x]                    ;Le suma al elemento más reciente de la pila [f_x]
	fstp qword [f_x]                    ;lo guardamos en [f_x]
    ret

_Calcular_d_f_x:

	fldz        ;Cargando 0 a memoria
    fstp qword [fprima_x]    ;Ese 0 se resetea a fprima_x

    ;multiplicando con coeficiente x_5
    fld qword [xsub_n] ;Cargando x actual en memoria
    fmul qword [xsub_n] ;multiplicandose por si mismo
    fmul qword [xsub_n]
    fmul qword [xsub_n]

    mov ax, 0                               ;limpiando el registro ax
    mov al, byte [n_x5]                     ;movemos el número a al
    mov word [temporal_word], ax            ;lo que hay en ax lo movemos a la variable temporal
    fimul word [temporal_word]              ;multiplica el elemento más reciente de la pila con la variable temporal
    mov word [temporal_word], 5             ;movemos a la variable temporal el numero 5
    fimul word [temporal_word]              ;multiplicamos el elemento más reciente de la pila con la variable temporal

    cmp byte [s_x5], '+'                    ;comparamos el signo
    je _Calcular_d_f_x_x_5_es_positivo      ;si es igual se dirige al método
	fchs                                    ;comando para cambio de signo
	_Calcular_d_f_x_x_5_es_positivo:
	fadd qword [fprima_x]                   ;le suma al último elemento de la pila [fprima_x]
    fstp qword [fprima_x]                   ;Saca el resultado de la pila a [fprima_x]

	;multiplicando con coeficiente x_4
	fld qword [xsub_n] ;Cargando x actual en memoria
	fmul qword [xsub_n] ;multiplicandose por si mismo
	fmul qword [xsub_n]

	mov ax, 0                               ;limpiando el registro ax
	mov al, byte [n_x4]                     ;movemos el número a al
	mov word [temporal_word], ax            ;lo que hay en ax lo movemos a la variable temporal
	fimul word [temporal_word]              ;multiplica el elemento más reciente de la pila con la variable temporal
    mov word [temporal_word], 4             ;movemos a la variable temporal el numero 4
    fimul word [temporal_word]              ;multiplicamos el elemento más reciente de la pila con la variable temporal
	cmp byte [s_x4], '+'                    ;compara el signo
	je _Calcular_d_f_x_x_4_es_positivo      ;si es igual se dirige al método
	fchs                                    ;comando para cambio de signo
	_Calcular_d_f_x_x_4_es_positivo:
	fadd qword [fprima_x]                   ;le suma al último elemento de la pila [fprima_x]
	fstp qword [fprima_x]                   ;guardamos el resultado en [fprima_x]

	;multiplicando con coeficiente x_3
	fld qword [xsub_n] ;Cargando x actual en memoria
	fmul qword [xsub_n]

	mov ax, 0                                   ;limpiando el registro ax
	mov al, byte [n_x3]                         ;movemos el número a al
	mov word [temporal_word], ax                ;lo que hay en ax lo movemos a la variable temporal
	fimul word [temporal_word]                  ;multiplica el elemento más reciente de la pila con la variable temporal
    mov word [temporal_word], 3                 ;movemos a la variable temporal el numero 3
    fimul word [temporal_word]                  ;multiplicamos el elemento más reciente de la pila con la variable temporal
	cmp byte [s_x3], '+'                         ;compara el signo
	je _Calcular_d_f_x_x_3_es_positivo           ;si es igual se dirige al método
	fchs                                        ;comando para cambio de signo
	_Calcular_d_f_x_x_3_es_positivo:
	fadd qword [fprima_x]                       ;le suma al último elemento de la pila [fprima_x]
	fstp qword [fprima_x]                       ;guardamos el resultado en [fprima_x]


	;multiplicando con coeficiente x_2
	fld qword [xsub_n] ;Cargando x actual en memoria

	mov ax, 0                                   ;limpiando el registro ax
	mov al, byte [n_x2]                         ;movemos el número a al
	mov word [temporal_word], ax                ;lo que hay en ax lo movemos a la variable temporal
	fimul word [temporal_word]                  ;multiplica el elemento más reciente de la pila con la variable temporal
    mov word [temporal_word], 2                 ;movemos a la variable temporal el numero 2
    fimul word [temporal_word]                  ;multiplicamos el elemento más reciente de la pila con la variable temporal
	cmp byte [s_x2], '+'                        ;compara el signo
	je _Calcular_d_f_x_x_2_es_positivo          ;si es igual se dirige al método
	fchs                                        ;comando para cambio de signo
	_Calcular_d_f_x_x_2_es_positivo:
	fadd qword [fprima_x]                       ;le suma al último elemento de la pila [fprima_x]
	fstp qword [fprima_x]                       ;guardamos el resultado en [fprima_x]

	;multiplicando con coeficiente x_1
	fld1 ;hace un push +1 al la pila de fpu
	mov ax, 0                                   ;limpiando el registro ax
	mov al, byte [n_x1]                         ;movemos el número a al
	mov word [temporal_word], ax                ;lo que hay en ax lo movemos a la variable temporal
	fimul word [temporal_word]                  ;multiplica el elemento más reciente de la pila con la variable temporal
	cmp byte [s_x1], '+'                        ;compara el signo
	je _Calcular_d_f_x_x_1_es_positivo          ;si es igual se dirige al método
	fchs                                        ;comando para cambio de signo
	_Calcular_d_f_x_x_1_es_positivo:
	fadd qword [fprima_x]                        ;le suma al último elemento de la pila [fprima_x]
	fstp qword [fprima_x]                       ;guarda el resultado en [fprima_x]
    ret



_getEntrada:
    mov ah, 09h
    mov dx, Output23
    int 21h

    mov ah, 01h             ;Lee un caracter ingresado por el usuario, y se almacena en el registro al
    mov al, opcion
    int 21h
                            ;cmp: comparar dos operandos , si es igual se ejecuta el salto je
    cmp al, 31h             ;Si el caracter almacenado en al es 31h (1 en ascii) se ejecutará el método de ingresar función
    je _ingresarFuncion

    cmp al, 32h             ;Si el caracter almacenado en al es 32h (2 en ascii) se ejecutará el método de ver función almacenada
    je _verFuncion

    cmp al, 33h             ;Si el caracter almacenado en al es 33h (3 en ascii) se ejecutará el método de imprimir derivada
    je _imprimirDerivada

    cmp al, 34h             ;Si el caracter almacenado en al es 34h (4 en ascii) se ejecutará el método de imprimir integral
    je _imprimirIntegral

    cmp al, 35h             ;A partir de aquí, si la opción está entre 5 y 8 retornará un mensaje de no disponible
    je _graficar

    cmp al, 36h
    jne _getEntrada_entrada_7
    call PedirDatos
    call _metodoNewton
    jmp _start

	_getEntrada_entrada_7:
    cmp al, 37h
    jne _getEntrada_entrada_8
    call PedirDatos
	call _metodoSteffensen
    jmp _start

	_getEntrada_entrada_8:
    cmp al, 38h
    je _Salir

    cmp al, 1bh             
    je _Escape



    ;Si no es ninguna, mostrará error por opción incorrecta.
    call _opcionInvalida ;saltando a la funcion de opcion invalida

    jmp _start



PedirDatos:
	call _lineaNueva
    call _lineaNueva

    ;Ingresando limite inferior
    mov ah, 09h
    mov dx, Output39
    int 21h

    mov ah, 01h         ; leyendo un caracter de entrada
    int 21h                ;se le suma 30h para poder ser manejado
    mov word [s_x_inferior], 0  ;se limpia el registro que va a contener al signo
    mov [s_x_inferior], al      ;el signo ingresado por el usuario se guarda en el registro.

    mov ah, 01h                 ;leyedo un caracter de entrada
    int 21h
    sub al, 30h                 ;se le resta 30h para poder ser manejado
    mov word [x_inferior], 0    ;se limpia el registro que contendrá al límite inferior
    mov [x_inferior], al        ;el digito de decenas ingresado por el usuario se guarda
    mov ax, [x_inferior]        ;se multiplican el digito de las decenas
    mul word [constante_10]     ;x10
    mov [x_inferior], ax        ;el resultado se guarda en el registro del limite inferior

    mov ah, 01h                 ;leyendo el digito de las unidades
    int 21h
    sub al, 30h                 ;se le restan 30h para ser manejados
    add [x_inferior], al        ;


    call _lineaNueva

    push word 0				;Signo para impresion
    push word [x_inferior]  ;Pasar el numero para imprimir
	mov si, espacio_salida	;Donde almacenar la cadena
	call _ConvertirATexto		;Hacer la conversion
	add sp, 4				;Limpiar los numeros pasados
	mov ah, 09h 			;Preparar para imprimir
	mov dx, espacio_salida	;Decirle que cadena imprimir
	int 21h				;Ejecutar la impresion

    call _lineaNueva
    call _lineaNueva

    ;Ingresando limite superior
    mov ah, 09h
    mov dx, Output40
    int 21h

    mov ah, 01h
    int 21h
    mov word [s_x_superior], 0
    mov [s_x_superior], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov word [x_superior], 0
    mov [x_superior], al
    mov ax, [x_superior]
    mul word [constante_10]
    mov [x_superior], ax

    mov ah, 01h
    int 21h
    sub al, 30h
    add [x_superior], al


    call _lineaNueva

    push word 0				;Signo para impresion
    push word [x_superior]  ;Pasar el numero para imprimir
	mov si, espacio_salida	;Donde almacenar la cadena
	call _ConvertirATexto		;Hacer la conversion
	add sp, 4				;Limpiar los numeros pasados
	mov ah, 09h 			;Preparar para imprimir
	mov dx, espacio_salida	;Decirle que cadena imprimir
	int 21h				;Ejecutar la impresion

    call _lineaNueva
    call _lineaNueva

    ;Ingresando # máximo de iteraciones
    mov ah, 09h
    mov dx, Output41
    int 21h

    ;capturando el signo desde el teclado 
    mov ah, 01h
    int 21h
    ;sub al, 30h ;le restamos 30h
    mov word [s_maximas_iteraciones], 0 
    mov [s_maximas_iteraciones], al     ;guardandolo en su respectiva variable

    ;capturando el primer digito del numero (decenas)
    mov ah, 01h
    int 21h
    sub al, 30h ;le restamos 30h
    mov word [maximas_iteraciones], 0   
    mov [maximas_iteraciones], al   ;lo guardamos en su respectiva variable
    mov ax, [maximas_iteraciones]
    mul word [constante_10]         ;lo multiplicamos x10 para obtener las decenas
    mov [maximas_iteraciones], ax   ;Acualizamos la variable con el resultado

    ;capturando el segundo dígito del número (unidades)
    mov ah, 01h
    int 21h         
    sub al, 30h     ;le restamos 30h
    add [maximas_iteraciones], al   ;le sumamos las unidades a las decenas


    call _lineaNueva

    push word 0				;Signo para impresion
    push word [maximas_iteraciones]  ;Pasar el numero para imprimir
	mov si, espacio_salida	;Donde almacenar la cadena
	call _ConvertirATexto		;Hacer la conversion
	add sp, 4				;Limpiar los numeros pasados
	mov ah, 09h 			;Preparar para imprimir
	mov dx, espacio_salida	;Decirle que cadena imprimir
	int 21h				;Ejecutar la impresion

    call _lineaNueva
    call _lineaNueva


    ;Sacando el punto medio ( Xn )
    fild word [x_inferior]      ;cargando a memoria el número

    cmp word [s_x_inferior], '+'    ;comparando su signo
    je inferior_positivo            ;si es igual, dirigirse al método
    fchs                            ;comando para cambio de signo

    inferior_positivo:

    fild word [x_superior]          ;cargando a memoria el número
    cmp word [s_x_superior], '+'    ;comparando su signo
    je superior_positivo            ;si es igual, dirigirse al método
    fchs                            ;comando para cambio de signo
    superior_positivo:

    faddp                           ;suma los dos últimos valores de la pila y los saca de ahí

    fidiv word [constante_2]        ;dividiendo el último elemento de la pila por la constante y lo guarda en la pila
    fstp qword [xsub_n]             ;sacando el resultado y guardarlo en xsub_n

    fld qword [xsub_n]              ;cargando xsub_n en memoria
    fstp qword [flotante]           ;guardarlo en [flotante]
    call _imprimirflotante          ;llamando a método para imprimirlo
    call _lineaNueva
    call _lineaNueva



    ret



_ingresarFuncion:
    mov ah, 09h
    mov dx, NuevaLinea
    int 21h

    mov ah, 09h
    mov dx, NuevaLinea
    int 21h

    call _ingresarCoeficientes

    ret 

_ingresarCoeficientes:

    ;ingresando coeficiente x a la 5
    mov ah, 09h
    mov dx, Ouput1      
    int 21h
                    ;Leer signo + o -
    mov ah, 01h     ;Leer un caractér del teclado y desplegarlo
    int 21h         ;interrupción DOS
    sub al, 30h     ;Al registro donde se guarda el caracter se le resta 30h (0 en hex) para que pueda ser manejado 
    mov [s_x5], al  ;Ese valor ya se guarda en lo que contenga el registro para su posterior uso.

    mov ah, 01h         ;Se ingresa otro caracter 
    int 21h
    cmp al,'0'          ;checa si el caracter es un digito
    jb _noEsNumero      ;Si el digito es menos que 0, se ejecutará un error
    cmp al, '9'         ;checa si el caracter es un digito
    ja _noEsNumero      ;Si el digito es mayor que 9, se ejecutará un error
    sub al, 30h         ;Si es un digito, se le resta 30h para poder ser manejado
    mov [d_x5], al      ;El resultado se guarda en el contenido de la memoria en la direccipon d_x5

    mov ah, 01h         ;INgresando el digito de unidades.
    int 21h
    sub al, 30h
    mov [u_x5], al

    ;almacenando el número completo
    mov al, [d_x5]      ;Se realiza la multiplicación del digito de las decenas
    mov bl, 10          ;x10
    mul bl
    add al, [u_x5]      ;A esa multiplicación se le suman las unidades
    mov [n_x5], al      ;Ya tenemos un número de 2 cifras que se guardará en n_x5

    call _lineaNueva    ;Llamando a función que imprime nueva linea
                        
    ;El procedimiento anterior se repite para los coeficientes restantes, únicamente cambia el lugar donde se almacenan los valores.                
    ;ingresando coeficiente x a la 4
    mov ah, 09h
    mov dx, Output2    
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s_x4], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [d_x4], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [u_x4], al

    ;almacenando el número completo
    mov al, [d_x4]
    mov bl, 10
    mul bl
    add al, [u_x4]
    mov [n_x4], al

    call _lineaNueva

    ;ingresando coeficiente x a la 3
    mov ah, 09h
    mov dx, Output3     
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s_x3], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [d_x3], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [u_x3], al

    ;almacenando el número completo
    mov al, [d_x3]
    mov bl, 10
    mul bl
    add al, [u_x3]
    mov [n_x3], al

    call _lineaNueva

    ;ingresando coeficiente x a la 2
    mov ah, 09h
    mov dx, Output4   
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s_x2], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [d_x2], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [u_x2], al

    ;almacenando el número completo
    mov al, [d_x2]
    mov bl, 10
    mul bl
    add al, [u_x2]
    mov [n_x2], al

    call _lineaNueva

    ;ingresando coeficiente x a la 1
    mov ah, 09h
    mov dx, Output5     
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s_x1], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [d_x1], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [u_x1], al

    ;almacenando el número completo
    mov al, [d_x1]
    mov bl, 10
    mul bl
    add al, [u_x1]
    mov [n_x1], al

    call _lineaNueva

    ;ingresando coeficiente x a la 0
    mov ah, 09h
    mov dx, Output6    
    int 21h

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s_x0], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [d_x0], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [u_x0], al

    ;almacenando el número completo
    mov al, [d_x0]
    mov bl, 10
    mul bl
    add al, [u_x0]
    mov [n_x0], al

    call _lineaNueva

    call _lineaNueva

    mov ah, 09h         ;Se imprimre mensaje en pantalla de que se almacenó la función
    mov dx, Output8
    int 21h 

    call _lineaNueva
    call _lineaNueva

    mov ah, 01h         ;Espera a que el usuario ingrese un caracter
    int 21h     
    cmp al, 30h         ;Si el caracter ingresado es igual a 0 (30h en hex)            
    je _start           ;Regresará al menú

    ret


_verFuncion:
    ;Limpiando pantalla
    mov ah,00h              ;Poner el modo video
    mov al, 03h             ;Obtener la posición y el tamaño del cursor
    int 10h                 ;Interrupción del BIOS

    call _lineaNueva

    call _lineaNueva

    mov ah, [n_x5]          ;si no se ha ingresado una función antes, devolverá error.
    cmp ah, '0'
    je _noFuncion

    mov ah, 09h
    mov dx, Output14
    int 21h

    ;imprimiendo coeficiente x5
    mov ah, 02h         ;nos despliega un caracter en la pantalla
    mov dl, [s_x5]      ;que será el signo contenido en la dirección de memoria s_x5
    add dl, 30h         ;pero antes.. se le sumarán 30h para que el usuario pueda verlo como signo
    int 21h             ;interrupción DOS

    mov al, [n_x5]      ;moviendo lo que hay en el registro n_x5
    AAM                 ;Instrucción de Desempaquetar
    mov bx, ax          ;mover el registro ax en bx
    mov ah, 02h         ;Desplegando un caracter en la pantalla, que será el primer dígito
    mov dl, bh          ;Mover a dl lo que hay en dh
    add dl, 30h         ;Sumando lo que hay en el registro dl un 30h para que el usuario pueda verlo como número
    int 21h             ;Interrupción DOS
    
    mov ah, 02h         ;Desplegará otro caracter en la pantalla, que será el segundo dígito
    mov dl, bl          ;Moviendo al registro dl lo que hay en el registro b en su parte baja
    add dl, 30h         ;Se le sumará 30h para poder verse como número decimal
    int 21h             ;Interrupción DOS

    mov ah, 09h
    mov dx, Output9
    int 21h

    ;El procedimiento mostrado arriba se repite para los demás coeficientes, cambiando unicamente los valores.
    ;imprimiendo coeficiente x4
    mov ah, 02h
    mov dl, [s_x4]
    add dl, 30h
    int 21h

    mov al, [n_x4]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output10
    int 21h

;imprimiendo coeficiente x3
    mov ah, 02h
    mov dl, [s_x3]
    add dl, 30h
    int 21h

    mov al, [n_x3]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output11
    int 21h

;imprimiendo coeficiente x2
    mov ah, 02h
    mov dl, [s_x2]
    add dl, 30h
    int 21h

    mov al, [n_x2]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output12
    int 21h

    ;imprimiendo coeficiente x1
    mov ah, 02h
    mov dl, [s_x1]
    add dl, 30h
    int 21h

    mov al, [n_x1]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h
    
    mov ah, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output13
    int 21h
    
    ;imprimiendo coeficiente x0
    mov ah, 02h         ;Desplegando caracter en pantalla
    mov dl, [s_x0]      ;que será lo que esté en la direccioń s_x0
    add dl, 30h         ;sumandole 30h para que el usuario lo comprenda
    int 21h

    mov al, [n_x0]      ;moviendo lo que hay en el registro n_x0
    AAM                 ;Instrucción de Desempaquetar
    mov bx, ax          ;mover el registro ax en bx
    mov ah, 02h         ;Desplegando un caracter en la pantalla, que será el primer dígito
    mov dl, bh          ;Mover a dl lo que hay en dh
    add dl, 30h         ;Sumando lo que hay en el registro dl un 30h para que el usuario pueda verlo como número
    int 21h             ;Interrupción DOS
    
    mov ah, 02h         ;Desplegará otro caracter en la pantalla, que será el segundo dígito       
    mov dl, bl          ;Moviendo al registro dl lo que hay en el registro b en su parte baja
    add dl, 30h         ;Se le sumará 30h para poder verse como número decimal
    int 21h             ;Interrupción DOS

    call _lineaNueva

    call _lineaNueva

    mov ah, 09h
    mov dx, Output15
    int 21h 

    call _lineaNueva
    call _lineaNueva

    mov ah, 01h         ;Esperando que el usuario presione 0 para volver al menú.
    int 21h
    cmp al, 30h             
    je _start
    
    ret

_imprimirDerivada:
    mov ah,00h              ;Limpiar la pantalla
    mov al, 03h
    int 10h

    mov ah, [n_x5]          ;si no se ha ingresado una función antes, devolverá error.
    cmp ah, '0'
    je _noFuncion

    call _lineaNueva

    mov ah, 09h
    mov dx, Output16
    int 21h

    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output25
    int 21h

    ;imprimir derivada de x5
    mov al, [n_x5]      ;Mover al registro AL lo que hay en n_x5
    mov bl, 5           ;Mover al registro bl el número 5
    mul bl              ;Realizando multiplicación AL = AL*BL
    mov [der_x5], al    ;El resultado (AL) se guarda en el contenido del registro der_x5

    mov ah, 02h
    mov dl, [s_x5]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo la derivada.
    mov al, [der_x5]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output10
    int 21h
    
    ;El procedimiento anterior se repite en los demás coeficientes, cambiando únicamente los valores.

    ;imprimir derivada de x4
    mov al, [n_x4]
    mov bl, 4
    mul bl
    mov [der_x4], al

    mov ah, 02h
    mov dl, [s_x4]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo
    mov al, [der_x4]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output11
    int 21h

    ;imprimir derivada de x3
    mov al, [n_x3]
    mov bl, 3
    mul bl
    mov [der_x3], al

    mov ah, 02h
    mov dl, [s_x3]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo
    mov al, [der_x3]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output12
    int 21h

    ;imprimir derivada de x2
    mov al, [n_x2]
    mov bl, 2
    mul bl
    mov [der_x2], al

    mov ah, 02h
    mov dl, [s_x2]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo
    mov al, [der_x2]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output13
    int 21h

    ;imprimir derivada de x1
    mov al, [n_x1]
    mov bl, 1
    mul bl
    mov [der_x1], al

    mov ah, 02h
    mov dl, [s_x1]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo
    mov al, [der_x1]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    call _lineaNueva

    call _lineaNueva

    mov ah, 09h
    mov dx, Output15
    int 21h

    mov ah, 01h     ;Esperando que el usuario presione 0 para volver al menú.
    int 21h
    cmp al, 30h             
    je _start

    ret

_imprimirIntegral:
    mov ah,00h              ;Limpiar la pantalla
    mov al, 03h
    int 10h

    mov ah, [n_x5]          ;si no se ha ingresado una función antes, devolverá error.
    cmp ah, '0'
    je _noFuncion

    call _lineaNueva

    mov ah, 09h
    mov dx, Output17
    int 21h

    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output25
    int 21h


    xor ax, ax  ;limpiar registros para que la división no dé problemas.

    ;imprimiendo integral de x5
    mov bl, 6           ;mover a bl el número 6
    mov al, [n_x5]      ;mover a al el coeficiente de x5
    div bl              ;instrucción de división AL = AL/BL
    mov [int_x5], al    ;El resultado de la división (AL) se guarda en el contenido del registro int_x5

    mov ah, 02h         ;Imprimiendo el signo.
    mov dl, [s_x5]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo la integral.
    mov al, [int_x5]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output18     
    int 21h

    ;El procedimiento anterior se repite para los demás coeficientes cambiando los valores.

    xor ax, ax  ;limpiar registros
    ;imprimiendo integral de x4
    mov bl, 5
    mov al, [n_x4]
    div bl
    mov [int_x4], al

    mov ah, 02h
    mov dl, [s_x4]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo la integral.
    mov al, [int_x4]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output9     
    int 21h

    xor ax, ax  ;limpiar registros
    ;imprimiendo integral de x3
    mov bl, 4
    mov al, [n_x3]
    div bl
    mov [int_x3], al

    mov ah, 02h
    mov dl, [s_x3]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo la integral.
    mov al, [int_x3]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output10 
    int 21h

    xor ax, ax  ;limpiar registros
    ;imprimiendo integral de x2
    mov bl, 3
    mov al, [n_x2]
    div bl
    mov [int_x2], al

    mov ah, 02h
    mov dl, [s_x2]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo la integral.
    mov al, [int_x2]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output11    
    int 21h

    xor ax, ax  ;limpiar registros
    ;imprimiendo integral de x1
    mov bl, 2
    mov al, [n_x1]
    div bl
    mov [int_x1], al

    mov ah, 02h
    mov dl, [s_x1]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo la integral.
    mov al, [int_x1]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output12     
    int 21h

    xor ax, ax  ;limpiar registros
    ;imprimiendo integral de x0
    mov bl, 1
    mov al, [n_x0]
    div bl
    mov [int_x0], al

    mov ah, 02h
    mov dl, [s_x0]
    add dl, 30h
    int 21h

    ;Desempaquetando e imprimiendo la integral.
    mov al, [int_x0]
    AAM
    mov bx, ax
    mov ah, 02h
    mov dl, bh
    add dl, 30h
    int 21h

    mov al, 02h
    mov dl, bl
    add dl, 30h
    int 21h

    mov ah, 09h
    mov dx, Output13     
    int 21h

    mov ah, 09h
    mov dx, Output19     
    int 21h

    mov ah, 09h
    mov dx, NuevaLinea
    int 21h

    mov ah, 09h
    mov dx, NuevaLinea
    int 21h

    mov ah, 09h
    mov dx, Output15
    int 21h

    mov ah, 01h         ;Esperando que el usuario presione 0 para volver al menú.
    int 21h
    cmp al, 30h             
    je _start

    ret

_signoPositivo:         ;Este método se usaría para reconocer cuando se ingresa un signo positivo
    mov ah, 09h
    mov dx, positivo
    int 21h

    ret

_signoNegativo:         ;Este método se usaría para reconocer cuando se ingresa un signo negativo
    mov ah, 09h
    mov dx, negativo
    int 21h

    mov ah, 01h
    int 21h
    cmp al, 30h             
    je _ingresarCoeficientes

    ret

_noEsNumero:                ;Método que devuelve error si el usuario ingresa otra cosa que no sean números enteros
    call _lineaNueva
    call _lineaNueva

    mov ah, 09h            
    mov dx, Output20
    int 21h

    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output23
    int 21h

    mov ah, 01h
    int 21h
    cmp al, 30h             
    je _start

    ret

_noDisponible:              ;Método que avisa cuando la opción ingresada aún no está disponible
    call _lineaNueva    
    call _lineaNueva

    mov ah, 09h
    mov dx, Output21
    int 21h

    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output15
    int 21h

    call _lineaNueva
    call _lineaNueva

    mov ah, 01h
    int 21h
    cmp al, 30h             
    je _start

    ret

_Salir:                 ;Método para salir del programa
    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output22
    int 21h

    int 20h

    ret

_opcionInvalida:        ;Método que marca error cuando la opción ingresada no está contenida en el menú.
    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output24
    int 21h

    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output15
    int 21h

    call _lineaNueva
    call _lineaNueva

    mov ah, 01h
    int 21h
    cmp al, 30h             
    je _start

    ret
    

_limpiarPantalla:       ;Este método se llama cuando se quiere hacer limpieza de pantalla.
    mov ah,00h             
    mov al, 03h
    int 10h
    ret

_lineaNueva:            ;Este metodo se llama cuando se quiere imprimir una nueva linea.
    mov ah, 09h
    mov dx, NuevaLinea
    int 21h
    ret

_Escape:                ;Si el usuario presiona la tecla ESC desde el menú, el programa se cierra.
    int 20h
    ret

_noFuncion:
    call _lineaNueva

    mov ah, 09h
    mov dx, Output26
    int 21h

    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output15
    int 21h

    mov ah, 01h
    int 21h
    cmp al, 30h             
    je _start

    ret

_graficar:
    call _limpiarPantalla
    call _lineaNueva

    mov ah, 09h         ;preparando para imprimir
    mov dx, Output27     ;se imprimirá este mensaje
    int 21h             ;realiza la impresión

    call _lineaNueva

    mov ah, 09h
    mov dx, Output28
    int 21h

    mov ah, 09h
    mov dx, Output23
    int 21h

    mov ah, 01h             ;Lee un caracter ingresado por el usuario, y se almacena en el registro al
    mov al, opcion
    int 21h

                            ;cmp: comparar dos operandos , si es igual se ejecuta el salto je
    cmp al, 31h             ;Si el caracter almacenado en al es 31h (1 en ascii) se ejecutará el método de ingresar función
    je _pruebaGraficar

    cmp al, 32h
    je _pruebaGraficar

    cmp al, 33h
    je _pruebaGraficar
    


    ret

_pruebaGraficar:
    mov ah, 00
    mov al, 13h     ;modo grafico 320x200 256 colores
    int 10h

    mov dx, 0       ; fila del pixel y
    mov si, [h]     ; contador de la altura
    ejeVertical:
        mov ah, 0ch     ;pintar un pixel
        mov al, 4       ;será de color rojo
        mov bh, 0h      ;en la página 0
        mov cx, 160      ;renglón x, centro de la pantalla
        int 10h         
        inc dx          ;incrementamos fila
        inc si          ;incrementamos contador altura
        cmp si, 200     ;si la altura ya llegó a 200 pixeles, se detiene
        jne ejeVertical ;si no, se repite el ciclo

    mov cx, 0       ;columna del pixel x
    mov si, [w]     ;contador del largo
    ejeHorizontal:      
        mov ah, 0ch     ;pintar un pixel
        mov al, 4       ;de color rojo
        mov bh, 0h      ;en la pagina 0
        mov dx, 100     ;renglón y
        int 10h         
        inc cx          ;incrementamos colmna
        inc si          ;incrementamos contador del largo
        cmp si, 320     ;si el largo ya llegó a 320 px, se detiene
        jne ejeHorizontal   ;si no, se repite el ciclo


    ;pintando punto
    ;el 0 en x va a ser ahora 20, sumarle 20 a todo
    mov ah, 0ch
    mov si, coory
    ;sub 
    mov cx, 150
    mov dx, 300
    int 10h

    mov ah, 01h             ;Lee un caracter ingresado por el usuario, y se almacena en el registro al
    int 21h

    jmp _start

    ret


;La cadena de salida debe estar en SI
_ConvertirATexto:
	mov ax, [esp+2]     ;moviendo el puntero de la pila
	;Contador de cuantos caracteres hemos usado
	mov cx, 00h

	;Caso particular que el numero sea 0
	cmp ax, 0
	jne _ConvertirATexto_no_es_cero
	;Poner el ascii de 0
	mov [si], byte 48
	;Siguiente espacio disponible para caracter
	inc si
	jmp _ConvertirATexto_salida_2

	_ConvertirATexto_no_es_cero:

	mov dx, [esp+4]					;Obtener el signo de la pila
	;Si es positivo, no imprimir nada
	cmp dx, 0
	je _ConvertirATexto_positivo
	mov [si], byte 0x2d				;Si es negativo, agregar el caracter - a la cadena
	;Siguiente espacio disponible para caracter
	inc si

	_ConvertirATexto_positivo:
	;Limpiar dx para que no afecte en la division
	mov dx, 0

	_ConvertirATexto_loop1:
		cmp ax, 0					;Si el numero ya llego a 0, paramos
		je _ConvertirATexto_salida1
		;Divisor
		mov bx, 10
		;Hacer la division
		div bx
		;Agregarle 48 para convertirlo en un caracter ascii
		add dx, byte 48
		;Lo guardamos en la pila
		push dx
		;Limpiar dx para que no afecte en la division
		mov dx, 0
		;aumentar en uno la cantidad de caracteres que usamos
		inc cx
		jmp _ConvertirATexto_loop1


	_ConvertirATexto_salida1:
		_ConvertirATexto_loop2:
		cmp cx, 0					;Si aun quedan caracteres en la cadena, seguir sacando
		je _ConvertirATexto_salida_2
		pop ax						;Obtener el numero de la pila y sacarlo
		mov [si], ax				;Agregarla a la cadena de salida
		;Siguiente espacio disponible para caracter
		inc si
		;Restarle uno a la cantidad de caracteres que quedan en la pila
		sub cx, 1
		jmp _ConvertirATexto_loop2

	_ConvertirATexto_salida_2:
		;Agregar $ para poder mandarlo a imprimir
		mov [si], byte '$'
		ret


_imprimirflotante:
    call _lineaNueva
    fld qword [flotante]    ;cargar en memoria lo que hay en [flotante]


    ;Vemos el signo antes de hacer las operaciones
    ;Este comando es equivalente a cmp flotante, 0
    ftst
    fnstsw ax
	sahf
	jae _imprimirflotante_positivo
	;Le cambiamos de signo
	fchs
	;Lo guardamos para futuras operaciones
	fst qword [flotante]
	;Imprimimos un -
	mov ah, 02h
	mov dl, byte '-'
	int 21h
	_imprimirflotante_positivo:


    frndint     ;redondeamos el elemento más reciente de la pila
    fistp word [entero]     ;almacenamos en [entero] el último elemento de la pila

	push word 0				;Signo para impresion
    push word [entero]		;Pasar el numero para imprimir
	mov si, espacio_salida	;Donde almacenar la cadena
	call _ConvertirATexto		;Hacer la conversion
	add sp, 4				;Limpiar los numeros pasados
	mov ah, 09h 			;Preparar para imprimir
	mov dx, espacio_salida	;Decirle que cadena imprimir
	int 21h				;Ejecutar la impresion

    mov ah, 09h
    mov dx, punto
    int 21h


    fld qword [flotante]       ;cargando en memoria [flotante]
    fisub word [entero]        ;se le resta el entero
    fstp qword [flotante]      ;el resultado se guarda en [flotante]

    mov si, [no_decimales]  ;contador de cuantos decimales queremos imprimir
    ;empezar el ciclo
    _imprimirdecimales:
        cmp si, 0           ;comparar si el contador llegó a 0
        je _finimpresion    ;si es así, la impresión de decimales finaliza.
        push si             ;ingresamos si a la pila 
        fld qword [flotante]    ;cargamos [flotante] a memoria
        fmul qword [multiplicador]  ;lo multiplicamos x10
        fst qword [flotante]        ;actualizamos su valor
        frndint                     ;lo redondeamos
        fistp word [entero]         ;lo guardamos en [entero]


		push word 0				;Signo para impresion
		push word [entero]		;Pasar el numero para imprimir
		mov si, espacio_salida	;Donde almacenar la cadena
		call _ConvertirATexto	;Hacer la conversion
		add sp, 4				;Limpiar los numeros pasados a la pila

		mov ah, 09h 			;Preparar para imprimir
		mov dx, espacio_salida	;Decirle que cadena imprimir
		int 21h				;Ejecutar la impresion



        fld qword [flotante]    ;cargar [flotante] en memoria
        fisub word [entero]     ;le restamos el entero
        fstp qword [flotante]   ;actualizamos su valor
        pop si                  ;sacamos si de la pila
        dec si                  ;decrementamos el contador de decimales restantes
        jmp _imprimirdecimales  ;repetimos el ciclo

	_finimpresion:
    	ret













    




   



