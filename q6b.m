% Define the RHS of the ODE as a function handle
f = @(t, y) (-2*t + y^2) - 7;

% Define the range for t, from 0 to 0.5
range = [0, 0.5];

% Define the initial value for y
iv = 0;

% Define the step size
h = 0.1;

% Call the rkMid function with the defined inputs
[t, w] = rkMid(f, range, iv, h)

% Display the approximation to y(0.5)
disp(['The approximation to y(0.5) is ', num2str(w(end))]);
