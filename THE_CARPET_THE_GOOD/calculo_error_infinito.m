function [error_f] = calculo_error_infinito(v,vecnorm,numerovec,b)

error_f=zeros(numerovec,1); %Este vector sera el que devolvamos 

for i=1 : numerovec
  
    f=@(x) (sqrt(2/b))*sin(((i)*pi/b)*x);

    a=f(v);

    a=transpose(a); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    error=abs(abs(a(2:end-1))-abs(c)); %Calculamos el error punto por punto

     d=max(error(:,1));

    error_f(i)=d; %Cogemos el maximo error cometido

    fprintf("El error maximo cometido para la funcion numero %d es de %d\n",i,error_f(i))

end

end

