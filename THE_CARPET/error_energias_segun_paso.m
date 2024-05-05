function error_energias_segun_paso(N_values, Vpot, a, b, numerovec,hbar,m,omega)
    % Inicializar el vector de errores
    error_values = zeros(length(N_values), 1);
    h= zeros(length(N_values), 1);
    % Calcular el error para cada valor de N
    for i = 1:length(N_values)
        % Calcular las soluciones numéricas y analíticas
        [energies,~, h(i), x, z] = Diferenciasfinitas_oscilador(Vpot, a, b, N_values(i), numerovec,hbar,m,omega);
        [energies_anal] = energiasoscilador_analiticas(numerovec,hbar,omega);
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

    % Trazar el error en función de N
    plot(log(h), log(error_values), 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('log(h)');
    ylabel('log(Error)');
    title('Error del método en función del paso');
    legend;
    hold off;

    figure;
    hold on;

    % Trazar el error en función de N
    plot(h, error_values, 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('h');
    ylabel('Error');
    title('Error del método en función del paso');
    legend;
    hold off;
end
