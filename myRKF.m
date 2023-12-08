function [t,w] = myRKF(f,range,iv,tol)
    % Runge-Kutta-Fehlberg adaptive method

    % Initialize t1, w1, and starting step size h
    t(1) = range(1);
    w(1) = iv;
    h = 0.5; % hmax as starting step size
    hmax = 0.5;
    hmin = 0.05;
    i = 1;

    % Main loop
    while t(i) < range(2)
        % Compute K1 through K6
        k1 = h*f(t(i),w(i));
        k2 = h*f(t(i)+h/4, w(i) + k1/4);
        k3 = h*f(t(i)+3*h/8,w(i)+3*k1/32+9*k2/32);
        k4 = h*f(t(i)+12*h/13,w(i)+1932*k1/2197-7200*k2/2197+7296*k3/2197);
        k5 = h*f(t(i)+h,w(i)+439*k1/216-8*k2+3680*k3/513-845*k4/4104);
        k6 = h*f(t(i)+h/2,w(i)-8*k1/27+2*k2-3544*k3/2565+1859*k4/4104-11*k5/40);

        % Compute the two approximations
        w4 = w(i) + 25*k1/216 + 1408*k3/2565 + 2197*k4/4104 - k5/5;
        w5 = w(i) + 16*k1/135 + 6656*k3/12825 + 28561*k4/56430 - 9*k5/50 + 2*k6/55;

        % Compare the two approximations
        R = abs(w4 - w5) / max(abs(w(i)), 1e-5);

        % Check if approximation is accepted
        if R <= tol
            t(i+1) = t(i) + h;
            w(i+1) = w5;
            i = i + 1;
        end

        % Define the q-factor to scale the spacing
        q = (tol/(2*R))^(1/4);

        % Pick a new step size h
        if q <= 0.1
            h = 0.1 * h;
        elseif q >= 4
            h = 4 * h;
        else
            h = q * h;
        end

        % Check bounds of h
        if h > hmax
            h = hmax;
        end

        % Check for end condition
        if t(i) + h > range(2)
            h = range(2) - t(i);
        elseif h < hmin
            disp('Minimum h exceeded, method does not converge');
            break;
        end
    end

    % Convert to column vectors
    t = t(:);
    w = w(:);
end
