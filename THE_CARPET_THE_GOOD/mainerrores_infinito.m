%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ERRORES Pozo de potencial infinito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function mainerrores_infinito(a,b,numerovec,minN,maxN)

Vpot = @(x) 0;

if numerovec > minN 
    disp('error') 
else 

N_values = minN:maxN; %crea un vector que contiene todos los números enteros desde minN hasta maxN

%error energías
error_energias_segun_paso_infinito(N_values, Vpot, a, b, numerovec)

%error funciones
error_funciones_segun_paso_infinito(N_values, Vpot, a, b, numerovec)

end