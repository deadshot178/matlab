X=2;
g=32.17;
dty=1;
f = @(v) [sin(v(2))/(2*sqrt(g*dty)) - sin(v(1))/sqrt(2*g*dty);
        dty*(tan(v(1)) + tan(v(2))) - X
];
J = @(v) [-cos(v(1))/sqrt(2*g*dty), cos(v(2))/(2*sqrt(g*dty));
     dty*sec(v(1))^2, dty*sec(v(2))^2
];
sysNewton(f, J, [pi/4;pi/4], 1e-6)

return
x1 = [2; 2];
x12= [-2;2];
x13 = [2; -2];
x14 = [-2;-2];
tol = 1e-5;
f = @(z) [z(2) - z(1)^2 + 12; 
          z(1) - z(2)^2 + 11];
J = @(z) [-2*z(1), 1;
          1, -2*z(2)];
p = sysNewton(f,J,[2;2], 5)
p1 = sysNewton(f, J, x1, tol);
p2 = sysNewton(f, J, x12, tol);
p3 = sysNewton(f, J, x13, tol);
p4 = sysNewton(f, J, x14, tol);
disp('For [2; 2]:')
disp(p1)
disp('For [-2; 2]:')
disp(p2)
disp('For [2; -2]:')
disp(p3)
disp('For [-2; -2]:')
disp(p4)
fx1 = [10; 9];
Ji=inv([-4, 1; 1, -4]);
x2 = x1 - Ji*fx1;
