clearvars
f = @(v) [
    v(1)*exp(-2*v(2)) - 2*v(3) - 2;
    v(1)*exp(2*v(2)) + 2*v(3) - 3;
    v(1)*exp(3*v(2)) + 3*v(3) - 6
];
J = @(v) [
    exp(-2*v(2)), -2*v(1)*exp(-2*v(2)), -2;
    exp(2*v(2)), 2*v(1)*exp(2*v(2)), 2;
    exp(3*v(2)), 3*v(1)*exp(3*v(2)), 3
];
x0 = [1; 1; 1];
tol = 1e-6;
p = sysNewton(f, J, x0, tol);

a = p(1);
b = p(2);
c = p(3);
g = @(x) a*exp(b*x) + c*x;
x_vals = linspace(-3, 4, 400); % Adjust these values to cover the range you're interested in
y_vals = g(x_vals);
figure; % Create a new figure
plot(x_vals, y_vals, 'b-', 'LineWidth', 2); % Plotting g(x)
hold on; % Hold the plot for overlaying the points

% Plotting the given points
x_points = [-2, 2, 3];
y_points = [2, 3, 6];
plot(x_points, y_points, '.', 'MarkerSize', 25);

xlabel('x');
ylabel('y');
title('Plot of g(x) and Given Points');
legend('g(x) = ae^{bx} + cx', 'Given Points');
grid on;

hold off;
return
% f = @(v) [
%     v(a)*exp(-2*v(b))-2*v(c)-2;
%     v(a)*exp(2*v(b))+2*v(c)-3;
%     v(a)*exp(3*v(b))+3*v(c)-6
% ];
f = @(v) [
    v(1)*exp(-2*v(2))-2*v(3)-2;
    v(1)*exp(2*v(2))+2*v(3)-3;
    v(1)*exp(3*v(2))+3*v(3)-6
];
J = @(v) [
    exp(2*v(2)), 2*v(1)*exp(2*v(2)), 2;
    exp(3*v(2)), 3*v(1)*exp(3*v(2)), 3;
    exp(-2*v(2)), -2*v(1)*exp(2*v(2)), -2
];
sysNewton(f, J, [2;2;2], 1e-6)