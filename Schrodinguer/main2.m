Vpot = @(x) 0.5*x.^2;

 hbar = 1;  % Constante de Planck reducida (en unidades naturales)
 m = 1;  % Masa (en unidades naturales)
 omega = 1;  % Frecuencia angular (en unidades naturales)
 %Poniendo estos valores alpha=1 recuerda que X=x/alpha

a = input('Enter lower limit of the domain: ');
b = input('Enter upper limit of the domain: ');
N = input('Enter number of grid points: ');
numerovec = input('Enter number of eigenfunctions: ');
[psi_mat] = schrodinger_solutions_analiticas(numerovec,a,b,N);

[energies,vec,h,x,z] = Diferenciasfinitas(Vpot,a,b,N,numerovec,hbar,m,omega);
energies
tramos=N;


area = regla_Simpson(vec,h,numerovec);
[area]

[vecnorm] = normalizacion(vec,area,numerovec,tramos);

plot_vecnorm(x,vecnorm, numerovec);

[diff_mat,maximo_error] = matriz_error(psi_mat, vecnorm, numerovec);




%[area] = integracion_trapecios(vecnorm,a,b,tramos,h,numerovec)
                                                                                                                                                        v=linspace(a,b,tramos-2);
%{ 
figure

for i=1 : numerovec

    plot(v,vecnorm(:,i))

    hold on
    legendInfo{i} = sprintf('Funcion de onda %d', i);

end

 xlabel('x', 'FontSize', 14)
 ylabel('\psi(x)', 'FontSize', 14)
 legend(legendInfo);
 
area = regla_Simpson(vec,h,numerovec);
[area]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%solución analítica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   figure
    hold on

for i=1:numerovec
    f=@(j) (sqrt(2/b))*sin(((i)*pi/b)*j);
    plot(x,f(x),'Linewidth',2,'DisplayName', sprintf('\\psi_%d', i-1));
    legend
end
    title('Soluciones analíticas para el pozo infinito según el nivel de energía')
    xlabel('x')
    ylabel('\\psi_n(x)')
    axis tight
    hold off

for i=1:numerovec
    f=@(j) (sqrt(2/b))*sin(((i)*pi/b)*j);

    figure(i+2)
    hold on

    plot(x,f(x),'Linewidth',1,'DisplayName', sprintf('\\psi%d', i-1));
    leyendas=sprintf('\psi%d', i-1);
    legend(leyendas)

    title('Solución analítica vs Solución aproximada')
    xlabel('x')
    ylabel('\\psin(x)')

    plot(x,[0; vecnorm(:, z(i)); 0],'LineWidth', 1, 'DisplayName', sprintf('\\psi%d aproximada', i-1));
    legend

    hold off
end
%}