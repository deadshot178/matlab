%% gradient descent with f(x,y) = (1/3)x^2 + y^2
%% run this section to show 4 steps of gradient descent

alpha = 0.3  %adjust alpha to show different behavior: 
             %large alpha can lead to divergence, 
             %too small alpha will be slow to converge
             

f = @(x) (1/3)*x(1)^2 + x(2)^2

gradf =@(x) [(2/3)*x(1),2*x(2)]

x = [3,4]



for i = 1:9
  x(i+1,:) = x(i,:) - alpha*gradf(x(i,:));
end


fc = fcontour(@(x,y) (1/3)*x^2 + y^2, [-7 7 -7 7], LineWidth=2)

hold on

for i = 1:4
    z(i) = f(x(i,:));
end

fc.LevelList = flip(z)


% f(3,4) = 17.8

plot(x(1,1),x(1,2),'.',MarkerSize=20);

text(x(1,1) + 0.3, x(1,2) + 0.4,strcat('x_',num2str(1)),FontSize=16);

text(-x(1,1) - 0.4 , x(1,2) + 0.6,strcat('z =  ',num2str(z(1),'%.1f')),FontSize=14);

pause

for i = 2:4

plot(x(i,1),x(i,2),'.',MarkerSize=20);

text(x(i,1) + 0.3/(0.3*i+1), x(i,2) + 0.4/(0.3*i+1),strcat('x_',num2str(i)),FontSize=16);

text(-x(i,1) - 0.4/(0.3*i+1) , x(i,2) + 0.6/(0.3*i+1),strcat('z =  ',num2str(z(i),'%.1f')),FontSize=14);

anArrow = annotation('arrow')

anArrow.Parent = gca

anArrow.Position = [x(i-1,1), x(i-1,2), x(i,1)-x(i-1,1), x(i,2)-x(i-1,2)]

pause     

end

%% gradient descent with f = @(x) 0.2*x.^2 + sin(2*x)+0.2
%% x1 = 4
%% run this section to show 5 steps of gradient descent

alpha = 0.3  %adjust alpha to show different behavior: 
             %large alpha can lead to divergence, 
             %too small alpha will be slow to converge

f = @(x) 0.2*x.^2 + sin(2*x)+0.2

gradf = @(x) 0.4*x + 2*cos(2*x)

x = 4



for i = 1:9
  x(i+1,:) = x(i,:) - alpha*gradf(x(i,:));
end

fplot(f,[-1,5],LineWidth=2)
hold on
yline(0,linewidth=1.5)

plot(x(1),0,'.',MarkerSize=25)

text(x(1),-0.2,'x_1',FontSize=16)

pause

for i = 2:5
    
plot(x(i),0,'.',MarkerSize=25)

text(x(i),-0.2,strcat('x_',num2str(i)),FontSize=16)

anArrow = annotation('arrow')

anArrow.Parent = gca

anArrow.Position = [x(i-1), 0.15, x(i)-x(i-1), 0]


pause

end


