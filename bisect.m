function [p,n] = bisect(f,a,b,tol)
    %input f, anonymous function for which we'd like to find a root
    %inputs a,b left and right ends for which f(a)*f(b) < 0 (so that there is a root in [a,b])
    %input tol a tolerance, algorithm stops when the length of the updated interval [a,b] is less than tol
    %output p, the approximate root, we set p to be the midpoint of the first interval smaller than tolerance in length
    %output n, the number of bisections to reach p
    n = 1;
    while (b - a) > tol
       n = n + 1;
       x = (a + b) / 2;
       if f(x) == 0
           break
       end
       if (f(a) * f(x)) < 0
           b = x;
       else
           a = x;
       end
    end
    %n = n + 1;
    p = (a + b) / 2;
    end
    %    if sign(f(a)) * sign(f(b)) >= 0
    %        error('f(a) and f(b) must have opposite signs');
    %    end
    %    
    %    n = 0;
    %    
    %    while (b - a) / 2 > tol
    %        n = n + 1;
    
    %        p = (a + b) / 2;
    %
    %        if f(p) == 0
    %            break; % p is a root
    %        elseif sign(f(p)) * sign(f(a)) < 0
    %            b = p; % root is in the left subinterval
    %        else
    %            a = p; % root is in the right subinterval
    %        end
    %    end
        
    %    p = (a + b) / 2;