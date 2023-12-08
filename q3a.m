% Define the function f(x)
f = @(x) sin(x.^2);

% Generate x-values for plotting
x = linspace(0, 5, 1000);
y = f(x);

% Generate 18 evenly spaced nodes
n = 18;
x_nodes = linspace(0, 5, n);
y_nodes = f(x_nodes);

% Compute the Lagrange Interpolating Polynomial p(x) using the nodes
p = @(x) 0;
for i = 1:n
    L = 1;
    for j = 1:n
        if i ~= j
            L = L .* (x - x_nodes(j)) / (x_nodes(i) - x_nodes(j));
        end
    end
    p = @(x) p(x) + y_nodes(i) * L;
end
y_p = p(x);

% Compute the error |f(x) - p(x)|
error = abs(y - y_p);
[max_error, max_error_idx] = max(error);
x_max_error = x(max_error_idx)

% Plot everything
figure;
plot(x, y, 'b', 'LineWidth', 2); % Plot f(x)
hold on;
plot(x, y_p, 'r--', 'LineWidth', 2); % Plot p(x)
plot(x_nodes, y_nodes, 'go', 'MarkerSize', 8); % Plot the nodes
plot(x_max_error, f(x_max_error), 'mx', 'MarkerSize', 10, 'LineWidth', 2); % Indicate the x value where the max error occurs
legend('f(x)', 'p(x)', 'Nodes', 'Max Error Location');
xlabel('x');
ylabel('y');
title('f(x) vs. p(x) with 18 evenly spaced nodes');
grid on;
hold off;
