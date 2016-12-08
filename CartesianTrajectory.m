function [ trajectorylist ] = CartesianTrajectory( Xstart, Xend,T,N,method)
t = 0;
trajectorylist = Xstart;
[Rstart, pstart] = TransToRp( Xstart );
[Rend, pend] = TransToRp( Xend );
while T-t >= 10^(-10)
    t = t + T/(N-1);
    if method == 3
        s = CubicTimeScaling( T,t );
    elseif method == 5
        s = QuinticTimeScaling( T,t );
    end
    ps = pstart + s*(pend-pstart);
    A = MatrixLog3(RotInv(Rstart) * Rend);
    Rs = Rstart*MatrixExp3(A*s);
    Xs = RpToTrans( Rs, ps );
    trajectorylist = [trajectorylist; Xs];
end
csvwrite('CartesianTrajectory.csv',trajectorylist);
end

%Similar to ScrewTrajectory, except the origin of the end-effector frame follows
%a straight line, decoupled from the rotational motion.
