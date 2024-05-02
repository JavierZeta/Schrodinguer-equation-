function [error] = error_energia(energias,energies,numerovec)

error=zeros(numerovec,1);

for i=1 : numerovec

    error(i)=abs(energias(i)-energies(i));

    fprintf("El errör para la energía %d es de %f\n",i,error(i))

end

end