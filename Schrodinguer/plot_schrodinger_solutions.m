function [psi_mat] = plot_schrodinger_solutions(numerovec,a,b,N)
    % Definir el rango de x
    x = linspace(a, b, N);

    % Crear una nueva figura
    figure;
    hold on;

    % Inicializar psi_mat (matriz)
    psi_mat = zeros(N, numerovec);

    % Calcular y trazar cada solución
    for i = 1:numerovec
        % Calcular la función de onda
        psi = (1/sqrt(2^(i-1) * factorial(i-1) * sqrt(pi))) * hermiteH(i-1, x) .* exp(-x.^2 / 2);
        psi_mat(:,i) = psi;  % Guardar los valores de psi en psi_mat

        % Trazar la función de onda
        plot(x, psi , 'DisplayName', ['n = ', num2str(i-1)]); 
    end

    % Añadir etiquetas y leyenda
    xlabel('x');
    ylabel('\psi_n(x)');
    title('Soluciones analíticas de la ecuación de Schrödinger para un oscilador armónico');
    legend;
    hold off;
end