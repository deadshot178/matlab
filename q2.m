% x = [-2, -1, 3, 6];
% y = [-3, 1, -1, 2];
x = [1,3,7,12];
y=[3,2,4,8];
z = linspace(min(x), max(x), 1000); % 1000 points for a smooth curve

P = lagrangepoly(x, y, z);

figure;
plot(z, P, 'b-', 'LineWidth', 1.5); % Plot the polynomial in blue
hold on;
plot(x, y, '.', 'MarkerSize', 20); % Plot the data points with markers
line([min(z) max(z)], [0 0], 'Color', 'k', 'LineStyle', '-'); % x-axis
line([0 0], [min(P) max(P)], 'Color', 'k', 'LineStyle', '-'); % y-axis
xlabel('x');
ylabel('y');
title('Lagrange Interpolating Polynomial');
legend('Lagrange Polynomial', 'Data Points');
grid on;
hold off;
