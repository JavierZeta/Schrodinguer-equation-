function [Vpot] = potpozofinito(x)

    if abs(x) >5
        Vpot = 10;
    else 
        Vpot = 0;
    end
end