% syms theta1 theta2
% X=2;
% g=32.17;
% dy=1;
% f = [sin(theta2)/(2*sqrt(g*dy)) - sin(theta1)/sqrt(2*g*dy);
%     dy*(tan(theta1) + tan(theta2)) -X];
% J = jacobian(f, [theta1, theta2])
syms theta1 theta2

% Given constants
X = 2;
DeltaY = 1;
g = 32.17;

% Define the function f as a column vector
f = [sin(theta2)/(2*sqrt(g*DeltaY)) - sin(theta1)/sqrt(2*g*DeltaY); 
     DeltaY*(tan(theta1) + tan(theta2)) - X];

% Compute the Jacobian J
J = jacobian(f, [theta1, theta2])
sysNewton(f, J, [pi/4;pi/4], 1e-6)