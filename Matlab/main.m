
a = input('Enter lower limit of the domain: ');

b = input('Enter upper limit of the domain: ');

N = input('Enter number of grid points: ');

numerovec = input('Enter number of eigenfunctions: ');

[energies,vec,h] = Diferenciasfinitas(a,b,N,numerovec);

tramos=N;

[area] = regla_Simpson(vec,h,numerovec);

[vecnorm]=normalizacion(vec,area,numerovec,tramos);

v=linspace(a,b,tramos-2);

figure

for i=1 : numerovec

    plot(v,vecnorm(:,i))

    hold on

    legendInfo{i} = sprintf('Funcion de onda %d', i);

end

legend(legendInfo);

error=calculo_error(v,vecnorm,numerovec,b);

energias=zeros(numerovec,1);

for i=1 : numerovec

    energias(i)=((i^2 * pi^2) / (8 * b^2))-50;

end

error_2=error_energia(energias,energies,numerovec);





