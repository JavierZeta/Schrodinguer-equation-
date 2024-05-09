function [error_f] = calculo_error_finito(v,vecnorm,numerovec,energias,a,b) 

error_f = zeros(numerovec, 1); %Este vector sera el que devolvamos

a=funcion_a_trozos(v,numerovec,energias,a,b);

figure

for i=1 : numerovec

    plot(v,a(:,i)+i)

    hold on

    legendInfo{i} = sprintf('Funcion de onda %d', i);
  
    b=a(:,i); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    error=abs(abs(b)-abs(c)); %Calculamos el error punto por punto

    d=max(error(:,1));

    error_f(i,1)=d; %Cogemos el maximo error cometido

    fprintf("El error máximo cometido para la funcion número %d es de %f\n",i,error_f(i))

end

legend(legendInfo);
title("Funciones de onda analíticas")

end