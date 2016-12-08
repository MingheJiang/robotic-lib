function [ Ts ] = FKinFixed( M, Si, thetai )
joints = size(thetai, 2);
multi = eye(4);
for i = 1:joints
    V = Si(1:6,i)*thetai(i);
    [ expT ] = MatrixExp6( V );
    multi = multi* expT;
end
Ts = multi*M;
end
%Takes M representing the position and orientation of the end-effector
%frame when the manipulator is at its home position (theta_i = 0 for all n
%joints of the robot); a list of screw axes Si for the n joints of the
%robot, expressed in a fixed world frame; and a list of joint coordinates
%theta_i; and returns T representing the end-effector frame when the joints
%are at the angles specified.
