clear all; clc
z =1450 ; Fy = 50 ; Sx = 1250 ;  h = 26.5 ; tw =1.36 ; E = 29000;
bf =15.6 ; tf = 2.44 ;
lam_pf = 0.8*sqrt(E/Fy); lam_rf = 1.0*sqrt(E/Fy);


Mp = z* Fy
lamda = bf/2/tf;

if lamda <= lam_pf
    Mn = Mp/12
elseif lamda <= lam_rf
    Mn = (Mp - (Mp - 0.7*Fy*Sx)*((lamda-lam_pf)/(lam_rf-lam_pf)))/12
else
    kc = 4 / (h/tw)^0.5;
    if kc < 0.35
        kc = 0.35;
    elseif kc> 0.76
        kc = 0.76;
    end
    Mn = 0.9*E*kc*Sx / lamda^2/12
end
    