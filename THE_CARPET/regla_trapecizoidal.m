function area = regla_trapecizoidal(vec,h,numerovec)
area=zeros(numerovec,1);
for i= 1:numerovec
columna=vec(:,i).^2;
area(i)=(h/2)*(vec(1,i)+vec(end,i)+2*sum(columna(2:end-1)));
area(i) = sqrt(area(i));
end
