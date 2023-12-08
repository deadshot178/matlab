% clc
% n=160;
% fprintf("n=")
% disp(n)
% format shortE
% f = @(x) sqrt(x);
% trap(f,0,1,n);
% simp(f,0,1,n);
f = @(x) exp(sin(x));
a=0;
b=2*pi;
integral(f,a,b)
[T, er, er2] = trap(f,0,2*pi,32)