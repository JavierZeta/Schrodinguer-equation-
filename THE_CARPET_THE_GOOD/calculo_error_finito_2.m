function  error=calculo_error_finito_2(v,vecnorm,numerovec,energias,a,b)
error_f = zeros(numerovec, 1); %Este vector sera el que devolvamos

g=funcion_a_trozos(v,numerovec,energias,a,b);

for i=1 : numerovec

    j=g(:,i); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    error=abs(abs(j)-abs(c)); %Calculamos el error punto por punto

    d=max(error(:,1));

    error_f(i,1)=d; %Cogemos el maximo error cometido

end

end