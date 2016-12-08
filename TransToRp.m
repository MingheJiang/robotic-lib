function [ RotationMatrix, p ] = TransToRp( T )
RotationMatrix = T(1:3,1:3);

p = T(1:3,4);

end
%Takes a T and returns the corresponding R and p
