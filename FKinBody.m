function [ Tb ] = FKinBody( M, Bi, thetai )
joints = size(thetai, 2);
multi = eye(4);
for i = 1:joints
    V = Bi(1:6,i)*thetai(i);
    [ expT ] = MatrixExp6( V );
    multi = multi* expT;
end
Tb = M*multi;

end
%now the screw axes are expressed in the end-effector frame as Bi
