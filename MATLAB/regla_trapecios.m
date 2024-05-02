function integral = regla_trapecios(f,dx,xvals)

fvals=f(xvals);

integral=(dx/2)*(fvals(1)+fvals(end)+2*sum(fvals(2:end-1)));

end
