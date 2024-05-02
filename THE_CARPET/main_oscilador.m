%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Oscilador armónico cuántico
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function main_oscilador(a,b,N,numerovec)

Vpot = @(x) 0.5*x.^2;

 hbar = 1;  % Constante de Planck reducida (en unidades naturales)
 m = 1;  % Masa (en unidades naturales)
 omega = 1;  % Frecuencia angular (en unidades naturales)
 %Poniendo estos valores alpha=1 recuerda que X=x/alpha

[psi_mat] = schrodinger_solutions_analiticas(numerovec,a,b,N);

[energies,vec,h,x,z] = Diferenciasfinitas_oscilador(Vpot,a,b,N,numerovec,hbar,m,omega);

area = regla_Simpson_oscilador(vec,h,numerovec);

[vecnorm] = normalizacion_oscilador(vec,area,numerovec,N);



plot_vecnorm(x,vecnorm, numerovec);

[energies_anal] = energiasoscilador_analiticas(numerovec,hbar,omega);

%errores energías
error_2=error_energia(energies_anal,energies,numerovec);

%errores funciones
[~,maximo_error] = matriz_error(psi_mat, vecnorm, numerovec);



end