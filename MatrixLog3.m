function [ r ] = MatrixLog3( RotationMatrix )
if RotationMatrix == eye(3)
    r = 'theta = 0, w is undefined';
elseif trace(RotationMatrix) == -1
    r = 'theta = pi, w has three feasible solutions';
else
    theta = acos((trace(RotationMatrix)-1)/2);
    bracket_w = (RotationMatrix-transpose(RotationMatrix))/(2*sin(theta));
    w = so3ToVec( bracket_w );
    r = w*theta;
end

%Takes an R and returns the corresponding 3-vector of exponential
%coordinates r