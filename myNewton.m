function [p,n] = myNewton(f,fprime,x1,tol)
    %input f, anonymous function for root finding problem
    %input fprime, anonlymous function, the derivative of f
    %input x1, an initial guess
    %input tol, a tolerance (method will stop when successive iterates are within tol of each other)
    %output p, a root f(p) approx 0
    %output n, the number of iterations to reach p, or the number n when p = x_n
    
        p = x1;
        n = 1; 
        while true
            p_next = p - f(p)/fprime(p);
            
            n = n + 1;
            if abs(p_next - p) < tol
                p = p_next;
                break;
            end
            p = p_next;
        end
    end