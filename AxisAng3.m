function [theta, w] = AxisAng3(r)

theta = sqrt(r(1)^2+r(2)^2+r(3)^2);
w = [r(1)/theta;r(2)/theta;r(3)/theta];
end

%Takes a 3-vector of exponential coordinates for rotation and returns the unit
%rotation axis w and the rotation amount theta