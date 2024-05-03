function [error_f] = calculo_error_finito(v,vecnorm,numerovec,energias,tramo)

n=length(v);

tijera= (v>= -5) & (v <= 5);

tijera_2= (v >= -8) & (v <= -5);

tijera_3= (v>= 5) & (v <= 8);

v_pozo= v(tijera);

v_izq=v(tijera_2);

v_der=v(tijera_3);

error=zeros(n,1); %Creamos el vector de calculo de errores

error_f=zeros(numerovec,1); %Este vector sera el que devolvamos 

alpha=zeros(numerovec);

beta=zeros(numerovec);

figure

if tramo==1

    for i=1 : numerovec

    beta(i)=sqrt(2*abs(energias(i)));

    if mod(i,2)~=0

        f=@(x) 44.69*10^(19)*exp(beta(i).*x);

    else

        f=@(x) -44.69*10^(19)*exp(beta(i).*x);

    end

    a=f(v_izq); %Esto es una matriz de 1,n-2

    plot(v_izq,a)

    hold on
  
    a=transpose(a); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    c_izq= c(1:189);

    error(i)=abs(abs(a(i))-abs(c_izq(i))); %Calculamos el error punto por punto

    error_f(i)=max(error(i)); %Cogemos el maximo error cometido

    fprintf("El error máximo cometido a la izquierda del pozo para la funcion número %d es de %f\n",i,error_f(i))


    end

  tramo=tramo+1;

end

if tramo==2

    figure

    for i=1 : numerovec
   
      alpha(i)= sqrt(2*(abs(-50)-abs(energias(i))));

      if mod(i,2)~=0

       f=@(x) 0.44*cos(alpha(i).*x);

      else

          f=@(x) 0.44*sin(alpha(i).*x);

      end

    a=f(v_pozo); %Esto es una matriz de 1,n-2

    plot(v_pozo,a)

    hold on
  
    a=transpose(a); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    c_mid= c(189:812);

    error(i)=abs(abs(a(i))-abs(c_mid(i))); %Calculamos el error punto por punto

    error_f(i)=max(error(i)); %Cogemos el maximo error cometido

    fprintf("El error máximo cometido en el pozo para la funcion número %d es de %f\n",i,error_f(i))

    end

    tramo=tramo+1;

end

if tramo==3

    figure 

    for i=1 : numerovec

    beta(i)=sqrt(2*abs(energias(i)));

    f=@(x) 44.69*10^(19)*exp(-beta(i).*x);

    a=f(v_der); %Esto es una matriz de 1,n-2

    plot(v_der,a)

    hold on
  
    a=transpose(a); %La quiero como vector

    c=vecnorm(:,i); %Esto es un vector de n-2,1

    c_der= c(812:end);

    error(i)=abs(abs(a(i))-abs(c_der(i))); %Calculamos el error punto por punto

    error_f(i)=max(error(i)); %Cogemos el maximo error cometido

    fprintf("El error máximo cometido a la derecha del pozo para la funcion número %d es de %f\n",i,error_f(i))

    end

end

end