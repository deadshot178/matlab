function df = firstDeriv(y,h)
% Use O(h^2) approximations to compute derivative
% y = evenly spaced data of outputs
% h = spacing between the inputs of the data points (delta x)
% df = derivative of y with respect to x
    if iscolumn(y)
        y = y';
    end
    n = length(y);

    df = zeros(1, n);

    df(1) = (-3*y(1) + 4*y(2) - y(3)) / (2*h);

    for i = 2:n-1
        df(i) = (y(i+1) - y(i-1)) / (2*h);
    end

    df(n) = (3*y(n) - 4*y(n-1) + y(n-2)) / (2*h);

    if iscolumn(df)
        df = df';
    end
end
% h = 0.1; 
% x = 0:h:2*pi;
% y = sin(x);
% df = firstDeriv(y,h);
% plot(x,df)