function [ JtrFtip ] = EndEffectorForces( Ftip, theta, S,M,G )
dtheta = [];
ddtheta = [];
g = [0;0;0];
n = size(theta,2);
for j = 1:n
    ddtheta_j = 0;
    dtheta_j = 0;
    ddtheta =[ddtheta,ddtheta_j];
    dtheta = [dtheta,dtheta_j];
end
JtrFtip = InverseDynamics(g, theta, dtheta, ddtheta, Ftip, S, M, G );
end
%This function computes JT(theta)Ftip
