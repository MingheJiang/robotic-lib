function [ thetafinal ] = IKinFixed( S, M, Tsd, theta0, ew, ev )
thetalist=[theta0];
i = 0;
Tsb = FKinFixed(M, S, theta0);
Vb = MatrixLog6(TransInv(Tsb)*Tsd);
Vs = Adjoint(Tsb)*Vb;
ws = Vs(1:3);
vs = Vs(4:6);
while (norm(ws) > ew||norm(vs) > ev) &&(i < 100)
    if i == 0
        Js = FixedJacobian(S,theta0);
    else
        Js = FixedJacobian(S,thetaiplus1); 
       
    end
    m = size(Js,1);
    n = size(Js,2);
    Js_ = pinv(Js);
    if i == 0
        thetaiplus1 = theta0+transpose(Js_*Vs);
    else
        thetaiplus1 = thetaiplus1+transpose(Js_*Vs);
    end
    thetalist = [thetalist;thetaiplus1];
    i = i + 1;
    Tsb = FKinFixed(M, S, thetaiplus1);
    Vb = MatrixLog6(TransInv(Tsb)*Tsd);
    Vs = Adjoint(Tsb)*Vb;
    ws = Vs(1:3);
    vs = Vs(4:6); 

end
lastguess = size(thetalist,1);
thetafinal = thetalist(lastguess,:);

csvwrite('fileq.csv',thetalist);
end

%Takes a set of screw axes Si for the robot joints expressed in the
%space frame, the end-effector zero configuration M, the
%desired end-effector configuration Tsd, an initial guess theta0 that is
%"close" to satisfying T(theta0) = Tsd, and small scalar values ¦Å_w > 0 and
%¦Å_v > 0 controlling how close the final solution thetak must be to the
%desired answer.There is a maximum number of iterations 'maxiterates'
%before stopping. Returns a matrix of joint angles.
