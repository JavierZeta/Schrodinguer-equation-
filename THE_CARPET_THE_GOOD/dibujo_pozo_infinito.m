function [x,pozo] = dibujo_pozo_infinito(a,b,N)

% Definición de los límites del pozo
x_min = a;
x_max = b;

% Crear un vector x que abarque el rango de los límites
x = linspace(x_min, x_max, N);

% Definir el potencial dentro y fuera del pozo
V_inside = 0; % Potencial dentro del pozo
V_outside = 1e6; % Potencial fuera del pozo (infinito)

% Crear un vector de potencial V que sea cero dentro del pozo y infinito fuera
pozo = V_inside * (x > x_min & x < x_max) + V_outside * (x <= x_min | x >= x_max);

end

