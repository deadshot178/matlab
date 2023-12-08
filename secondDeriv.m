function d2f = secondDeriv(y, h)
    % Use O(h^2) approximations to compute second derivative
    % y = evenly spaced outputs
    % h = spacing between data inputs i.e. Delta x
    % d2f = second derivative of y with respect to x

    % Validate inputs
    n = length(y);
    if n < 3
        error('There must be at least three data points to calculate the second derivative.');
    end

    % Initialize the output vector
    d2f = zeros(1, n);

    % Use a second-order central difference method for the interior points
    for i = 2:n-1
        d2f(i) = (y(i+1) - 2*y(i) + y(i-1)) / h^2;
    end

    % For the endpoints (boundaries), use a second-order accurate one-sided difference
    % The formulas are different from the central difference and use three points to
    % maintain the O(h^2) accuracy.

    % First data point (use forward difference)
    d2f(1) = (2*y(1) - 5*y(2) + 4*y(3) - y(4)) / h^2;

    % Last data point (use backward difference)
    d2f(n) = (2*y(n) - 5*y(n-1) + 4*y(n-2) - y(n-3)) / h^2;
end
% h = 0.1; 
% x = 0:h:2*pi;
% y = sin(x) + x.^2;
% d2f = secondDeriv(y,h);
% plot(x,d2f)