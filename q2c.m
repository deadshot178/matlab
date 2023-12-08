% Define the function to integrate
f = @(x) exp(-x.^3);

% Define the range for the integral
a = 1;
b = 3;

% Initialize an array to store the results for different n
results = zeros(4, 1);
nodes = [5, 10, 20, 40];

% Evaluate the integral for each number of nodes
for i = 1:length(nodes)
    % Get the base points and weight factors
    [xx, ww] = gaussquad(nodes(i), a, b);
    
    % Compute the weighted sum of the function values at the base points
    integral = sum(ww .* f(xx));
    
    % Store the result
    results(i) = integral;
end

% Display the results to 16 decimal places
for i = 1:length(results)
    fprintf('n = %d: %.*f\n', nodes(i), 16, results(i));
end
