function [ m ] = InertiaMatrix(theta,S,M,G)
g = [0;0;0];
n = size(theta,2);
Ftip= [0;0;0;0;0;0];
dtheta = [];
ddtheta = [];
m = [];
for j = 1:n
    dtheta_j = 0;
    dtheta = [dtheta,dtheta_j];
end
for i = 1:n
    for j = 1:n
        if j ~= i 
            ddtheta_j = 0;
        else
            ddtheta_j = 1;
        end
        ddtheta=[ddtheta,ddtheta_j];
    end
    Mi = InverseDynamics(g, theta, dtheta, ddtheta, Ftip, S, M, G );
    ddtheta = [];
    m = [m;Mi];
end 
end
% This function computes the numerical inertia matrix M(theta) of an n-joint
% serial chain at a given configuration theta