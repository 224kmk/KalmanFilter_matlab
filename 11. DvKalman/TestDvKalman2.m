clear all

% 초음파 거리계를 사용 (getsonar)
% 거리의 궤적을 비교한 그래프 칼만 필터의 추정값으 실선, 추정값은 점으로
% 그래프에 시간지연이 거의 보이지 않고, 잡음 제거와 변화 민감성이라는 두 가지 목표를 이룸

% 칼만 필터가 추정한 속도와 추정거리의 변화율과 추정거리 속도를 비교했을때 추정 속도가 나름 타당하다는 것을 알수있음.
Nsamples = 500;

Xsaved = zeros(Nsamples, 2);
Zsaved = zeros(Nsamples, 1);

for k=1:Nsamples
  z = GetSonar();      
  [pos vel] = DvKalman(z);
  
  Xsaved(k, :) = [pos vel];
  Zsaved(k)    = z;
end


dt = 0.02;
t  = 0:dt:Nsamples*dt-dt;

figure
hold on
plot(t, Xsaved(:, 1))
plot(t, Zsaved(:), 'r.')
xlabel('Time [sec]')
ylabel('Distance [m]')
legend('Kalman Filter', 'Measurements')

figure
hold on
plot(t, Xsaved(:, 1))
plot(t, Xsaved(:, 2))
xlabel('Time [sec]')
ylabel('Velocity [m/s]')
legend('Distance', 'Velocity')

