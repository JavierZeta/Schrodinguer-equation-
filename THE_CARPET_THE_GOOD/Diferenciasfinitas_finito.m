function[energies,vec,h] = Diferenciasfinitas_finito(a,b,N,numerovec) %tetas
% Discretizamos el espacio
x = linspace(a, b, N);
%calculamos nuestro paso
h = x(2) - x(1);
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
V=double(V);
for i = 1:N-2
    for j = 1:N-2
        if i == j
            V(i, j) = potpozofinito(x(i));
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

end

