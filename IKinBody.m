function [ matrix_jointangles ] = IKinBody( B, M, Tsd, theta0, ew, ev )
thetalist=[theta0];
i = 0;
Vb = MatrixLog6(TransInv(FKinBody(M, B, theta0))*Tsd);
wb = Vb(1:3);
vb = Vb(4:6);
while (norm(wb) > ew||norm(vb) > ev)&&(i < 100)
    if i == 0
        Jb = BodyJacobian(B,theta0);
    else
        Jb = BodyJacobian(B,thetaiplus1); 
    end
    m = size(Jb,1);
    n = size(Jb,2);
    if n > m
        Jb_ = transpose(Jb)*pinv(Jb*transpose(Jb));
    else
        Jb_= pinv(transpose(Jb)*Jb)*transpose(Jb);
    end
    if i == 0
        thetaiplus1 = theta0+transpose(Jb_*Vb);
    else
        thetaiplus1 = thetaiplus1+transpose(Jb_*Vb);
    end
    thetalist = [thetalist;thetaiplus1];
    i = i + 1;
    Vb = MatrixLog6(TransInv(FKinBody(M, B, thetaiplus1))*Tsd);
    wb = Vb(1:3);
    vb = Vb(4:6);

end
thetalist
csvwrite('Q.csv',thetalist);
end
%Takes a set of screw axes Bi for the robot joints expressed in the
%end-effector body frame, the end-effector zero configuration M, the
%desired end-effector configuration Tsd, an initial guess theta0 that is
%"close" to satisfying T(theta0) = Tsd, and small scalar values ¦Å_w > 0 and
%¦Å_v > 0 controlling how close the final solution thetak must be to the
%desired answer.There is a maximum number of iterations 'maxiterates'
%before stopping. Returns a matrix of joint angles.
