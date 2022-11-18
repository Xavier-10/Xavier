function [eta3]=eta(L)
global eta_det;

eta3 = eta_det*10.^(-0.02*L);

eta3
end