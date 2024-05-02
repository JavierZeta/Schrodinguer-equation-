function integral = regla_punto_medio(f,dx,xvals)
%hay tantos puntos medios como intervalos
nint = length(xvals)-1;
ck=zeros(1,nint);

%calculamos los puntos medios 
for i=1 : nint
ck(i)=(xvals(i)+xvals(i+1))/2;
end

%evaluamos la funcion en los puntos medios
fvals=f(ck);

integral= dx * sum(fvals);

end





