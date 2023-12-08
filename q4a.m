% Define the system of equations using anonymous functions
mu = 0.5;
f1 = @(t, x) x(2);
f2 = @(t, x) mu * (1 - x(1)^2) * x(2) - x(1);
f = @(t, x) [f1(t, x), f2(t, x)]; % Ensure this returns a row vector

% Initial conditions and range
iv = [1; 1];
range = [0 25]; % Adjust the range to go from 0 to 25

% Step size
h = 0.01; % Adjust step size to 0.01

% Call the Euler method function
[t, w] = eulerSys(f, range, iv, h);

% Extract x(t) approximation at t=25
x_25 = w(end, 1);

% Plot x(t)
figure;
plot(t, w(:,1)); % Plot only the first component of w which corresponds to x(t)
title('Approximation of x(t) using Euler’s method');
xlabel('Time t');
ylabel('x(t)');
grid on;

% Display the approximation to x(25)
disp(['Approximation to x(25): ', num2str(x_25)]);
