function mainerrores_finito(a,b,numerovec,minN,maxN,N)

v=linspace(a,b,N);

Vpot = potpozofinito(v);

if numerovec > minN 

    disp('error') 

    return;
else 

N_values = minN:maxN; %crea un vector que contiene todos los números enteros desde minN hasta maxN
error_energias_segun_paso_finito(N_values, Vpot, a, b, numerovec);

%error funciones

end