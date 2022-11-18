function [Q]=Q(x,l)
Y0=1e-06;
Q = 1-(1-Y0)*exp(-etar(x)*l);

end