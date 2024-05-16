function [funciones_anal] = funciones_infinito_analiticas(numerovec,a,b,N)

funciones_anal = zeros(N-2, numerovec);

v=linspace(a,b,N);

    for i= 1:numerovec
        psi = (sqrt(2/(b-a)))*sin(((i)*pi/(b-a))*v);
        funciones_anal(:,i)=psi(2:end-1);
    end

end

