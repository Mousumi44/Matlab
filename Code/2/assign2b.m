clc, clear all 


format long
format compact

GRAVITY = 6.67384e-11; 

vector1 = [0.330e24, 4.87e24, 5.97e24];
vector2 = [57.9e9, 108.2e9, 149.6e9];
MassofSun = 1.9891e30; 

force = GRAVITY .* vector1 .* MassofSun ./ vector2.^2;
table = [vector1', vector2', force'];

disp("Gravitation force from sun to planets (Newtons):")
disp("Mass (kg)          Distant (m)          Force (N) ")
disp(table)







