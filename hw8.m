% Position data, sampled at every tenth of a second
y = [0.7871    1.1703    1.6330    2.3415    3.2340    4.4188    5.8789    7.6657    9.8413   12.4164   15.2719   18.4722   21.9058   25.4581   28.9589   32.3574   35.4010   37.9661   39.9110   41.0991   41.5229];
h = 0.1;
% Use firstDeriv.m to get the velocity.  Store the result as df.
df = firstDeriv(y, h);

% Let's say the airspeed velocity of an unladen swallow is the max value.  Store this as v.
v = max(df)


% Define the time vector t that corresponds to the data.  Assume time starts at zero.  The data is sampled every tenth of a second.  
t = 0:h:(length(y)-1)*h;


% Plot the velocity
figure
plot(t,df)
xlabel('time (sec)')
ylabel('velocity (ft./sec.)');