% Define the parameters
gamma = 0.15;
beta = 0.00250;  % This is the beta value we found

% Define the initial conditions
S0 = 99;  % 99% of the population is initially susceptible
I0 = 1;   % 1% of the population is initially infected
R0 = 0;   % 0% of the population is initially recovered

% Define the time span to solve the ODEs
tspan = [0 100];

% Define the system of equations in a function


% Use ode45 to solve the ODEs with the found value of beta
[T, Y] = ode45(@(t, Y) SIRmodel(t, Y, beta, gamma), tspan, [S0; I0; R0]);

% Extract the solutions for S, I, and R
S = Y(:, 1);
I = Y(:, 2);
R = Y(:, 3);

% Plot the solutions
plot(T, S, 'b', T, I, 'r', T, R, 'g')
legend('S', 'I', 'R')
title(sprintf('SIR Model with \\beta = %.5f', beta))
xlabel('Time t')
ylabel('Populations')
axis([0 100 0 100])

% Print the maximum of I(t)
[max_infection, max_infection_index] = max(I);
fprintf('The maximum of I(t) is approximately %.2f%% at time t = %.2f\n', max_infection, T(max_infection_index));
function dYdt = SIRmodel(t, Y, beta, gamma)
    S = Y(1);
    I = Y(2);
    R = Y(3);
    dSdt = -beta * S * I;
    dIdt = beta * S * I - gamma * I;
    dRdt = gamma * I;
    dYdt = [dSdt; dIdt; dRdt];
end