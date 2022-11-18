function [Tbar]=Tbar(Pl,x,l)
gamma=5.3;
Tbar=(((gamma/sqrt(NN(Pl)))+sqrt((gamma^2)/NN(Pl)+4*T(Q(x,l))))^2)/4;
end