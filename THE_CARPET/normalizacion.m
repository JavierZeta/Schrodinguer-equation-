function[vecnorm] = normalizacion(vec,area,numerovec,tramos)
vecnorm=zeros(tramos-2,tramos,2);
for j=1:numerovec
    
    if area~=0
       
for i = 1:tramos-2
vecnorm(i,j)=vec(i,j)/sqrt(abs(area(j)));
end

    end
vecnorm=vecnorm(:,1:numerovec);

end