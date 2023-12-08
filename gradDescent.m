function [xstar,x,n] = gradDescent(gradf, alpha, x1, eps)
    x = x1;
    n = 0;
    while true
        n = n + 1;
        x_new = x(n, :) - alpha * gradf(x(n, :));
        x = [x; x_new];

        if norm(gradf(x(n, :))) < eps || n >= 10000
            break;
        end
    end
%warn the user in case the algorithm doesn't appear to converge
if n>=10000  
    warning('maximum number of iterations exceeded')
end
xstar = x(end, :);
end

