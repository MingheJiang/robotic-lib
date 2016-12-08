function [ S ] = ScrewToAxis(q, s, h)
v = cross(s,-q)+h*s;
w = s;
S = [w;v];
end
%Takes a point q, a unit axis s and a screw pitch h and returns the
%corresponding screw axis S = (w,v), a normalized unit spatial velocity.
%The frame of this spatial velocity is the same frame that q and s are
%given in.
%This function only handles finite values of h with norm(w) = 1