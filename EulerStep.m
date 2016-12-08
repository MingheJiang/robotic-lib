function [ thetaafter, dthetaafter ] = EulerStep( thetacurrent, dthetacurrent, ddthetacurrent, timestep )
thetaafter = thetacurrent + timestep*dthetacurrent;
dthetaafter = dthetacurrent + timestep*ddthetacurrent;
end
%This function takes the current state (theta(t),dtheta(t)), the current
%acceleration ddtheta(t), and the timestep, and returns the state after
%timestep