function [ bracket_S ] = VecTose3( S )
w = S(1:3);
v = S(4:6);
bracket_w = VecToso3( w );
bracket_S = [bracket_w,v;0,0,0,0];
end
%Takes a 6-vector (representing a spatial velocity) and returns the
%corresponding 4x4 matrix, an element of se(3)
