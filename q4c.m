m_initial = 0.1536;
y0 = [0; 0; m_initial]; % Initial position, velocity, and mass

% Time span
tspan = [0 15];

% Solve ODE
[t, y] = ode45(@rocketODE, tspan, y0);

% Find the maximum altitude
[max_altitude, idx] = max(y(:,1));

% Print out the maximum altitude
fprintf('The maximum altitude reached by the rocket is: %.2f meters\n', max_altitude);

% Plot results
plot(t, y(:,1), 'o-');
title('Rocket Height vs. Time');
xlabel('Time (seconds)');
ylabel('Height (meters)');