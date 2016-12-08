function [ gtheta ] = GravityForces( g,theta,S,M,G )
Ftip= [0;0;0;0;0;0];
ddtheta = [];
dtheta =[];
n = size(theta,2);
for j = 1:n
    ddtheta_j = 0;
    dtheta_j = 0;
    ddtheta =[ddtheta,ddtheta_j];
    dtheta = [dtheta,dtheta_j];
end 
gtheta = InverseDynamics(g, theta, dtheta, ddtheta, Ftip, S, M, G );
end
%This function computes the vector g(theta) using InverseDynamics, calling
%it once with dtheta = ddtheta = 0 and Ftip = 0.
