function error_energias_segun_paso(N_values, Vpot, a, b, numerovec,hbar,m,omega)
    % Inicializar el vector de errores
    error_values = zeros(length(N_values), 1);

    % Calcular el error para cada valor de N
    for i = 1:length(N_values)
        % Calcular las soluciones numéricas y analíticas
        [energies, vec, h, x, z] = Diferenciasfinitas(Vpot, a, b, N_values(i), numerovec,hbar,m,omega);
        vecnorm = normalizacion(vec, energies, numerovec, N_values(i));
        [energies_anal] = energiasoscilador_analiticas(numerovec,a,b,N_values(i),hbar,m,omega);

        % hago la resta de las energias numericas - las analiticas y me
        % queda un vector fila con esta diferencia 
        errorvector = abs(transpose(energies)-energies_anal);
        %hago la media del los errores para esta N haciendo la media de
        %este vector
        error_values(i) = mean(errorvector);
    end

    % Crear una nueva figura
    figure;
    hold on;

    % Trazar el error en función de N
    plot(log(N_values), log(error_values), 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('log(N)');
    ylabel('log(Error)');
    title('Error del método en función de N');
    legend;
    hold off;

    figure;
    hold on;

    % Trazar el error en función de N
    plot(N_values, error_values, 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('N');
    ylabel('Error');
    title('Error del método en función de N');
    legend;
    hold off;
end