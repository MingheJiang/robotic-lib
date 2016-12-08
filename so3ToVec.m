function [ w ] = so3ToVec( bracket_w )

w = [bracket_w(3,2);bracket_w(1,3);bracket_w(2,1)];

end

%Takes a 3 x 3 skew-symmetric matrix (an element of so(3)) and returns the
%corresponding 3-vector