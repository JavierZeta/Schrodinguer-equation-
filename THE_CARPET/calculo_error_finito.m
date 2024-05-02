function [error_f] = calculo_error_finito(v,vecnorm,numerovec,b)

n=length(v);

error=zeros(n,1); %Creamos el vector de calculo de errores

error_f=zeros(numerovec,1); %Este vector sera el que devolvamos 

figure 

for i=1 : numerovec
    
    if mod(i, 2) == 0

     f=@(x) 0.44*cos(0.1*x);

     a=f(v);

     plot(v,a)

     hold on
    else

    f=@(x) 0.4*sin(i*x);

    a=f(v); %Esto es una matriz de 1,n-2

    plot(v,a)

    hold on

    end
  
    a=transpose(a); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    error(i)=abs(abs(a(i+1))-abs(c(i))); %Calculamos el error punto por punto

    error_f(i)=max(error(i)); %Cogemos el maximo error cometido

    fprintf("El error máximo cometido para la funcion número %d es de %f\n",i,error_f(i))

end

end