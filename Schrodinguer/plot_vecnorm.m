function plot_vecnorm(x,vecnorm, numerovec)
    % Crear una nueva figura
    figure;
    hold on;

    % Calcular y trazar cada solución
    for i = 1:numerovec
        % Trazar la función de onda
        plot(x,vecnorm(:,i), 'DisplayName', ['n = ', num2str(i)]); 
    end

    % Añadir etiquetas y leyenda
    xlabel('x');
    ylabel('vecnorm');
    title('Soluciones numéricas de la ecuación de Schrödinger para un oscilador armónico ');
    legend;
    hold off;
end