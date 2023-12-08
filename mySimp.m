function s = mySimp(f,a,b,n)
% Simpsons Rule
% Input: f = function handle of the integrand
% Input: a = left end of integral
% Input: b = right end of integral
% Input: n = number of intervals -- must be even!
% Output: s = approximation of integral of f(x) from a to b
x = linspace(a, b, n+1);
h = (b - a) / n;
s = f(x(1)) + f(x(end));
for i = 2:n
        if mod(i, 2) == 0
            s = s + 4 * f(x(i));
        else
            s = s + 2 * f(x(i));
        end
end
s = (h / 3) * s;