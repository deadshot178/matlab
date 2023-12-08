% Define the right-hand side of the ODE using an anonymous function
rhsODE = @(t, y) (-2*t + y) - 7;

% Define the exact solution as an anonymous function
exactSolution = @(t) 2*t + (3*(1 - exp(-6*t))) ./ (1 + exp(-6*t));

% Define the parameters for the problem
initial_time = 0;
final_time = 0.5;
initial_value = 0; % y(0) = 0
step_size = 0.1;

% Solve the IVP using myEuler function
[t_euler, w_euler] = myEuler(rhsODE, [initial_time, final_time], initial_value, step_size);

% Solve the IVP using rkMid function
[t_rkMid, w_rkMid] = rkMid(rhsODE, [initial_time, final_time], initial_value, step_size);

% Calculate the exact value at t=0.5
exact_value = exactSolution(final_time);

% Calculate the errors
error_euler = abs(exact_value - w_euler(end));
error_rkMid = abs(exact_value - w_rkMid(end));

% Output the result for y(0.5) with 8 significant digits and the associated errors
fprintf('Euler approximation at t=0.5: %.8f\n', w_euler(end));
fprintf('Euler error at t=0.5: %.8e\n', error_euler);
fprintf('RK-Mid approximation at t=0.5: %.8f\n', w_rkMid(end));
fprintf('RK-Mid error at t=0.5: %.8e\n', error_rkMid);
