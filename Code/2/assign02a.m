clc, clear all 
format long 
format loose

GRAVITY = 6.67384e-11; % Newtons
MassofEarth = 5.97e24; % kilograms
MassofVenus = 4.87e24; % kilograms
MassofSun = 1.9891e30;% kilograms
DistancefromEarthtoSun = 149.6e9; % meters
DistancefromVenustoSun = 108.2e9; % meters

force1 = GRAVITY*((MassofEarth* MassofSun)/DistancefromEarthtoSun^2);
force2 = GRAVITY*((MassofVenus* MassofSun)/DistancefromVenustoSun^2);
disp(force1);
disp(force2);