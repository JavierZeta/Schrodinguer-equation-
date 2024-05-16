%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pozo de potencial infinito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function main_pozoinfinito(a,b,N,numerovec)

Vpot = @(x) 0; %V(x)=0 en [a,b] e infinito en el resto del espacio

%sacamos las energías, los autovectores y el paso
[energies,vec,h,v,z] = Diferenciasfinitas_infinito(Vpot,a,b,N,numerovec);

area = regla_Simpson(vec,h,numerovec); %vector de areas, guarda las areas de cada vector solución

[vecnorm]=normalizacion(vec,area,numerovec,N);

%PLOT SOL. ANALITICAS JUNTAS

    figure
    hold on
for i=1:numerovec
    f=@(x) (sqrt(2/(b-a)))*sin(((i)*pi/(b-a))*x);
    plot(v,f(v)+2*i,'Linewidth',2,'DisplayName', sprintf('\\psi_%d', i));
    legend
    if i==numerovec
    lim_y=2*i+1;
    end

end
    title('Soluciones analíticas para el pozo infinito según el nivel de energía')
    xlabel('x')
    ylabel('\psi_n(x)')
    ylim([2,lim_y])
    xlim([a-1,b+1])
    % Graficar el potencial
    [x,pozo] = dibujo_pozo_infinito(a,b,N);
    plot(x, pozo, 'LineWidth', 1,'DisplayName','Pozo infinito','Color','k');
    hold off

%PLOT SOL. NUMÉRICAS JUNTAS

% Ploteamos las funciones 
figure
for i = 1:length(z)
    y = [2*i; vecnorm(:, z(i))+2*i; 2*i];
    plot(v, y, 'LineWidth', 2, 'DisplayName', sprintf('\\psi_%d', i));
    axis tight
    hold on;
end
xlabel('x', 'FontSize', 14)
ylabel('\psi_n(x)', 'FontSize', 14)
legend
title('Soluciones numéricas normalizadas según el nivel de energía', 'FontSize', 14)
    ylim([2,lim_y])
    xlim([a-1,b+1])
    % Graficar el potencial
    [x,pozo] = dibujo_pozo_infinito(a,b,N);
    plot(x, pozo, 'LineWidth', 1,'DisplayName','Pozo infinito','Color','k');
hold off;


%PLOTS SOLUCION ANALITICA VS NUMERICA POR NIVEL DE ENERGÍA
for i=1:numerovec
    f=@(x) (sqrt(2/(b-a)))*sin(((i)*pi/(b-a))*x);

    figure(i+2)
    hold on

    plot(v,f(v),'Linewidth',1,'DisplayName', sprintf('\\psi_%d', i));
    leyendas=sprintf('\\psi_%d', i);
    legend(leyendas)
    
    title('Solución analítica vs Solución aproximada')
    xlabel('x')
    ylabel('\psi_n(x)')
    
    plot(v,[0;vecnorm(:, z(i));0],'LineWidth', 1, 'DisplayName', sprintf('\\psi_%d aproximada', i));
    legend

    hold off
end

error = calculo_error_infinito(v,vecnorm,numerovec,b);

energias=zeros(numerovec,1);

for i=1 : numerovec

    energias(i)=((i^2 * pi^2) / (2 * (b-a)^2));

end

%PLOT ENERGÍA ANALÍTICA
    figure
    hold on
for n = 1:numerovec
    title('Niveles de energía analíticos')
    line([a, b], [energias(n),energias(n)], 'Color', 'b');
    text(a + 0.1, energias(n), ['E_', num2str(n)], 'Color', 'r');
    plot(x, pozo, 'LineWidth', 1,'Color','k');
    xlabel('x')
    ylabel('E_n')
    xlim([a-1,b+1])
    ylim([0,energias(numerovec)+1])
end
    hold off

%PLOT ENERGÍA NUMÉRICA
    figure
    hold on
for n = 1:numerovec

    title('Niveles de energía numéricos')
    line([a, b], [energies(n),energies(n)], 'Color', 'b');
    text(a + 0.1, energies(n), ['E_', num2str(n)], 'Color', 'r');
    xlabel('x')
    ylabel('E_n')
    plot(x, pozo, 'LineWidth', 1,'Color','k');
    xlabel('x')
    ylabel('E_n')
    xlim([a-1,b+1])
    ylim([0,energias(numerovec)+1])
end
    hold off

error_2=error_energia(energias,energies,numerovec);

energies

energias


end
