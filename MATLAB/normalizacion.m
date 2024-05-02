function[vecnorm] = normalizacion(vec,area,numerovec,tramos)
vecnorm=zeros(tramos-2,tramos,2);
for j=1:numerovec
for i = 1:tramos-2
vecnorm(i,j)=vec(i,j)/area(j);
end
end