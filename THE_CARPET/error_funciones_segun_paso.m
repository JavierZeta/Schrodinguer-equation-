function [average_error]=error_funciones_segun_paso(N_values, Vpot, a, b, numerovec,hbar,m,omega)
    % Inicializar el vector de errores
        flag = input(['¿Qué metodo de integración quieres usar?\n\n' ...
    '1: Trapecios\n' ...
    '2: Simpson\n' ]);
     average_error = zeros(length(N_values), 1);
    % Calcular el error para cada valor de N
    for i = 1:length(N_values)
        % Calcular las soluciones numéricas y analíticas
        [~, vec, h, ~, ~] = Diferenciasfinitas_oscilador(Vpot, a, b, N_values(i), numerovec,hbar,m,omega);

        if  flag==1
            area = regla_trapecizoidal(vec,h,numerovec);
        
        elseif flag==2
            area = regla_Simpson_oscilador(vec,h,numerovec);
        else
            return;
        end
        
        vecnorm = normalizacion_oscilador(vec,area,numerovec, N_values(i));
        [psi_mat] = schrodinger_solutions_analiticas_errores(numerovec,a,b,N_values(i));

 %TO DO: restar los valores absolutos de vecnorm y psi_mat y obtener el
 %error cuadratico medio de cada autofunción
 % hacer la media de los errores cuadraticos medios para cada autofunción 
 
        % Initialize the error vector
        error_values = zeros(numerovec, 1);

        % Calculate the MSE for each eigenfunction
        for j = 1:numerovec
            diff = abs(abs(vecnorm(:,j)) - abs(psi_mat(:,j)));
            error_values(j) = mean(diff.^2);
        end
        
        % Calculate the average of the MSEs
        average_error(i) = mean(error_values);
    end

    % Crear una nueva figura
    figure;
    hold on;

    % Trazar el error en función de N
    plot(log(N_values), log(average_error), 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('log(N)');
    ylabel('log(Error)');
    title('Funciones error del método en función de N');
    legend;
    hold off;

    figure;
    hold on;

    % Trazar el error en función de N
    plot(N_values, average_error, 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('N');
    ylabel('Error');
    title('Funciones error del método en función de N');
    legend;
    hold off;
