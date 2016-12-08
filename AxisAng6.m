function [ S, theta, w, v ] = AxisAng6( V )
w = V(1:3);
v = V(4:6);
if w == [0;0;0]
    S = [0;0;0;v/norm(v)];
    [theta] = norm(w);
else
    S = [w/norm(w);v/norm(w)];
    [theta] = AxisAng3(w);
end

%Takes a 6-vector of exponential coordinates for rigid-body motion,
%S*theta, and returns the screw axis S and the distance traveled
%along/about the screw axis theta