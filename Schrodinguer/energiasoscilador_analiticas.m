function [energies_anal] = energiasoscilador_analiticas(numerovec,a,b,N,hbar,omega,m)
energies_anal=zeros(1,numerovec);
for i= 1:numerovec
    energies_anal(i)=(i-0.5)*hbar*omega;% el menos por 0.5-1 y el -1 porque no puedo guardar en la posicion 0
end