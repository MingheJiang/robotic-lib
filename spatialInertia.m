function [ G_i ] = spatialInertia( Ixx,Ixy,Ixz,Iyy,Iyz,Izz )
Ib = [Ixx,Ixy,Ixz;Ixy,Iyy,Iyz;Ixz,Iyz,Izz];
G_i = [Ib,zeros(3,3);zeros(3,3),eye(3)];
end

