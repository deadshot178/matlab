% Define the function
f = @(x) cot(x) - 3;

% Use fzero to find the root with an initial guess of x1 = 3
[x, fval, exitflag] = fzero(f, 3);

% Display the results
disp(['x = ', num2str(x)]);
disp(['fval = ', num2str(fval)]);
disp(['exitflag = ', num2str(exitflag)]);
