function [ RotationMatrix ] = MatrixExp3( r )
[theta, w] = AxisAng3(r);
bracket_w = VecToso3( w );
RotationMatrix = eye(3)+sin(theta)*bracket_w+(1-cos(theta))*(bracket_w)^2;
end

%Takes a 3-vector of exponential coordinates r and returns R that is
%achieved by rotating about w by theta from an initial orientation R = I.

