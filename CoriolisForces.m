function [ c ] = CoriolisForces( theta,dtheta,S,M,G )
g = [0;0;0];
n = size(theta,2);
Ftip= [0;0;0;0;0;0];
ddtheta = [];
for j = 1:n
    ddtheta_j = 0;
    ddtheta =[ddtheta,ddtheta_j];
end
c = InverseDynamics(g, theta, dtheta, ddtheta, Ftip, S, M, G );
end
%This function computes the vector c(theta,dtheta) of Coriolis and
%centripetal terms for a given theta and dtheta.
