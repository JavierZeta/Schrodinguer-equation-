function[area] = integracion_trapecios(vec,a,b,tramos,h,numerovec)
% PROCEDIMIENTO
% Regla del Trapecio
% Usando tramos equidistantes en intervalo
%{
double suma 
double area
suma=(vec(1,1)+vec(tramos-2,1))/2;
for i = 2:tramos-3
    
   suma = suma + vec(i,1);
end
area = h*(suma);

% SALIDA
disp(['tramos: ', num2str(tramos)])
disp(['Integral: ', num2str(area)])
%}
double suma 
double area
suma=0;
area = zeros(numerovec);
for j=1:numerovec
   
for i = 2:tramos-2
  
   suma = suma + (vec(i-1,j)+vec(i,j))*h/2;
end
area(j)=suma;
suma=0;
end
% SALIDA
disp(['tramos: ', num2str(tramos)])
