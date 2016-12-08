function [ B ] = ForwardDynamicsTrajectory(theta0,dtheta0,torqueset,timestep,T,g,Ftip,S, M, G )
N = T/timestep;
torque0 = torqueset(1,:);
thetacurrent = theta0;
dthetacurrent = dtheta0;
[ddthetacurrent0] = ForwardDynamics( g, theta0, dtheta0, Ftip, S, M, G, torque0);
ddthetacurrent = transpose(ddthetacurrent0);
B = [];
for i = 2: N+1
    [theta,dtheta] = EulerStep( thetacurrent, dthetacurrent, ddthetacurrent, timestep);
    A = [theta,dtheta];
    thetacurrent = theta;
    dthetacurrent = dtheta;
    torque = torqueset(i,:);
    [ddthetacurrent] = transpose(ForwardDynamics( g, theta0, dtheta0, Ftip, S, M, G, torque));
    B = [B;A];
end
B = [theta0,dtheta0;B];
end
%This function takes an initial robot state (theta(0), dtheta(0)) and a
%joint force/torque history torque(k*timestep) and ?t is the timestep
%between points. It uses EulerStep to compute and return the robot state as
%a function of time, (theta(0), dtheta(0). It takes whatever else is needed
%as input.
