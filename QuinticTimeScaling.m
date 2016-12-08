function [ s1,s2,s3 ] = QuinticTimeScaling( T, t)
a0 = 0;
a1 = 0;
a2 = 0;
a3 = 10/(T^3);
a4 = -15/(T^4);
a5 = 6/(T^5);
s1 = a0 + a1*t + a2*(t^2) + a3*(t^3)+a4*(t^4)+a5*(t^5);
s2 = a1 +  2*a2*t + 3*a3*(t^2)+4*a4*(t^3)+5*a5*(t^4);
s3 = 2*a2 + 6*a3*t+12*a4*(t^2)+20*a5*(t^3);
end

%Takes a total travel time T and the current time t and returns the path
%parameter s corresponding to a motion that begins and ends at zero
%velocity and zero acceleration.
