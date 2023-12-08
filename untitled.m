% Define the function and its first five derivatives
f = @(x) 1./log(x);
fp = @(x) -1./(x.*log(x).^2);
f2p = @(x) 1./(x.^2.*log(x).^2) + 2./(x.^2.*log(x).^3);
f3p = @(x) -2./(x.^3.*log(x).^2) - 6./(x.^3.*log(x).^3) - 6./(x.^3.*log(x).^4);
f4p = @(x) (2.*(18.*log(x) + 11.*log(x).^2 + 3.*log(x).^3 + 12))./(x.^4.*log(x).^5);

% Define the interval [a, b]
a = 2;
b = 10^6;

% Plot the fourth derivative to visually inspect for maximum
x = linspace(a, b, 10000); % Generate a vector of points between a and b
y = f4p(x); % Evaluate the fourth derivative at these points
plot(x, y);
xlabel('x');
ylabel('Fourth derivative');
title('Plot of the fourth derivative of f(x)');

% Use MATLAB's max command to find the maximum value of the fourth derivative
[M, index] = max(y);
hold on;
plot(x(index), M, 'r*', 'MarkerSize', 10); % Mark the maximum value on the plot
hold off;

% Calculate n using the error bound formula, solving for n
error_bound = 0.4;
n = ceil((b - a)^5 / (180 * error_bound * M))^(1/4);

% Display the result
fprintf('The maximum value of the fourth derivative on [2, 10^6] is approximately %f\n', M);
fprintf('A sufficient number of subintervals n for the desired accuracy is %d\n', n);
