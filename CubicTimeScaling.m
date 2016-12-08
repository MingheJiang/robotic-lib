function [ s ] = CubicTimeScaling( T,t )
a0 = 0;
a1 = 0;
a2 = 3/(T^2);
a3 = -2/(T^3);
s = a0 + a1*t + a2*(t^2) + a3*(t^3);
end

%Takes a total travel time T and the current time t and returns
%the path parameter s corresponding to a motion that begins and ends at zero velocity.