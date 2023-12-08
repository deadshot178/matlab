function [t,w] = rkMid(f,range,iv,h)
%input f is the RHS of the ODE
%input range is a vector [initial time, final time]
%input iv is an initial y-value
%input h is a step size
%output t is an array containing the times that correspond to the approximations in y
%output w is an array containing approximations to the solution of the IVP

%set up the time array
t = (range(1):h:range(2))';
N = length(t);

w = zeros(N, 1);

w(1) = iv;

for i=1:N-1
    k1 = f(t(i), w(i));
    k2 = f(t(i) + 0.5*h, w(i) + 0.5*h*k1);
    w(i+1) = w(i) + h*k2;
end
end