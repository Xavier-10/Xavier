function [deltaT]=deltaT(Pl,x,l)
gamma=5.3;
deltaT=gamma/sqrt(Tbar(Pl,x,l)*NN(Pl));
end
