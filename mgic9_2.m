% Define the parameters
beta = 0.05;
gamma = 0.3;

% Write the anonymous function f
f = @(t, y) [-beta*y(1)*y(2); beta*y(1)*y(2) - gamma*y(2); gamma*y(2)].';

% Check the first output
t = 0; w = [99, 1, 0];
f1 = f(t, w); % Now f1 will be a row vector

% Check the second output
t = 0.1; w = [98.505, 1.465, 0.03];
f2 = f(t, w); % f2 will also be a row vector
