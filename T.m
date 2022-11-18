function [T]=T(x)
Y0=1e-06;
e0=0.5;
ed=0.02;
T =(e0-ed)*Y0+ed*x;

end