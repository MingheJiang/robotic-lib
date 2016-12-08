function [ trajectorylist ] = ScrewTrajectory( Xstart, Xend,T,N,method)
t = 0;
trajectorylist = Xstart;
while T-t >= 10^(-10)
    t = t + T/(N-1);
    if method == 3
        s = CubicTimeScaling( T,t );
    elseif method == 5
        s = QuinticTimeScaling( T,t );
    end
    A = MatrixLog6(TransInv(Xstart) * Xend);
    Xs = Xstart*MatrixExp6(A*s);
    trajectorylist = [trajectorylist, Xs];

end   
end

%Similar to JointTrajectory, except that it takes the initial end-effector
%configuration Xstart(SE(3)), the final configuration Xend, and returns the
%trajectory as a list of N matrices in SE(3) separated in time by T/(N-1).
%This represents a discretized trajectory of the screw motion from Xstart to Xend.