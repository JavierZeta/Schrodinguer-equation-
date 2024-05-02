function [Vpot] = potpozofinito(x)

    if abs(x) > 20
        Vpot = -50;
    else 
        Vpot = 0;
    end
end