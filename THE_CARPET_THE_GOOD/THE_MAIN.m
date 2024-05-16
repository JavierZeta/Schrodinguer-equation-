%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MAIN GENERAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

flag = input(['¿Qué potencial quieres analizar?\n\n' ...
    '1: Pozo de potencial infinito\n' ...
    '2: Pozo de potencial finito\n' ...
    '3: Oscilador armónico cuántico\n' ...
    '8: Quiero ir directo a los errores\n']);

flag2= input(['\n¿Quieres ver el comportamiento de los errores de esta solución en concreto?\n\n' ...
    '4: Errores pozo de potencial infinito\n' ...
    '5: Errores pozo de potencial finito\n' ...
    '6: Errores oscilador armónico cuántico\n' ...
    '7: No quiero ver ningún gráfico de errores\n']);

if flag2 == 7
    if flag==8
        return; 
    end
end

a = input('Introduce el límite inferior del dominio: ');

b = input('Introduce el límite superior del dominio: ');

N = input('Introduce el número de puntos: ');

numerovec = input('Introduce el número de autofunciones deseadas: ');

if flag == 1
    main_pozoinfinito(a,b,N,numerovec)
end

if flag == 2
    main_pozofinito(a,b,N,numerovec)
end

if flag == 3
    main_oscilador(a,b,N,numerovec)
end

if flag2 == 4
    minN = input('Ingresa el mínimo número de puntos: ');
    maxN = input('Ingresa el máximo número de puntos: ');
    mainerrores_infinito(a,b,numerovec,minN,maxN)
end

if flag2 == 5
    minN = input('Ingresa el mínimo número de puntos: ');
    maxN = input('Ingresa el máximo número de puntos: ');
    mainerrores_finito(a,b,numerovec,minN,maxN,N)
end

if flag2 == 6
    minN = input('Ingresa el mínimo número de puntos: ');
    maxN = input('Ingresa el máximo número de puntos: ');
    mainerrores_oscilador(a,b,numerovec,minN,maxN)
end

