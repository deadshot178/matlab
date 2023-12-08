function dydt = ode_fun(t, y)
    dydt = sin(t - 2*y) - sin(t);
end