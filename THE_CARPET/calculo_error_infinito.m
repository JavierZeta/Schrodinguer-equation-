function [error_f] = calculo_error_infinito(v,vecnorm,numerovec,b,a)

n=length(v);

error=zeros(n,1); %Creamos el vector de calculo de errores

error_f=zeros(numerovec,1); %Este vector sera el que devolvamos 

figure 

for i=1 : numerovec
  
    f=@(x) (sqrt(2/(b-a)))*sin((i*pi)/(b-a)*x);

    q=f(v);

    q=transpose(q); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    error(i)=abs(abs(q(i+1))-abs(c(i))); %Calculamos el error punto por punto

    error_f(i)=max(error(i)); %Cogemos el maximo error cometido

    fprintf("El error maximo cometido para la funcion numero %d es de %f\n",i,error_f(i))

end

end

