% Time span
tspan = [0 5];

% Initial conditions [theta1, theta1_dot, theta2, theta2_dot]
y0 = [pi, 0, pi, 0];

% Solve the system using ode45
[t, w] = ode45(@myPendulum, tspan, y0);

% Lengths of the pendulum arms
L1 = 1;
L2 = 2;

% Position of the first arm
x1 = L1 * sin(w(:, 1));
y1 = -L1 * cos(w(:, 1));

% Position of the second arm
x2 = x1 + L2 * sin(w(:, 2));
y2 = y1 - L2 * cos(w(:, 2));

% Plotting the position of the end of the second pendulum arm
plot(x2, y2);
title('Position of the End of the Second Pendulum Arm');
xlabel('X Position');
ylabel('Y Position');
grid on;
