function [ Ai ] = StoA( Mi,Si )
invMi =  TransInv(Mi);
AdinvMi = Adjoint(invMi);
Ai = AdinvMi*Si;
end

%Takes a spacial velocity matrix Si and returns the matrix Ai