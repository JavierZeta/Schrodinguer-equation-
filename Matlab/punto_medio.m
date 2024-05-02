function [area] = punto_medio(vec, a, b, tramos,numerovec)
 
    double suma 
    double area
    
   % Calcula el ancho de cada subintervalo
    h = (b - a) / tramos;

    % Inicializa el vector de áreas
    area = zeros(1, numerovec);

    % Bucle sobre cada elemento del vector
    for j = 1:numerovec
        % Inicializa la suma para este vector
        suma = 0;

        % Bucle sobre los tramos
        for i = 1:tramos-3
            % Calcula el punto medio del tramo
            punto_medio = (vec(i,j) + vec(i+1,j)) / 2;

            % Agrega el área del rectángulo al total
            suma = suma + punto_medio * h;
        end

        % Almacena el resultado en el vector de áreas
        area(j) = suma;
    end
end