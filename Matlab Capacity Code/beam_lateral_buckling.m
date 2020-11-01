clear all; clc

Lb = 25*12;
E = 29000; Fy = 50;
A = 115; tf = 2.44; bf = 15.6; h = 26.5; tw = 1.36 ; d = 33.2; Cb = 1.14;

ry = 0; %% if do not know, ry = 0
rts = 0;    %% if do not know, rts = 0
J = 0;  %% if do not know, J = 0
Sx = 1250; %% if do not know, Sx = 0
Z = 0;

h0 = d-tf;

if ry==0
    Iy = tf*bf^3/6;
    ry = (Iy/A)^.5;
end

if J == 0;
    J = 1/3*(bf*tf^3*2 + h*tw^3);
end

if Sx == 0
    y = (tf*2+h)/2;
    Ix = (bf*tf^3*2 + tw*h^3)/12+ bf*tf*(y-tf/2)^2*2;
    Sx = Ix / y;
end

if rts ==0
    Iy = tf*bf^3/6;
    rts = (Iy*h0/2/Sx)^.5;
end

if Z == 0
    y = (tf*2+h)/2;
    Z = tf*bf*(y-tf/2)*2 + h/2*tw*h/4*2;
end

Mp = Z * Fy;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Lp = 1.76*ry*(E/Fy)^.5;
Lr = 1.95*rts*E/(0.7*Fy)* (J/(Sx*h0)+((J/(Sx*h0))^2+6.76*(0.7*Fy/E)^2)^.5)^.5;

if Lb <= Lp
    disp('case 1');
    Mn = Mp;
elseif Lb <= Lr
    Mn = Cb*(Mp - (Mp-0.7*Fy*Sx)*((Lb-Lp)/(Lr-Lp)))
    if Mn >= Mp
        Mn = Mp;
    end
    disp('case 2');
else
    Mn = Cb * Sx*pi^2*E/(Lb/rts)^2* (1+0.078*J/Sx/h0*(Lb/rts)^2)^.5
    if Mn >= Mp
        Mn = Mp;
    end
    disp('case 3');
end

disp('Mn in feet');
Mn = Mn /12
Mu = 0.9 * Mn
    