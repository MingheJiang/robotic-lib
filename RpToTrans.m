function [ T ] = RpToTrans( RotationMatrix, p )
T = [RotationMatrix,p;0,0,0,1];

end

%Takes an R and a position p and returns the corresponding homogeneous
%transformation matrix T