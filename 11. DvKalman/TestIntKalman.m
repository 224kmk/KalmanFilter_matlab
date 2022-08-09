clear all


% 0.1초마다 10초동안
dt = 0.1;
t  = 0:dt:10;

Nsamples = length(t);

Xsaved = zeros(Nsamples, 2);
Zsaved = zeros(Nsamples, 1);

for k=1:Nsamples
  z = GetVel();      
  [pos vel] = IntKalman(z);
  
  Xsaved(k, :) = [pos vel];
  Zsaved(k)    = z;
end


figure
plot(t, Xsaved(:, 1))
xlabel('Time [sec]')
ylabel('Position')


figure
hold on
plot(t, Xsaved(:, 2))
plot(t, Zsaved(:), 'r.')
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
legend('Kalman Filter', 'Measurements')
