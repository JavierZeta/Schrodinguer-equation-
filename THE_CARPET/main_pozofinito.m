%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pozo de potencial finito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function main_pozofinito(a,b,N,numerovec,m)

[energies,vec,h] = Diferenciasfinitas_finito(a,b,N,numerovec);

disp(energies)

if m==1

[area] = regla_Simpson(vec,h,numerovec);

[vecnorm]=normalizacion(vec,area,numerovec,N);

end

if m==2

[area]=regla_trapecizoidal(vec,h,numerovec);

[vecnorm]=normalizacion(vec,area,numerovec,N);

end

v=linspace(a,b,N-2);

figure

for i=1 : numerovec

    plot(v,vecnorm(:,i)+i)

    hold on

    legendInfo{i} = sprintf('Funcion de onda %d', i);

end

legend(legendInfo);
title("Funciones de onda numéricas")

tramo=1;

energias=zeros(numerovec,1);

for i=1 : numerovec

    energias(i)=(i^2 * pi^2)/(8 * 5^2)-50;

end

error=calculo_error_finito(v,vecnorm,numerovec,energias,a,b);

error_2 = error_energia(energias,energies,numerovec);

end

