function[vecnorm] = normalizacion_oscilador(vec,area,numerovec,tramos)
vecnorm=zeros(tramos,tramos);
for j=1:numerovec
for i = 1:tramos
vecnorm(i,j)=vec(i,j)/area(j);
end
end