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
    plot(v,f(v),'Linewidth',2,'DisplayName', sprintf('\\psi_%d', i-1));
    legend
end
    title('Soluciones analíticas para el pozo infinito según el nivel de energía')
    xlabel('x')
    ylabel('\psi_n(x)')
    axis tight
    hold off

%PLOT SOL. NUMÉRICAS JUNTAS

% Ploteamos las funciones 
figure
for i = 1:length(z)
    y = [0; vec(:, z(i)); 0];
    plot(v, y, 'LineWidth', 1, 'DisplayName', num2str(i-1));
    hold on;
end
xlabel('x', 'FontSize', 14)
ylabel('\psi(x)', 'FontSize', 14)
legend
title('Soluciones numéricas normalizadas según el nivel de energía', 'FontSize', 14)
axis tight
hold off;


%PLOTS SOLUCION ANALITICA VS NUMERICA POR NIVEL DE ENRGÍA
for i=1:numerovec
    f=@(x) (sqrt(2/(b-a)))*sin(((i)*pi/(b-a))*x);

    figure(i+2)
    hold on

    plot(v,f(v),'Linewidth',1,'DisplayName', sprintf('\\psi_%d', i-1));
    leyendas=sprintf('\\psi_%d', i-1);
    legend(leyendas)
    
    title('Solución analítica vs Solución aproximada')
    xlabel('x')
    ylabel('\psi_n(x)')
    
    plot(v,[0; vecnorm(:, z(i)); 0],'LineWidth', 1, 'DisplayName', sprintf('\\psi_%d aproximada', i-1));
    legend

    hold off
end

error = calculo_error_infinito(v,vecnorm,numerovec,b,a);

energias=zeros(numerovec,1);

for i=1 : numerovec

    energias(i)=((i^2 * pi^2) / (2 * (b-a)^2));

end

error_2=error_energia(energias,energies,numerovec);

end
