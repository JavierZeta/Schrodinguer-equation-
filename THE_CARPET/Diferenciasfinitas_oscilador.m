function[energies,vec,h,x,z] = Diferenciasfinitas_oscilador(Vpot,a,b,N,numerovec,hbar,m,omega)


% Discretizamos el espacio
x = linspace(a, b, N);
%calculamos nuestro paso
h = x(2) - x(1);
% Creamos la matriz de la derivada segunda por diferencia finitas
T = zeros(N, N);
for i = 1:N
    for j = 1:N
        if i == j
            T(i, j) = -2;
        elseif abs(i-j) == 1
            T(i, j) = 1;
        else
            T(i, j) = 0;
        end
    end
end
%Creamos nuestra matriz de potencial
V = zeros(N, N);
V=double(V);
for i = 1:N
    for j = 1:N
        if i == j
            V(i, j) = Vpot(x(i));
        else
            V(i, j) = 0;
        end
    end
end

% Hamiltoniano

H= -hbar^2 * T / (2 * m * h^2) + V;  % Incluye las constantes en el Hamiltoniano

% Cálculo de los autovalores y autovectores
[vec, val] = eig(H); 

% Ordenación de los autovalores y autovectores
[val, z] = sort(diag(val));


% Normalización de las energías

z = z(1:numerovec);
energies=val(z);
%{
energies = val(z) / val(z(1));
disp(energies);
%}
% Ploteamos las funciones
%{
figure('Position', [10 10 1200 1000])
for i = 1:length(z)
    y = [0; vec(:, z(i)); 0];
    plot(x, y, 'LineWidth', 3, 'DisplayName', num2str(i-1));
    hold on;
end
xlabel('x', 'FontSize', 14)
ylabel('\psi(x)', 'FontSize', 14)
legend
title(' Wavefunctions for a harmonic oscillator using finite difference method', 'FontSize', 14)
hold off;
%}