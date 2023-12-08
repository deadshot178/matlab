function p = sysNewton(f,J,x1,tol)
% f is the system of equations as a column vector
%   this an anonymous function with a vector input and vector output
% J is the Jacobian of the system
%   this is an anonymous function with a vector input and matrix output
% x1 is a set of initial guesses (in a column vector)
% tol is a tolerance
 maxIter = 1000;
    iter = 1;
    x = x1;

    while norm(f(x)) > tol && iter <= maxIter
        delta = -J(x) \ f(x);
        x = x + delta;
        iter = iter + 1;
    end
    p = x;
end
