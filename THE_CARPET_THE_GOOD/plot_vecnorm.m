function plot_vecnorm(x,vecnorm, numerovec)

    figure;
    hold on;

    % Calcular y trazar cada solución
 
    for i = 1:numerovec
        % Trazar la función de onda
        plot(x,vecnorm(:,i)+i, 'DisplayName', ['n = ', num2str(i-1)]); 
    end
    %Ploteo el pozo de potencial 

    Vpot = @(x) 0.5 * x.^2;
    plot(x, Vpot(x), 'k--', 'LineWidth', 2, 'DisplayName', 'Potencial');

    % Establecer límite en el eje y
    ylim([0, 17]);

    %%%%%%%
    % Añadir etiquetas y leyenda
    xlabel('x');
    ylabel('vecnorm');
    title('Funciones normalizadas Del oscilador armónico ');
    legend;
    hold off;
end