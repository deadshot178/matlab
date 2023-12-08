format long
gamma = 0.15;
beta = 0.004;  % Start with the given beta value

% Define the initial conditions
S0 = 99;
I0 = 1;
R0 = 0;

% Define the time span to solve the ODEs
tspan = [0 100];

% Define the maximum infection threshold (10% of the total population)
max_infection_threshold = 10;



% Loop to find the largest beta
while true
    % Use ode45 to solve the ODEs with the current value of beta
    [T, Y] = ode45(@(t, Y) SIRmodel(t, Y, beta, gamma), tspan, [S0; I0; R0]);
    
    % Extract the solution for I
    I = Y(:, 2);
    
    % Check if the maximum infection is below the threshold
    if max(I) < max_infection_threshold
        break;
    else
        % Decrease beta slightly
        beta = beta - 0.0001;
    end
end

% Output the result
fprintf('The largest beta that keeps infections below 10%% of the total population is: %.5f\n', beta);
% Define the system of equations in a function
function dYdt = SIRmodel(t, Y, beta, gamma)
    S = Y(1);
    I = Y(2);
    R = Y(3);
    dSdt = -beta * S * I;
    dIdt = beta * S * I - gamma * I;
    dRdt = gamma * I;
    dYdt = [dSdt; dIdt; dRdt];
end