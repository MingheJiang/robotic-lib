function [ V ] = MatrixLog6( T )
[ RotationMatrix, p ] = TransToRp( T );
if RotationMatrix == eye(3)
    w = [0;0;0];
    v = p/norm(p);
    theta = norm(p);
    S = [w;v];
    V = S*theta;
elseif trace(RotationMatrix) == -1
    theta = pi;
    bracket_w = log(RotationMatrix);
    G_inverse = (1/theta)*eye(3)-0.5*bracket_w+((1/theta)-0.5*cot(theta/2))*(bracket_w)^2;
    v = G_inverse*p;
    [ w ] = so3ToVec( bracket_w );
    S = [w;v];
    V = S*theta;
else
    theta = acos((trace(RotationMatrix)-1)/2) ;
    bracket_w = 0.5*(RotationMatrix-transpose(RotationMatrix))/(sin(theta));
    [ w ] = so3ToVec( bracket_w );
    G_inverse = (1/theta)*eye(3)-0.5*bracket_w+((1/theta)-0.5*cot(theta/2))*(bracket_w)^2;
    v = G_inverse*p;
    S = [w; v];
    V = S*theta;
    
end
%Takes a T and returns the corresponding 6-vector of exponential
%coordinates S*theta
