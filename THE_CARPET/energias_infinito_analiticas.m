function [energies_anal] = energias_infinito_analiticas(numerovec,a,b)
energies_anal=zeros(1,numerovec);
for i= 1:numerovec
    energies_anal(i)=((i^2 * pi^2) / (2 * (b-a)^2));
end