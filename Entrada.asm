org 100h ;Le indica al ensamblador que continúe el ensamblado a partir de la dirección 100H

section .data   ;definiendo la data antes de la compilación
    ;db significa que serán bytes crudos
    ;0ah es salto de linea
    ;0dh es retorno de carro
    ;$ significa que hasta ahí se termina la cadena, o en su lugar,colocar 24h fuera de la cadena
    ;9h es un espacio de tabulación
    encabezado: db 0ah,"***************************** PROYECTO 2 FASE 1 *****************************",0,0ah,0ah,"Laboratorio Arquitectura de Computadoras y Ensambladores 1",0,0ah,"Pedro Antonio Castro Calderon",0,0ah,"201900612",0,0ah,0ah,"*****************************************************************************$"
    texto1 db 0ah,0ah,"Ingrese el numero de la opcion que desea, o pulse ESC para salir.",'$'
    menu db 0ah,0ah,9h,"(1) Ingresar los coeficientes de la funcion",0ah,0dh,9h,"(2) Imprimir la funcion almacenada",0ah,0dh,9h,"(3) Imprimir derivada de la funcion almacenada",0ah,0dh,9h,"(4) Imprimir integral de la funcion almacenada",0ah,0dh,9h,"(5) Graficar la funcion",0ah,0dh,9h,"(6) Metodo de Newton",0ah,0dh,9h,"(7) Metodo de Steffensen",0ah,0dh,9h,"(8) Metodo de Miller",0ah,0dh,9h,"(9) Salir de la aplicacion",0ah,0dh,24h
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
    negativo: db "-$"
    positivo: db "+$"
    der_x5: db '0'
    int_x5: db '0'
    s_x5: db '0'
    u_x5: db '0'
    d_x5: db '0'
    n_x5: db '0'
    der_x4: db '0'
    int_x4: db '0'
    s_x4: db '0'
    u_x4 db 0
    d_x4 db 0
    n_x4 db 0
    der_x3: db '0'
    int_x3: db '0'
    s_x3: db '0'
    u_x3 db 0
    d_x3 db 0
    n_x3 db 0
    der_x2: db '0'
    int_x2: db '0'
    s_x2: db '0'
    u_x2 db 0
    d_x2 db 0
    n_x2 db 0
    der_x1: db '0'
    int_x1: db '0'
    s_x1: db '0'
    u_x1 db 0
    d_x1 db 0
    n_x1 db 0
    der_x0: db '0'
    int_x0: db '0'
    s_x0: db '0'
    u_x0 db 0
    d_x0 db 0
    n_x0 db 0

    Signo: db 2Dh, '$'

section .bss ;Reservando bytes para su posterior uso
    opcion resb 2
    coefi5 resb 5
    coefi4 resb 6
    resultado resb 10

section .text   ;aquí empezará la ejecución
    global _start

_start:
    ;Limpiando pantalla
    mov ah,00h              ;Poner el modo video
    mov al, 03h             ;Obtener la posición y el tamaño del cursor
    int 10h                 ;Interrupción del BIOS

    mov ah, 09h             ;Instrucción para imprimir en pantalla lo que está en dx
    mov dx, encabezado      ;Se mueve al registro dx la cadena que se encuentre en encabezado
    int 21h                 ;Interrupción del DOS

    mov ah, 09h
    mov dx, texto1
    int 21h

    mov ah, 09h
    mov dx, menu
    int 21h

    call _getEntrada        ;Llamando a que un método se ejecute

    int 20h                 ;terminar Programa


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
    je _noDisponible

    cmp al, 36h             
    je _noDisponible

    cmp al, 37h             
    je _noDisponible

    cmp al, 38h             
    je _noDisponible

    ;Si la opción es 9, el programa se detendrá
    cmp al, 39h             
    je _Salir

    cmp al, 1bh             
    je _Escape

    ;Si no es ninguna, mostrará error por opción incorrecta.
    jmp _opcionInvalida ;saltando a la funcion de opcion invalida

    ret     ;instrucción de retorno

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





    




   



