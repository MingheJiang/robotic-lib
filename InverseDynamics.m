function [ torque ] = InverseDynamics(  g, theta, dtheta, ddtheta, Ftip, S, M, G )
n = size(theta,2);
dV0 = [0;0;0;g];
V0 = [0;0;0;0;0;0];
Vi1 = V0; %initial Vi-1 = V0
dVi1 = dV0; %initial dVi-1 = dV0
Ti_1i = [];
Vi = [];
dVi = [];
for i = 1:n
    S_i = S(:,i);
    temp = 4*(i-1)+1;
    M_i = M(temp:temp+3,:);
    if i == 1
        Mi_1i_i = M_i;
    else
        M_ip1 = M(temp-4:temp-1,:);
        Mi_1i_i = TransInv(M_ip1)*M_i;
    end
    A_i = StoA(M_i,S_i);
    theta_i = theta(i);
    dtheta_i = dtheta(i);
    ddtheta_i = ddtheta(i);
    exp_i = MatrixExp6( A_i*theta_i );
    Ti_1i_i = Mi_1i_i*exp_i;
    Tii_1_i = TransInv(Ti_1i_i);
    Vi_i = Adjoint(Tii_1_i)*Vi1 + A_i*dtheta_i;
    dVi_i = Adjoint(Tii_1_i)*dVi1 +bracket(Vi_i,A_i)+ A_i*ddtheta_i;
    Ti_1i =[Ti_1i;Ti_1i_i];
    Vi = [Vi,Vi_i];
    dVi = [dVi,dVi_i];
    
    Vi1 = Vi_i;
    dVi1 = dVi_i;
end

Ti_1i = [Ti_1i;eye(4)];
Ti1i = i_1iToi1i(Ti_1i);

Fi1 = Ftip;
Fi = [];
torque = [];
for i = n:-1:1
    tempG = 6*(i-1)+1;
    G_i = G(tempG:tempG+5,:);
    S_i = S(:,i);
    temp = 4*(i-1)+1;
    M_i = M(temp:temp+3,:);
    A_i = StoA(M_i,S_i);
    Vi_i = Vi(:,i);
    dVi_i = dVi(:,i);
    tempT = 4*i+1;
    Ti1i_i = Ti1i(tempT:tempT+3,:);
    Fi_i = RotInv(Adjoint(Ti1i_i))*Fi1 + G_i*dVi_i-RotInv(adv(Vi_i))*(G_i*Vi_i);
    torque_i = RotInv(Fi_i)*A_i;
    
    Fi = [ Fi_i,Fi];
    torque = [torque_i,torque];
    
    Fi1 = Fi_i;
end   
end
%This function computes the inverse dynamics of an n-joint serial chain.
%The output is a vector of joint forces/torques.
