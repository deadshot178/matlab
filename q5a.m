beta = 0.004;
gamma = 0.15;

% Define the initial conditions
S0 = 99;  % 99% of the population is initially susceptible
I0 = 1;   % 1% of the population is initially infected
R0 = 0;   % 0% of the population is initially recovered

% Define the time span to solve the ODEs
tspan = [0 100];
% Use ode45 to solve the ODEs
[T, Y] = ode45(@SIRmodel, tspan, [S0; I0; R0]);

% Extract the solutions for S, I, and R
S = Y(:, 1);
I = Y(:, 2);
R = Y(:, 3);
susceptible_percentage_at_t100 = S(end)
% Plot the solutions
plot(T, S, 'b', T, I, 'r', T, R, 'g')
legend('S', 'I', 'R')
title('SIR Model')
xlabel('Time t')
ylabel('Populations')
axis([0 100 0 100])
function dYdt = SIRmodel(t, Y)
    beta = 0.004;
    gamma = 0.15;
    S = Y(1);
    I = Y(2);
    R = Y(3);
    dSdt = -beta * S * I;
    dIdt = beta * S * I - gamma * I;
    dRdt = gamma * I;
    dYdt = [dSdt; dIdt; dRdt];
end