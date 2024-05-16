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

           error=calculo_error_finito_2(v,vecnorm,numerovec,energias,a,b);

        % hago la resta de las energias numericas - las analiticas y me
        % queda un vector fila con esta diferencia 
        errorvector= abs(energias-energies);
        %hago la media de los errores para esta N haciendo la media de
        %este vector

        error_values(i) = sqrt(mean(errorvector));

         error_values_f(i) = sqrt(mean(error));
         
    end

    % Crear una nueva figura
    figure;
    hold on;

    % Trazar el error en función de N
    scatter(log(h_rep), log(error_values),'DisplayName', 'Error','Marker', '.', 'MarkerEdgeColor', 'b');
    

    % Añadir etiquetas y leyenda
    xlabel('log(h)');
    ylabel('log(Error)');
    title('Error logarítmico del método para energías en función de h');
    legend;
    hold off;

    figure;
    hold on;

    % Trazar el error en función de h
    scatter(h_rep,error_values,'DisplayName', 'Error','Marker', '.', 'MarkerEdgeColor', 'b');

    % Añadir etiquetas y leyenda
    xlabel('h');
    ylabel('Error');
    title('Error del método para energías en función de h');
    legend;
    hold off;

    % Crear una nueva figura
    figure;
    hold on;

    % Trazar el error en función de h
    scatter(log(h_rep), log(error_values_f),'DisplayName', 'Error','Marker', '.', 'MarkerEdgeColor', 'b');

    % Añadir etiquetas y leyenda
    xlabel('log(h)');
    ylabel('log(Error)');
    title('Error logarítmico del método para funciones en función de h');
    legend;
    hold off;

    figure;
    hold on;

    % Trazar el error en función de h
    scatter(h_rep,error_values_f,'DisplayName', 'Error','Marker', '.', 'MarkerEdgeColor', 'b');

    % Añadir etiquetas y leyenda
    xlabel('h');
    ylabel('Error');
    title('Error del método para funciones en función de h');
    legend;
    hold off;
end