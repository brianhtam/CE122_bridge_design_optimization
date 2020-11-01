%% centroid for I shape
clear all; clc;

b1 = 10; h1 = .75;   % bottom section
b2 = 10; h2 = .75;   % top section
b3 = .5; h3 = 48;   % web section
y = (b1*h1*h1/2 + b2*h2*(h1+h3+h2/2) + b3*h3*(h1+h3/2)) / (b1*h1+b2*h2+b3*h3)

%% Ix
Ix = (b1*h1^3+b2*h2^3+b3*h3^3)/12+ b1*h1*(y-h1/2)^2 + b3*h3*(y-(h1+h3/2))^2+...
    b2*h2*(y-(h1+h3+h2/2))^2

%% Sx
Sxc = Ix / (h1+h2+h3-y)
Sxt = Ix / y

%% Z
Yp = (h2*b2-h1*b1+2*h1*b3+h3*b3) / (2*b3);
Z = h1*b1*(Yp-h1/2) + h2*b2*(h1+h3+h2/2-Yp) + b3*(Yp-h1)*(Yp-h1)/2 + ...
    b3*(h1+h3-Yp)^2/2




