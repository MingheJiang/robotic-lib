function [ torqueset ] = InverseDynamicsTrajectory( thetadthetaddthetatrajectory, timestep, Ftip, g,S,M,G,T )
N = T/timestep;
n = (size(thetadthetaddthetatrajectory,2))/3;
torqueset = [];
for i = 1:N+1
    theta_i = thetadthetaddthetatrajectory(i,1:n);
    dtheta_i = thetadthetaddthetatrajectory(i,n+1:2*n);
    ddtheta_i = thetadthetaddthetatrajectory(i,2*n+1:3*n);
    torque = InverseDynamics( g, theta_i, dtheta_i, ddtheta_i, Ftip, S, M, G );
    torqueset = [torqueset;torque];
end
end
%This function takes a robot trajectory specified as a set of N +1 points
%(theta(k*timestep),dthetak(k*timestep),ddtheta(k*timestep) and the timestep between points. The
%total time of the trajectory is T = N*timestep. The function also takes as input
%a set of N + 1 values of the form Ftip(k*timestep), allowing the specification of
%a time-varying set of endpoint forces. (By default these can be zero.)
%Other inputs are the gravity vector g and the description of the robot.
%The output of the function is a matrix with n columns and N + 1 rows,
%where the kth row of the matrix is torque(k*timestep) as computed by InverseDynamics.
