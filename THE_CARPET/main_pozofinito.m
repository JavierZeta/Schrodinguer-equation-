%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pozo de potencial finito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function main_pozofinito(a,b,N,numerovec)

[energies,vec,h] = Diferenciasfinitas_finito(a,b,N,numerovec);

[area] = regla_Simpson(vec,h,numerovec);

[vecnorm]=normalizacion(vec,area,numerovec,N);

v=linspace(a,b,N-2);

figure

for i=1 : numerovec

    plot(v,vecnorm(:,i))

    hold on

    legendInfo{i} = sprintf('Funcion de onda %d', i);

end

legend(legendInfo);

error=calculo_error_finito(v,vecnorm,numerovec,b);

