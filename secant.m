function [p,n] = secant(f,x1,x2,tol)
    %input f, root finding function
    %inputs x1,x2, initial guesses 
    %input tol, a tolerance (stop once successive iterates are within tol of each other)
    %ouptput p, a root f(p) = 0
    %output n, the number of iterations to reach p, i.e. what is n when p = x_n?
        p_prev = x1;
        p = x2;
        n = 2;
    
        while true
            p_next = p - f(p) * (p - p_prev) / (f(p) - f(p_prev));
            n = n + 1;
            if abs(p_next - p) < tol
                p = p_next;
                break;
            end
            p_prev = p;
            p = p_next;
        end
    end
    % Interval after 1 iterations: [0.000000, 1.000000]
    % Interval after 2 iterations: [1.000000, 1.211239]
    % Interval after 3 iterations: [1.211239, 1.362669]
    % Interval after 4 iterations: [1.362669, 1.390108]
    % Interval after 5 iterations: [1.390108, 1.392536]
    
    % p =
    
    %    1.392570675910181
    
    
    % n =
    
    %      7