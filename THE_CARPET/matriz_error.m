function [diff_mat,maximo_error] = matriz_error(psi_mat, vecnorm, numerovec)
    % Inicializar diff_mat (matriz)
    diff_mat = zeros(size(psi_mat));
    maximo_error=zeros(1,numerovec);
    % Calcular la diferencia para cada x y para cada autofunción
    for i = 1:numerovec
        % Calcular la diferencia
        diff = vpa(abs(abs(psi_mat(:,i))) - vpa(abs(vecnorm(:,i)),30));
        maximo_error(1,i)=max(diff);
        diff_mat(:,i) = diff;  % Guardar los valores de diff en diff_mat
        
        fprintf("El error máximo cometido para la funcion número %d es de %f\n",i,maximo_error(i))
    end

end