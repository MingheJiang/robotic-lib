function [ S ] = se3ToVec( bracket_S )
bracket_w =  bracket_S(1:3,1:3);
v =  bracket_S(1:3,4);
w = so3ToVec( bracket_w );
S = [w;v];
end

%Takes an element of se(3) and returns the corresponding spatial velocity
%as a 6-vector