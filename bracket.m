function [ bracket_ab ] = bracket( a,b )
w1 = a(1:3);
v1 = a(4:6);
bracketw1 =  VecToso3(w1);
bracketv1 =  VecToso3(v1);
temp = [bracketw1,zeros(3,3);bracketv1,bracketw1];
bracket_ab = temp*b;
end

