function [error_f] = calculo_error_finito(v,vecnorm,numerovec,energias,a,b,N) 

error_f = zeros(numerovec, 1); %Este vector sera el que devolvamos

e=funcion_a_trozos(v,numerovec,energias,a,b);

figure

for i=1 : numerovec

    plot(v,e(:,i)-i)

    hold on

    legendInfo{i} = sprintf('Funcion de onda %d', i);
  
    g=e(:,i); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    error=abs(abs(g)-abs(c)); %Calculamos el error punto por punto

    d=max(error(:,1));

    error_f(i,1)=d; %Cogemos el maximo error cometido

    fprintf("El error máximo cometido para la funcion número %d es de %f\n",i,error_f(i))

end

[x,pozo]=dibujo_pozo_infinito(a,b,N);

plot(x,pozo,"LineWidth",1,"DisplayName","Pozo finito","Color","k")

xlim([-8,8])

ylim([-5.5,1])

legend(legendInfo);
title("Funciones de onda analíticas en el pozo de potencial finito")
xlabel("x")
ylabel("\psi_n(x)")

end