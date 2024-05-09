function error_energias_y_funciones_segun_paso_finito(N_values,a, b, numerovec)
    % Inicializar el vector de errores
    error_values = zeros(length(N_values), 1);

    error_values_f = zeros(length(N_values), 1);

    h_rep=zeros(length(N_values), 1);

    % Calcular el error para cada valor de N
    for i = 1:length(N_values)

        v=linspace(a,b,(N_values(i)-2));

        % Calcular las soluciones numéricas y analíticas
        [energies,vec,h] = Diferenciasfinitas_finito(a,b,N_values(i),numerovec);

        h_rep(i)=h;
        
       energias=zeros(numerovec,1);

           for k=1 : numerovec

    energias(k)=-50 + (k^2 * pi^2) / (8 * 5^2);

           end

           area = regla_Simpson(vec,h,numerovec);

           [vecnorm]=normalizacion(vec,area,numerovec,N_values(i));

           error=calculo_error_finito_2(v,vecnorm,numerovec,energias);

        % hago la resta de las energias numericas - las analiticas y me
        % queda un vector fila con esta diferencia 
        errorvector= abs(abs(energias)-abs(energies));
        %hago la media de los errores para esta N haciendo la media de
        %este vector

        error_values(i) = max(errorvector);

         error_values_f(i) = max(error);
         
    end

    % Crear una nueva figura
    figure;
    hold on;

    % Trazar el error en función de N
    plot(log(h_rep), log(error_values), 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('log(N)');
    ylabel('log(Error)');
    title('Error del método para energías en función de N');
    legend;
    hold off;

    figure;
    hold on;

    % Trazar el error en función de N
    plot(h_rep, error_values, 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('N');
    ylabel('Error');
    title('Error del método para energías en función de N');
    legend;
    hold off;

    % Crear una nueva figura
    figure;
    hold on;

    % Trazar el error en función de N
    plot(log(h_rep), log(error_values_f), 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('log(N)');
    ylabel('log(Error)');
    title('Error del método para funciones en función de N');
    legend;
    hold off;

    figure;
    hold on;

    % Trazar el error en función de N
    plot(h_rep, error_values_f, 'DisplayName', 'Error');

    % Añadir etiquetas y leyenda
    xlabel('N');
    ylabel('Error');
    title('Error del método para funciones en función de N');
    legend;
    hold off;
end