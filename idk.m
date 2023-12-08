% Define the range for x and y values
x = linspace(-5, 5, 1000);
y1 = x.^2 - 12;
y2 = sqrt(x + 11);

% Plot the curves
figure;
plot(x, y1, 'b', 'LineWidth', 2); % Plot y = x^2 - 12
hold on;
plot(y2.^2 - 11, y2, 'r', 'LineWidth', 2); % Plot x = y^2 - 11
hold on;

% Define the points x1 and x2
x1 = [2; 2];
x2 = [5.2667; 5.0667];

% Plot the points x1 and x2 with solid black dots
plot(x1(1), x1(2), 'ko', 'MarkerSize', 5, 'LineWidth', 2, 'MarkerFaceColor', 'k');
hold on;
plot(x2(1), x2(2), 'ko', 'MarkerSize', 5, 'LineWidth', 2, 'MarkerFaceColor', 'k');
hold on;

% Label the points x1 and x2
text(x1(1), x1(2), 'x_1', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');
text(x2(1), x2(2), 'x_2', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right');

% Set the axis labels and title
xlabel('x');
ylabel('y');
title('Plot of y = x^2 - 12 and x = y^2 - 11');

% Display the grid
grid on;

% Show the plot
hold off;
