function [ Jb ] = BodyJacobian( B,theta )
joints = size(B,2);
Jb=[];
for i=1:joints
    bracket_Bi=VecTose3(B(:,joints-i+1));
    k=i-1;
    if i==1
        Ji=se3ToVec(bracket_Bi);
    else
        Ji_=bracket_Bi;
        for j=joints-i+2:joints
            Bj=B(:,j);
            thetaj=theta(j);
            Vj = Bj*thetaj;
            Ji_=TransInv(MatrixExp6(Vj))*Ji_*MatrixExp6(Vj);
        end
         Ji=se3ToVec(Ji_);
    end
    Jb=[Ji,Jb];
end
end
%Takes a set of joint angles theta and screw axes Bi for the robot joints
%expressed in the end-effector body frame, and returns the body Jacobian
%Jb(theta)
