function s = myTrap(f,a,b,n)
% Trapezoid rule
% Input: f = integrand (anonymous function)
% Input: a = left end of integral
% Input: b = right end of integral
% Input: n = number of intervals/trapezoids
% Output: s = approximation of integral of f from a to b
x = linspace(a, b, n+1);
h = (b - a) / n;
s = 0;
for i = 1:n
        % The area of each trapezoid is the average of the heights (y-values) times the width
        s = s + 0.5 * h * (f(x(i)) + f(x(i+1)));
    end

end