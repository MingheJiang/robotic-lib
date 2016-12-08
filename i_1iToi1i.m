
function [Ti1i] = i_1iToi1i(Ti_1i)
% T01, T12 ... to T10, T21
n = size(Ti_1i,1)/4; % How many T are saved
Ti1i = [];
for i=1:n
    temp = 4*(i-1)+1;
    Ti_1i_i = Ti_1i(temp:temp+3,:);
    temp_Ti1i = TransInv(Ti_1i_i);
    Ti1i = [Ti1i; temp_Ti1i];
end
end

