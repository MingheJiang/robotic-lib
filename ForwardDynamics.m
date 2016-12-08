function [ ddtheta ] = ForwardDynamics( g, theta, dtheta, Ftip, S, M, G, torque )
n = size(theta,2);
m = InertiaMatrix(theta,S,M,G);
c = CoriolisForces(theta,dtheta,S,M,G );
gtheta = GravityForces( g,theta,S,M,G );
JtrFtip = EndEffectorForces( Ftip, theta, S,M,G );
b = torque - c - gtheta - JtrFtip;
ddtheta = pinv(m)*(RotInv(b));
end
%This function computes ddtheta given theta, dtheta, torque, g, Ftip, and a
%description of the robot
