function rk4_plot()
    % Define the initial conditions
    t0 = 2;
    y0 = 1;
    tfinal = 10;
    h = 0.1;
    
    % Initialize arrays to store the solution
    t = t0:h:tfinal;
    y = zeros(size(t));
    y(1) = y0;

    % Perform the RK4 steps
    for i = 1:(length(t)-1)
        k1 = h * ode_fun(t(i), y(i));
        k2 = h * ode_fun(t(i) + 0.5*h, y(i) + 0.5*k1);
        k3 = h * ode_fun(t(i) + 0.5*h, y(i) + 0.5*k2);
        k4 = h * ode_fun(t(i) + h, y(i) + k3);
        y(i+1) = y(i) + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
    end

    % Plot the solution with markers
    plot(t, y, '-o');
    title('Q1 part c RK4');
    xlabel('t');
    ylabel('y');
end
