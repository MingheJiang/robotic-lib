function [ trajectorylist4 ] = Trajectorythetadthetaddtheta(theta_start,theta_end,T,timestep)
t = 0;
N = (T/timestep)+1;
n = size(theta_start,2);
trajectorylist1 = theta_start;
trajectorylist2 = [];
trajectorylist3 = [];
trajectorylist4 = [];
for i = 1:n
    a = 0;
    trajectorylist2 = [trajectorylist2,a];
    trajectorylist3 = [trajectorylist3,a];
end
while T-t >= 10^(-10)
    t = t + timestep;
    [s1,s2,s3] = QuinticTimeScaling( T,t );
    theta_s = theta_start + s1*(theta_end-theta_start);
    dtheta_s = s2*(theta_end-theta_start);
    ddtheta_s = s3*(theta_end-theta_start);
    trajectorylist1 = [trajectorylist1; theta_s];
    trajectorylist2 = [trajectorylist2; dtheta_s];
    trajectorylist3 = [trajectorylist3; ddtheta_s];
end
trajectorylist4 = [trajectorylist4,trajectorylist1,trajectorylist2,trajectorylist3];
%csvwrite('Trajectorytheta.csv',trajectorylist1);
%csvwrite('Trajectorydtheta.csv',trajectorylist2);
%csvwrite('Trajectoryddtheta.csv',trajectorylist3);
end