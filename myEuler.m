function [t,w] = myEuler(f,range,iv,h)
%input f is the RHS of the ODE
%input range is a vector [initial time, final time]
%input iv is an initial value (the y-value at the initial time)
%input h is a step size
%output t is a column vector containing the times that correspond to the approximations in y
%output w is a column vector containing approximations to the solution of the IVP

%set up the time vector
t = (range(1):h:range(2))';
%Use the length of t to preallocate for w vector.  Be sure to set up w as a column vector (lots of rows, 1 column)
n = length(t);
w = zeros(n, 1);
w(1) = iv;
for i=1:n-1
    w(i+1) = w(i) + h*f(t(i), w(i));
end
% Fill in the w-vector with Euler's method.
% Hint: Use the length command to determine how many iterations to compute.  Computing this through h might result in roundoff error.



