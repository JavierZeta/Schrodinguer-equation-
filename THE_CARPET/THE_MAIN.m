%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MAIN GENERAL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

flag = input(['¿Qué potencial quieres analizar?\n' ...
    '1: Pozo de potencial infinito\n' ...
    '2: Pozo de potencial finito\n' ...
    '3: Oscilador armónico cuántico\n']);

a = input('Introduce el líminte inferior del dominio: ');

b = input('Introduce el líminte superior del dominio: ');

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