function plot_hermite 
syms x
fplot(hermiteH(0:4,x))
axis([-2 2 -30 30])
grid on
ylabel('H_n(x)')
legend('H_0(x)', 'H_1(x)', 'H_2(x)', 'H_3(x)', 'H_4(x)', 'Location', 'Best')
title('Polinomios de Hermite')
end