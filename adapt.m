function s = adapt(fun,a,b,epsilon)

%uses adaptive quadrature scheme to integrate from 
%a to b with tolerance epsilon

%The following commands return a plot of 
% the nodes on the x-axis (blue +)
% the integrand (black line)
% the y-values of the nodes (red +)
%The plotting is really inefficient and slows the code down. 
%Comment the plotting out when speed needed
hold on
plot(a,0,'b+')
plot(b,0,'b+')
plot(a,fun(a),'r+')
plot(b,fun(b),'r+')
plot((a+b)/2,0,'b+');
plotty(fun,a,b,100)

% first level Simpson approx from a to b
h = (b-a)/2;
s1 = h*(fun(a)+4*fun(a+h)+fun(b))/3;

% second level Simp approx
h2 = h/2;
s = h2*(fun(a)+ 4*fun(a+h2) + 2*fun(a+h) + 4*fun(b-h2) + fun(b))/3;

%difference in two approximations
diff = abs(s1-s);

%if approx is not accepted, divide interval in half
%and repeat process on smaller intervals
%we could use 10*epsilon instead of 15*eps just to have a bit of a cushion
if diff > 15*epsilon
    m = (a+b)/2;
    s = adapt(fun,a,m,epsilon/2)+adapt(fun,m,b,epsilon/2);
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function s = plotty(fun,a,b,M)

x = linspace(a,b,M);
for i = 1:M
    y(i) = fun(x(i));
end

plot(x,y,'k')

end

