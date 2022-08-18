clear all

Nsamples = 41500;
EulerSaved = zeros(Nsamples, 3);

dt = 0.01;

for k=1:Nsamples
  [p q r] = GetGyro();
  % 1. 자이로 측정 가속도를 가지고 시스템 A 구성.
  A = eye(4) + dt*1/2*[ 0  -p  -q  -r;
                        p   0   r  -q;
                        q  -r   0   p;
                        r   q  -p   0
                      ];
  
  % 2. 가속도계로 오일러각 계산
  [ax ay] = GetAccel();                   
  [phi theta] = EulerAccel(ax, ay);

  % 3. EulerToQuaternion함수를 통해 쿼터니언으로 변환하여 칼만필터의 측정값으로 입력
  z = EulerToQuaternion(phi, theta, 0);

  [phi theta psi] = EulerKalman(A, z);
  
  EulerSaved(k, :) = [ phi theta psi ];
end 


PhiSaved   = EulerSaved(:, 1) * 180/pi;
ThetaSaved = EulerSaved(:, 2) * 180/pi;
PsiSaved   = EulerSaved(:, 3) * 180/pi;

t = 0:dt:Nsamples*dt-dt;

figure
plot(t, PhiSaved)
xlabel('Time [sec]')
ylabel('Roll angle [deg]')

figure
plot(t, ThetaSaved)
xlabel('Time [sec]')
ylabel('Pitch angle [deg]')


figure
plot(t, PsiSaved)
xlabel('Time [sec]')
ylabel('Yaw angle [deg]')
