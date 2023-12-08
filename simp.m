function [S, error, error_h4] = simp(f, a, b, n)
    % Check if n is even; if not, print a warning
    if mod(n, 2) ~= 0
        error('Simpson''s rule requires an even number of intervals.');
        S = NaN;
        error = NaN;
        error_h4 = NaN;
        return;
    end
    
    % Step size
    h = (b - a) / n;
    
    % Compute x values
    x = a:h:b;
    
    % Compute y values
    y = f(x);
    
    % Simpson's coefficients
    coefficients = 2 * ones(1, n+1);
    coefficients(2:2:end-1) = 4;
    coefficients([1 end]) = 1;
    
    % Calculate the Simpson's rule approximation
    S = (h/3) * sum(y .* coefficients);
    
    % Calculate the true value of the integral
    trueValue = integral(f, a, b);
    
    % Calculate the error
    error = abs(trueValue - S);
    
    % Calculate the error normalized by h^4
    error_h4 = error / h^4;
    fprintf("Simp error: ")
    disp(error)
    fprintf("Simp error h4:")
    disp(error_h4)
end
