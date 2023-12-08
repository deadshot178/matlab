clc
clear
% Define the function and its derivative
f = @(x) sqrt(x);
f_prime_exact = 1/6;  % The exact derivative at x = 9

% Define the x value and h values
x = 9;
h_values = [2^(-5), 2^(-40)];

% Initialize a vector to store errors
errors = zeros(size(h_values));

% Calculate errors for each h
for i = 1:length(h_values)
    h = h_values(i);
    
    % Centered difference approximation
    f_prime_approx = (f(x + h) - f(x - h)) / (2 * h);
    
    % Calculate the absolute error
    errors(i) = abs(f_prime_exact - f_prime_approx);
end

% Display the results in scientific notation with three significant digits
fprintf('The error associated with h = 2^(-5) is approximately %1.3e\n', errors(1));
fprintf('The error associated with h = 2^(-40) is approximately %1.3e\n', errors(2));

% Compare the errors
if errors(2) < errors(1)
    fprintf('The error for h = 2^(-40) is smaller, indicating better accuracy.\n');
else
    fprintf('The error for h = 2^(-40) is larger, indicating worse accuracy due to numerical precision limitations.\n');
end
