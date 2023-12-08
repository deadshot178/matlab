function dydt = rocketODE(t, y)
    Cd = 0.75;
    rho = 1.056; % kg/m^3
    A = pi * (0.0208)^2; % m^2
    g = 9.81; % m/s^2
    m_initial = 0.1536; % kg

    % Propellant force as a function of time
    if t > 1.65
        F_propellant = 0;
    elseif t > 0.26
        F_propellant = 15;
    elseif t > 0
        F_propellant = 60 * t;
    else
        F_propellant = 0; % No thrust before t = 0
    end

    % Mass of the rocket as a function of time
    if t > 1.65
        m_t = m_initial;
    else
        m_t = m_initial - 0.01515 * t;
    end

    % State derivatives
    dydt = zeros(3,1);
    dydt(1) = y(2); % ds/dt = v
    dydt(2) = (F_propellant - g * m_t - 0.5 * Cd * rho * A * y(2)^2 * sign(y(2))) / m_t; % dv/dt
    dydt(3) = -0.01515 * (t <= 1.65); % dm/dt
end