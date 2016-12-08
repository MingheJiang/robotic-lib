function [ expT ] = MatrixExp6( V )
[ S, theta, w, v ] = AxisAng6( V );
if w == [0;0;0]
    expT = [eye(3),v;0,0,0,1];
else 
    [ bracket_w ] = VecToso3( w/theta );
    [ RotationMatrix ] = MatrixExp3( w );
    expT = [RotationMatrix,(eye(3)*theta+(1-cos(theta))*bracket_w+(theta-sin(theta))*bracket_w^2)*(v/theta);0,0,0,1];

end

%Takes a 6-vector of exponential coordinates S*theta and returns T that is
%achieved by traveling along/about the screw axis S a distance theta from
%an initial configuration T = I.