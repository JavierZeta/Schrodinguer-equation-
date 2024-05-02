Vpot = @(x) 0.5*x.^2;

 hbar = 1;  % Constante de Planck reducida (en unidades naturales)
 m = 1;  % Masa (en unidades naturales)
 omega = 1;  % Frecuencia angular (en unidades naturales)
%Poniendo estos valores alpha=1 recuerda que X=x/alpha

a = input('Enter lower limit of the domain: ');
b = input('Enter upper limit of the domain: ');
minN = input('Enter minimun number of N: ');
maxN = input('Enter maximum number of N: ');
numerovec = input('Enter number of eigenfunctions: ');
if numerovec > minN 
    disp('error') 
else 
N_values = minN:maxN; %crea un vector que contiene todos los números enteros desde minN hasta maxN
error_energias_segun_paso(N_values, Vpot, a, b, numerovec,hbar,m,omega);

end