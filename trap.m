function [T, error, error_h2] = trap(f, a, b, n)
    % Step size
    h = (b - a) / n;
    
    % Initialize the sum with the first and last terms
    sum = 0.5 * (f(a) + f(b));
    
    % Compute the sum of the midpoints
    for i = 1:(n-1)
        x = a + i * h;
        sum = sum + f(x);
    end
    
    % Calculate the trapezoid rule approximation
    T = h * sum;
    
    % Calculate the true value of the integral
    trueValue = integral(f, a, b);
    
    % Calculate the error
    error = abs(trueValue - T);
    
    % Calculate the error normalized by h^2
    error_h2 = error / h^2;
    fprintf("Trap error:")
    disp(error)
    fprintf("Trap error h2:")
    disp(error_h2)
end
