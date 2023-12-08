% Time span
tspan = [0 100];

% Initial conditions [x(0), y(0)]
y0 = [100, 200];

% Solve the system using ode45
[t, y] = ode45(@competing_species, tspan, y0);

% Plotting the solutions
plot(t, y(:,1), '-o', t, y(:,2), '-o');
title('Population of Two Species');
xlabel('Time');
ylabel('Population Size');
legend('Species x', 'Species y');
grid on;

% Define the differential equations in a function
function dydt = competing_species(t, y)
    alpha = 0.03;
    beta = 0.0015;
    lambda = 0.025;
    gamma = 0.003;
    
    dydt = zeros(2,1); % Initialize output
    dydt(1) = alpha * y(1) - beta * y(1) * y(2); % x' = alpha * x - beta * x * y
    dydt(2) = lambda * y(2) - gamma * y(1) * y(2); % y' = lambda * y - gamma * x * y
end

