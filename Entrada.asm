org 100h

section .data
    ;encabezado: db 0ah,"**************************************************** PROYECTO 2 FASE 1 ****************************************************",0,0ah,"Laboratorio Arquitectura de Computadoras y Ensambladores 1",0,0ah,"Pedro Antonio Castro Calderón",0,0ah,"201900612",0,0ah,"***************************************************************************************************************************"**************$",0,0ah,0ah
    encabezado: db 0ah,"***************************** PROYECTO 2 FASE 1 *****************************",0,0ah,0ah,"Laboratorio Arquitectura de Computadoras y Ensambladores 1",0,0ah,"Pedro Antonio Castro Calderon",0,0ah,"201900612",0,0ah,0ah,"*****************************************************************************$"
    texto1 db 0ah,0ah,"Ingrese el numero de la opcion que desea, o pulse ESC para salir.",'$'
    menu db 0ah,0ah,9h,"(1) Ingresar los coeficientes de la funcion",0ah,0dh,9h,"(2) Imprimir la funcion almacenada",0ah,0dh,9h,"(3) Imprimir derivada de la funcion almacenada",0ah,0dh,9h,"(4) Imprimir integral de la funcion almacenada",0ah,0dh,9h,"(5) Graficar la funcion",0ah,0dh,9h,"(6) Metodo de Newton",0ah,0dh,9h,"(7) Metodo de Steffensen",0ah,0dh,9h,"(8) Metodo de Miller",0ah,0dh,9h,"(9) Salir de la aplicacion",0ah,0dh,24h
    NuevaLinea db 0ah,'$'
    Ouput1: db "Ingrese el coeficiente de x^5: $"
    Output2: db "Ingrese el coeficiente de x^4: $"
    Output3: db "Ingrese el coeficiente de x^3: $"
    Output4: db "Ingrese el coeficiente de x^2: $"
    Output5: db "Ingrese el coeficiente de x: $"
    Output6: db "Ingrese el tesrmino independiente: $"
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
    Output22: db "  Saliendoo del programa... $"
    Output23: db " > $"
    Output24: db "  ERROR: La opcion ingresada no es valida... $"
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
    s_x0: db '0'
    u_x0 db 0
    d_x0 db 0
    n_x0 db 0

    Signo: db 2Dh, '$'

section .bss
    opcion resb 2
    coefi5 resb 5
    coefi4 resb 6
    resultado resb 10

section .text
    global _start

_start:
    mov ah,00h              ;Limpiar la pantalla
    mov al, 03h
    int 10h

    mov ah, 09h             ;Imprimir en pantalla lo que está en dx
    mov dx, encabezado
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

    jmp _opcionInvalida

    ;Si no es ninguna, mostrará error por opción incorrecta.


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

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [s_x5], al

    mov ah, 01h
    int 21h
    cmp al,'0'
    jb _noEsNumero
    cmp al, '9'
    ja _noEsNumero
    sub al, 30h
    mov [d_x5], al

    mov ah, 01h
    int 21h
    sub al, 30h
    mov [u_x5], al

    ;almacenando el número completo
    mov al, [d_x5]
    mov bl, 10
    mul bl
    add al, [u_x5]
    mov [n_x5], al

    call _lineaNueva

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

    mov ah, 09h
    mov dx, Output8
    int 21h 

    call _lineaNueva
    call _lineaNueva

    mov ah, 01h
    int 21h
    cmp al, 30h             
    je _start

    ret


_verFuncion:
    mov ah,00h              ;Limpiar la pantalla
    mov al, 03h
    int 10h

    call _lineaNueva

    call _lineaNueva

    mov ah, 09h
    mov dx, Output14
    int 21h

    ;imprimiendo coeficiente x5
    mov ah, 02h
    mov dl, [s_x5]
    add dl, 30h
    int 21h

    mov al, [n_x5]
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
    mov dx, Output9
    int 21h

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
    mov ah, 02h
    mov dl, [s_x0]
    add dl, 30h
    int 21h

    mov al, [n_x0]
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

_imprimirDerivada:
    mov ah,00h              ;Limpiar la pantalla
    mov al, 03h
    int 10h

    call _lineaNueva

    mov ah, 09h
    mov dx, Output16
    int 21h

    ;imprimir derivada de x5
    mov al, [n_x5]
    mov bl, 5
    mul bl
    mov [der_x5], al

    mov ah, 02h
    mov dl, [s_x5]
    add dl, 30h
    int 21h

    ;mensaje
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

    ;imprimir derivada de x4
    mov al, [n_x4]
    mov bl, 4
    mul bl
    mov [der_x4], al

    mov ah, 02h
    mov dl, [s_x4]
    add dl, 30h
    int 21h

    ;mensaje
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

    ;mensaje
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

    ;mensaje
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

    ;mensaje
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

    mov ah, 01h
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

    xor ax, ax  ;limpiar registros
    ;imprimiendo integral de x5
    mov bl, 6
    mov al, [n_x5]
    div bl
    mov [int_x5], al

    mov ah, 02h
    mov dl, [s_x5]
    add dl, 30h
    int 21h

    ;mensaje
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

    ;mensaje
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

    ;mensaje
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

    ;mensaje
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

    ;mensaje
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

    mov ah, 01h
    int 21h
    cmp al, 30h             
    je _start

    ret

_signoPositivo:
    mov ah, 09h
    mov dx, positivo
    int 21h

    ret

_signoNegativo:
    mov ah, 09h
    mov dx, negativo
    int 21h

    mov ah, 01h
    int 21h
    cmp al, 30h             
    je _ingresarCoeficientes

    ret

_noEsNumero:
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

_noDisponible:
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

_Salir:
    call _lineaNueva
    call _lineaNueva

    mov ah, 09h
    mov dx, Output22
    int 21h

    int 20h

    ret

_opcionInvalida:
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
    

_limpiarPantalla:
    mov ah,00h             
    mov al, 03h
    int 10h
    ret

_lineaNueva:
    mov ah, 09h
    mov dx, NuevaLinea
    int 21h
    ret

_Escape:
    int 20h
    ret




    




   



