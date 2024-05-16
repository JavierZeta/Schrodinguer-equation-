function [psi_mat] = schrodinger_solutions_analiticas_errores(numerovec,a,b,N)
    % Definir el rango de x
    x = linspace(a, b, N);

    % Crear una nueva figura

    % Inicializar psi_mat (matriz)
    psi_mat = zeros(N, numerovec);

    % Calcular y trazar cada solución
    for i = 1:numerovec
        % Calcular la función de onda
        psi = (1/sqrt(2^(i-1) * factorial(i-1) * sqrt(pi))) * hermiteH(i-1, x) .* exp(-x.^2 / 2);
        psi_mat(:,i) = psi;  % Guardar los valores de psi en psi_mat

end