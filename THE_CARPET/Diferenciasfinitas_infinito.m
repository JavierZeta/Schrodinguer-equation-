function [energies,vec,h,ejex,z] = Diferenciasfinitas_infinito(Vpot,a,b,N,numerovec)
% Discretizamos el espacio
ejex = linspace(a, b, N);

%calculamos nuestro paso
h = ejex(2) - ejex(1);

% Creamos la matriz de la derivada segunda por diferencia finitas
T = zeros(N-2, N-2);
for i = 1:N-2
    for j = 1:N-2
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
V = zeros(N-2, N-2);
V= double(V);
for i = 1:N-2
    for j = 1:N-2
        if i == j
            V(i, j) = Vpot(ejex(i));
        else
            V(i, j) = 0;
        end
    end
end

% Hamiltoniano
H= -T / (2 * h^2) + V;

% Cálculo de los autovalores y autovectores
[vec, val] = eig(H);

% Ordenación de los autovalores y autovectores
[val, z] = sort(diag(val));


% Normalización de las energías
z = z(1:numerovec);
energies = val(z);
disp(energies);


% Ploteamos las funciones 
figure
for i = 1:length(z)
    y = [0; vec(:, z(i)); 0];
    plot(ejex, y, 'LineWidth', 3, 'DisplayName', num2str(i-1));
    hold on;
end
xlabel('x', 'FontSize', 14)
ylabel('\psi(x)', 'FontSize', 14)
legend
title('Normalized wavefunctions for a harmonic oscillator using finite difference method', 'FontSize', 14)
hold off;
