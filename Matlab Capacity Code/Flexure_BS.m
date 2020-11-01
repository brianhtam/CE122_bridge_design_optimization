E=29000; %Specify Elastic Modulus
Fy=50; %Specify Fy
d=40;%specify depth in inches
tf=2.5;%specify flange thickness in inches
bf=40;%specify breadth of flange in inches
tw=2.5;%specify thickness of web in inches
h=d-tf*2;
d1=d-tf/2;
d2=bf/2;
A1=2*bf*tf;
A2=4*(h/2)*tw;
%Check Local buckling of Compression Flange
lambda=bf/tf;
lambdapf=1.12*sqrt((E/Fy));
lambdarf=1.4*sqrt(E/Fy);

%Bullshit Variables
Ixx=2*bf*(tf^3)/12 +bf*tf*(bf/2-tf)+2*tw*(h^3)/12 +h*tw*(h/2-tw); %Check the d with yanlong for Ad^2
beff=1.92*tf*sqrt(E/Fy)*(1-(0.38/(bf/tf))*sqrt(E/Fy));
Seff=Ixx/beff;
Zx=0.25*(bf*((h+2*tw)^2)-(bf-2*tf)*h^2); %Z outer rectangle- Z inner rectangle
Mp=Fy*Zx; %Mp=Fy*Zx
Sx=Ixx/(h/2-tf);
%Check for local buckling
if lambda<lambdapf
    result='Section is Compact, No Local Buckling'
    Mn=Mp;
elseif lambda>lambdapf && lambda<lambdarf
    result='Inelastic Flange Local Buckling'
    Mn=Mp-(Mp-Fy*Sx)*(3.57*bf/tf)*(sqrt(Fy/E)-4.0);
else
    result='Inelastic Flange Local Buckling'
    Mn=Fy*Seff;
end
Mn=num2str(0.9*Mn/12); %Mu in Kip foot, multiplied by safety factor 0.9
Mu=['Mu is ',Mn,' kipfoot']