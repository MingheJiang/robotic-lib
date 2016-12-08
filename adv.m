function [ adVi ] = adv( Vi )
w = Vi(1:3);
v = Vi(4:6);
bracketw = VecToso3(w);
bracketv = VecToso3(v);
adVi  = [bracketw,zeros(3,3);bracketv,bracketw];
end

