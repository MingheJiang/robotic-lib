function [ Js ] = FixedJacobian( S,theta )
joints = size(S,2);
Js=[];
for i=1:joints
    bracket_Si=VecTose3(S(:,i));
    k=i-1;
    if i==1
        Ji=se3ToVec(bracket_Si);
    else
        Ji_=bracket_Si;
        for j=1:k
            Sj=S(:,k-j+1);
            thetaj=theta(k-j+1);
            Vj = Sj*thetaj;
            Ji_=MatrixExp6(Vj)*Ji_*TransInv(MatrixExp6(Vj));
        end
         Ji=se3ToVec(Ji_);
    end
    Js=[Js,Ji];
end
end
%Takes a set of joint angles theta and screw axes Si for the robot joints
%expressed in the fixed space frame, and returns the space Jacobian Js(theta)
