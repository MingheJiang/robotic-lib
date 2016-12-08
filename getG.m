function [ G ] = getG( Ixx,Ixy,Ixz,Iyy,Iyz,Izz,m  )
Ib = [Ixx,Ixy,Ixz;Ixy,Iyy,Iyz;Ixz,Iyz,Izz];
G = [Ib,zeros(3,3);zeros(3,3),m*eye(3)];
end

