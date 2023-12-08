%%
E = load("myData.txt");
h=0.01;
df = firstDeriv(E, h);
d2f = secondDeriv(E, h);
t = linspace(0, 5, length(E));

[maxPower, index] = max(df);
timeOfMaxPower = t(index);
%%
figure;  
plot(t, E, 'b', 'LineWidth', 1.5);  
title('Energy of the Signal over Time');
xlabel('Time (seconds)');
ylabel('Energy');
grid on;

figure; 
plot(t, df, 'r', 'LineWidth', 1.5); 
title('Power of the Signal over Time');
xlabel('Time (seconds)');
ylabel('Power');
grid on;

%%
d2f = secondDeriv(E, h);
t = linspace(0, 5, length(E));
figure;
plot(t, d2f, 'm', 'LineWidth', 1.5);
title('Second Derivative');
xlabel('Time (seconds)');
ylabel('Second Derivative of Energy');
grid on;
matlab2tikz('test.tex')
[minRate, index] = min(d2f);
timeOfMinRate = t(index);
fprintf('The fastest rate of power loss is %f, and it occurred at %f seconds.\n', minRate, timeOfMinRate);