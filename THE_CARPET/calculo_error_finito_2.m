function  error=calculo_error_finito_2(v,vecnorm,numerovec,energias)
error_f = zeros(numerovec, 1); %Este vector sera el que devolvamos

a=funcion_a_trozos(v,numerovec,energias);

for i=1 : numerovec
  
    b=a(:,i); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    error=abs(abs(b)-abs(c)); %Calculamos el error punto por punto

    d=max(error(:,1));

    error_f(i,1)=d; %Cogemos el maximo error cometido

end

end