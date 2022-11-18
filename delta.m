function [delta]=delta(Pl,x,l)
gamma=5.3;
delta=gamma/sqrt(Qbar(Pl,x,l)*NN(Pl));
end