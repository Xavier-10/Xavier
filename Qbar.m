function [Qbar]=Qbar(Pl,x,l)
gamma=5.3;
Qbar=(((gamma/sqrt(NN(Pl)))+sqrt((gamma^2)/NN(Pl)+4*Q(x,l)))^2)/4;
end
