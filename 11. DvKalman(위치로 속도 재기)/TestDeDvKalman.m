clear all


dt = 0.1;
t  = 0:dt:10;

Nsamples = length(t);

Xsaved   = zeros(Nsamples, 2);
DeXsaved = zeros(Nsamples, 2);
Zsaved   = zeros(Nsamples, 1);

for k=1:Nsamples
  z = GetPos();      
  [pos vel]   = DvKalman(z);
  [dpos dvel] = DeDvKalman(z);
  
  Xsaved(k, :)   = [pos vel];
  DeXsaved(k, :) = [dpos dvel];
  Zsaved(k)      = z;
end


figure
hold on
plot(t, Xsaved(:, 1))
plot(t, DeXsaved(:,1), 'r.')
xlabel('Time [sec]')
ylabel('Position [m]')
legend('Kalman Filter', 'Measurements')

figure
hold on
plot(t, Xsaved(:, 2))
plot(t, DeXsaved(:,2), 'r.')
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
legend('Decomposed', 'Matrix')