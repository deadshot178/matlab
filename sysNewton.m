function p = sysNewton(f,J,x0,tol)
    xprev = x0;
    xnext = x0-J(x0) \ f(x0);
    while norm(xnext-xprev)>tol
        xprev = xnext;
        xnext = xprev-J(xprev) \ f(xprev);
    end
    p = xnext;
end