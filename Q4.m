function [ B ] = Q4( theta0,dtheta0,T,timestep,Ftip,g,S,M,Ixx1,Ixy1,Ixz1,Iyy1,Iyz1,Izz1,m1,Ixx2,Ixy2,Ixz2,Iyy2,Iyz2,Izz2,m2,Ixx3,Ixy3,Ixz3,Iyy3,Iyz3,Izz3,m3,Ixx4,Ixy4,Ixz4,Iyy4,Iyz4,Izz4,m4,Ixx5,Ixy5,Ixz5,Iyy5,Iyz5,Izz5,m5,Ixx6,Ixy6,Ixz6,Iyy6,Iyz6,Izz6,m6 )
N = T/timestep;
torqueset = [];
for i = 1:N+1
    torque = [2,2,2,2,2,2];
    torqueset = [torqueset;torque];
end
[ G1 ] = getG( Ixx1,Ixy1,Ixz1,Iyy1,Iyz1,Izz1,m1  );
[ G2 ] = getG( Ixx2,Ixy2,Ixz2,Iyy2,Iyz2,Izz2,m2 );
[ G3 ] = getG( Ixx3,Ixy3,Ixz3,Iyy3,Iyz3,Izz3,m3  );
[ G4 ] = getG( Ixx4,Ixy4,Ixz4,Iyy4,Iyz4,Izz4,m4  );
[ G5 ] = getG( Ixx5,Ixy5,Ixz5,Iyy5,Iyz5,Izz5,m5  );
[ G6 ] = getG( Ixx6,Ixy6,Ixz6,Iyy6,Iyz6,Izz6,m6  );
G = [G1;G2;G3;G4;G5;G6];
[ B ] = ForwardDynamicsTrajectory(theta0,dtheta0,torqueset,timestep,T,g,Ftip,S, M, G );
csvwrite('B.csv',B);
end

