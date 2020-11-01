clear all; clc;


Kx = [1.2 2 2 2];
Ky = [.8 1 1 1];
L = [144 17*12+6 14*12+6 144];
rx = 5.51; ry = 3.13;
E = 29000; Fy = 50; Ag = 35.2;

KL_r = max([Kx.*L/rx; Ky.*L/ry])
Fe = pi^2*E./(KL_r).^2;

for i = 1:numel(KL_r)
    if KL_r(i) <= 4.71*(E/Fy)^.5
        Fcr(i) = 0.658^(Fy/Fe(i)) * Fy;
    else
        Fcr(i) = .877*Fe(i);
    end
end

Pu = 0.9 * Fcr * Ag