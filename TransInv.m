function [ inversed_T ] = TransInv( T )
[ RotationMatrix, p ] = TransToRp( T );
inversed_T = [transpose(RotationMatrix),-transpose(RotationMatrix)*p;0,0,0,1];
end

%Takes an element of SE(3) and returns the inverse.