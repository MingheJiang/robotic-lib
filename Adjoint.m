function [ AdT ] = Adjoint( T )
[ RotationMatrix, p ] = TransToRp( T );
[ bracket_p ] = VecToso3( p );
AdT = [RotationMatrix,zeros(3);bracket_p*RotationMatrix,RotationMatrix];
end

%Takes a T and returns the 6 x 6 adjoint representation [AdT].