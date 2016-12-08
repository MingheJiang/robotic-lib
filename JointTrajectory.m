function [ trajectory_matrix ] = JointTrajectory(theta_start,theta_end,T,N,method)
t = 0;
trajectory_matrix = theta_start;
while T-t >= 10^(-10)
    t = t + T/(N-1);
    if method == 3
        s = CubicTimeScaling( T,t );
    elseif method == 5
        s = QuinticTimeScaling( T,t );
    end
    theta_s = theta_start + s*(theta_end-theta_start);
    trajectory_matrix = [trajectory_matrix; theta_s];

end
csvwrite('JointTrajectory_5.csv',trajectory_matrix);
end

% Takes initial joint variables theta_start, final joint variables
% theta_end, the time of the motion T in seconds, the number of points N>=
% 2 in the discrete representation of the trajectory, and the time-scaling
% method (function QuinticTimeScaling or function CubicTimeScaling);and
% returns a trajectory as a matrix with N rows, where each row is an
% n-vector of joint angles at an instant in time. The first row is theta_start
% and the Nth row is theta_end. The elapsed time between each row is T/(N-1).
% The trajectory is a straight-line motion in joint space.