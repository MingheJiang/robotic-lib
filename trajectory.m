function [  trajectoryangle ] = trajectory( S, M, Xstart, Xend)
method = 5;
T = 2;
N = 101;
trajectorylist = CartesianTrajectory( Xstart, Xend,T,N,method);
theta0 = [0.1,0.1, 0.1,0.1, 0.1,0.1];
ew = 0.0017;
ev =  0.0005;
i = 0;
trajectoryangle = [0.1,0.1,0.1,0.1,0.1,0.1];
thetafinal = theta0;
while i < 100
    Tsd = trajectorylist((1+i*4):(4+i*4),1:4);
    thetafinal = IKinFixed( S, M, Tsd, thetafinal, ew, ev );
    i = i+1;
    trajectoryangle = [trajectoryangle;thetafinal];
end
csvwrite('trajectoryangle.csv',trajectoryangle);
end
% use functions to get the angles of joints
