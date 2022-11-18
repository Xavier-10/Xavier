function [Y]=Y(y0,eta)
n=10000;
Y = 1-(1-y0)*(1-eta)^n;
end

