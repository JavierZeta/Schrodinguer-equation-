function area = regla_Simpson(vec,h,numerovec)

area=zeros(numerovec,1);

for i= 1:numerovec

columna=vec(:,i).^2;

area(i)=(h/3)*(columna(1)+columna(end)+4*sum(columna(2:2:end-1))+2*sum(columna(3:2:end-2)));

end