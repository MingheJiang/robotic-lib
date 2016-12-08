function [ RotInv ] = RotInv( RotationMatrix )
RotInv = transpose(RotationMatrix);

end
%Takes an Rotaition matrix which is in SO(3) and returns its inverse.