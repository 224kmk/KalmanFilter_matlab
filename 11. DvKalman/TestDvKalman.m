clear all


% 0.1초마다 10초동안
dt = 0.1;
t  = 0:dt:10;

Nsamples = length(t);

Xsaved = zeros(Nsamples, 2);
Zsaved = zeros(Nsamples, 1);
TVel = zeros(Nsamples, 1);

for k=1:Nsamples
  [z,v] = GetPos();      
  [pos vel] = DvKalman(z);
  
  Xsaved(k, :) = [pos vel];
  Zsaved(k)    = z;
  TVel(k) = v;
end


figure
hold on
plot(t, Zsaved(:), 'r.')
plot(t, Xsaved(:, 1))
xlabel('Time [sec]')
ylabel('Position [m]')
legend('Kalman Filter', 'Measurements')

figure
hold on
plot(t, Xsaved(:, 2))
plot(t, TVel(:), 'r-.');
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
legend('Kalman Filter', 'True speed')

