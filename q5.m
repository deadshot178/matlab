clearvars
A = [
    4, -2, 1;
    4, 2, 1;
    9, 3, 1
];
b_vec = [2; 3; 6];

sol = A \ b_vec;

a = sol(1);
b = sol(2);
c = sol(3);
fprintf('a = %f\nb = %f\nc = %f\n', a, b, c);
p = @(x) a*x.^2 + b*x + c;


x_vals = linspace(-3, 4, 400); 
y_vals = p(x_vals);


figure; 
plot(x_vals, y_vals, 'b-', 'LineWidth', 2); % Plotting p(x)
hold on; 

% Plotting the given points
x_points = [-2, 2, 3];
y_points = [2, 3, 6];
plot(x_points, y_points, '.', 'MarkerSize', 25);

xlabel('x');
ylabel('y');
title('Plot of p(x) and Given Points');
legend('p(x) = ax^2 + bx + c', 'Given Points');
grid on;

hold off; % Release the plot
