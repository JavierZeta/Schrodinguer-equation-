%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pozo de potencial finito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function main_pozofinito(a,b,N,numerovec)

[energies,vec,h] = Diferenciasfinitas_finito(a,b,N,numerovec);

disp(energies)

[area] = regla_Simpson(vec,h,numerovec);

[vecnorm]=normalizacion(vec,area,numerovec,N);

v=linspace(a,b,N-2);

figure

for i=1 : numerovec

    plot(v,vecnorm(:,i)-i)

    hold on

    legendInfo{i} = sprintf('Funcion de onda %d', i);

end

[x,pozo]=dibujo_pozo_finito();

plot(x,pozo,"LineWidth",1,"DisplayName","Pozo finito","Color","k")

ylim([-5.5,1])

xlim([-8,8])

legend(legendInfo);
title("Funciones de onda numéricas en el pozo de potencial finito")
xlabel("x")
ylabel("\psi_n(x)")

tramo=1;

energias=zeros(numerovec,1);

for i=1 : numerovec

    energias(i)=(i^2 * pi^2)/(8 * 5^2)-50;

end

error=calculo_error_finito(v,vecnorm,numerovec,energias,a,b,N);

error_2 = error_energia(energias,energies,numerovec);

%PLOT ENERGÍA ANALÍTICA
    figure
    hold on
for n = 1:numerovec
    title('Niveles de energía analíticos en el pozo de potencial finito')
    line([-5, 5], [energias(n),energias(n)], 'Color', 'b');
    text(-4, energias(n), ['E_', num2str(n)], 'Color', 'r');
    plot(x, pozo, 'LineWidth', 1,'Color','k');
    xlabel('x')
    ylabel('E_n')
    ylim([energias(numerovec)-1,energias(numerovec)+1])
end

    xlim([-6,6])
    ylim([-50,energias(end)+0.1])
    hold off

%PLOT ENERGÍA NUMÉRICA
    figure
    hold on
for n = 1:numerovec

    title('Niveles de energía numéricos en el pozo de potencial finito')
    line([-5, 5], [energies(n),energies(n)], 'Color', 'b');
    text(-4, energies(n), ['E_', num2str(n)], 'Color', 'r');
    xlabel('x')
    ylabel('E_n')
    plot(x, pozo, 'LineWidth', 1,'Color','k');
    xlabel('x')
    ylabel('E_n')
end
   
    xlim([-6,6])
    ylim([-50,energies(end)+0.1])
    hold off

end

