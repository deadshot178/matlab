% Define the RHS of the ODE as a function handle
f = @(t, y) (-2*t + y^2) - 7;

% Define the actual solution as a function handle
actual_solution = @(t) 2*t + 3*(1 - exp(-6*t)) ./ (1 + exp(-6*t));

% Define the range for t, from 0 to 0.5
range = [0, 0.5];

% Define the initial value for y
iv = 0;

% Define the step size
h = 0.1;

% Solve the IVP using Euler's method
[t_euler, w_euler] = myEuler(f, range, iv, h);

% Solve the IVP using the midpoint Runge-Kutta method
[t_rkmid, w_rkmid] = rkMid(f, range, iv, h);

% Calculate the actual solution values
t_actual = range(1):h:range(2);
y_actual = actual_solution(t_actual);

% Create a figure to hold the plots
figure;

% Plot the Euler's method solution
plot(t_euler, w_euler, '-o', 'DisplayName', 'Euler’s Method');

hold on; % Hold on to the current figure

% Plot the RK-mid method solution
plot(t_rkmid, w_rkmid, '-*', 'DisplayName', 'RK-mid Method');

% Plot the actual solution
plot(t_actual, y_actual, '-', 'DisplayName', 'Actual Solution');

% Add labels and legend
xlabel('t');
ylabel('y');
title('Q6 Part c');
legend('show');

% Release the hold on the figure
hold off;
