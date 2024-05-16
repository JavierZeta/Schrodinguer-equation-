function [Vpot] = potpozofinito(x)

    if abs(x) <5
        Vpot = -50;
    else 
        Vpot = 0;
    end
end