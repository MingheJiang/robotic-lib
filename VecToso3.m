function [ bracket_w ] = VecToso3( w )
    bracket_w = [0,-w(3),w(2);w(3),0,-w(1);-w(2),w(1),0];
end

%Takes a 3-vector (representing an angular velocity) and returns the 3 X 3
%skew-symmetric matrix version, an element of so(3).