%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Pozo de potencial infinito
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vpot = @(x) 0; %V(x)=0 en [a,b] e infinito en el resto del espacio

a = input('Enter lower limit of the domain: ');
b = input('Enter upper limit of the domain: ');
N = input('Enter number of grid points: ');
numerovec = input('Enter number of eigenfunctions: ');

%sacamos las energías, los autovectores y el paso
[energies,vec,h,ejex,z] = Diferenciasfinitas(Vpot,a,b,N,numerovec);
energies

area = regla_Simpson(vec,h,numerovec) %vector de areas, guarda las areas de cada vector solución

vecnom = zeros([size(vec(:,1)) numerovec]);
 
 for i=1:numerovec
 vecnom(:,i) = vec(:,i)/area(i);
 end

area_check = regla_Simpson(vecnom,h,numerovec)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%solución analítica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure
    hold on
for i=1:numerovec
    f=@(x) (sqrt(2/b))*sin(((i)*pi/b)*x);
    plot(ejex,f(ejex),'Linewidth',2,'DisplayName', sprintf('\\psi_%d', i-1));
    legend
end
    title('Soluciones analíticas para el pozo infinito según el nivel de energía')
    xlabel('x')
    ylabel('\psi_n(x)')
    axis tight
    hold off


for i=1:numerovec
    f=@(x) (sqrt(2/b))*sin(((i)*pi/b)*x);

    figure(i+2)
    hold on

    plot(ejex,f(ejex),'Linewidth',1,'DisplayName', sprintf('\\psi_%d', i-1));
    leyendas=sprintf('\\psi_%d', i-1);
    legend(leyendas)
    
    title('Solución analítica vs Solución aproximada')
    xlabel('x')
    ylabel('\psi_n(x)')
    
    plot(ejex,[0; vecnom(:, z(i)); 0],'LineWidth', 1, 'DisplayName', sprintf('\\psi_%d aproximada', i-1));
    legend

    hold off
end
