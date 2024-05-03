function error_energias_segun_paso_infinito(N_values, Vpot, a, b, numerovec)
    % Inicializar el vector de errores
    error_values = zeros(length(N_values), 1);

    % Calcular el error para cada valor de N
    for i = 1:length(N_values)
        % Calcular las soluciones numéricas
        [energies, ~, ~, ~, ~] = Diferenciasfinitas_infinito(Vpot,a,b,N_values(i),numerovec);
        
        % Calcular las soluciones analíticas
        [energies_anal] = energias_infinito_analiticas(numerovec,a,b);

        % hago la resta de las energias numericas - las analiticas y me
        % queda un vector fila con esta diferencia 
        errorvector = abs(transpose(energies)-energies_anal);

        %hago la media de los errores para esta N haciendo la media de
        %este vector
        error_values(i) = mean(errorvector);
    end

    % Crear una nueva figura
    figure;
    hold on;

    % Trazar el error en función de log(N)
    plot(log(N_values), log(error_values), 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('log(N)');
    ylabel('log(Error)');
    title('Error del método para las energías en función de N');
    legend;
    hold off;

    figure;
    hold on;

    % Trazar el error en función de N
    plot(N_values, error_values, 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('N');
    ylabel('Error');
    title('Error del método para las energías en función de N');
    legend;
    hold off;
end