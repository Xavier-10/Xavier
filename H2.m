function [H2] = H2(s)
    H2=-s*(log(s)/log(2))-(1-s)*(log(1-s)/log(2));
end