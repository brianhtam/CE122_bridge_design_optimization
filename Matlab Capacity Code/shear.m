I_roll = 0; %% 1 if rolled I shape, 0  others
stiffen = 0; %% 0 if unstiffened, other 1
E = 29000; Fy = 50;
Cv = 0; %% initial
h = 26.5; tw = 1.36; bf = 15.6; tf = 2.44; %a = 25; % spacing

if h/tw <= 2.24*(E/Fy)^.5
    phi = 1;
    Cv = 1;
else
    phi = 0.9;
end

if h/tw < 260 && stiffen == 0
    kv = 5;
else
    kv = 5 + 5/(a/h)^2;
    if a/h >3 || a/h > (260/(h/tw))^2
        kv = 5;
    end
end

if Cv == 1 || h/tw <= 1.1*(kv*E/Fy)^.5
    Cv = 1;
elseif h/tw <= 1.37 * (kv*E/Fy)^.5
    Cv = 1.1*(kv*E/Fy)^.5 / (h/tw);
else
    Cv = 1.51*E*kv / ((h/tw)^2*Fy);
end

Aw = (h + 2*tf)*tw;
Vn = 0.6*Fy*Aw*Cv;
Vu = phi*Vn

%% check stiffened
J = 2.5 / (a/h)^2 -2;
Iww = a * tw^3* J