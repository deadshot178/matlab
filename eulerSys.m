function [t,w] = eulerSys(f,range,iv,h)
    % input f is a vector-valued function containing the system of differential equations
    % input range is a vector of length 2 containing an initial time and a final time
    % input iv is a vector containing the initial conditions for each dependent variable
    % input h is a scalar step size
    % output t is a column vector containing the times at which we have solution approximations
    % output w is a matrix whose columns are the approximations of the different dependent variables

    % Set up an evenly spaced array for t
    t = (range(1):h:range(2))';

    % Preallocate the solution matrix w
    w = zeros(length(t), length(iv));

    % Input the initial conditions into the first row of w
    w(1,:) = iv;

    % Run through Euler's method to fill in the remaining rows of w
    for i = 1:(length(t)-1)
        w(i+1,:) = w(i,:) + h * f(t(i), w(i,:));
    end
end
