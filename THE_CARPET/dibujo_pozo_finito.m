function [x,pozo] = dibujo_pozo_finito()

% Definición de los límites del pozo y el valor del potencial
x_min = -5;
x_max = 5;
V_inside = -50; % Potencial dentro del pozo
V_outside = 0;  % Potencial fuera del pozo

x = linspace(x_min - 5, x_max + 5, 1000);

pozo = V_inside * (x >= x_min & x <= x_max) + V_outside * (x < x_min | x > x_max);
