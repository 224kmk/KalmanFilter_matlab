function [pos vel alt] = RadarEKF(z, dt)
%
% 레이더 추적 예제
%
persistent A Q R
persistent x P
persistent firstRun

% 행렬 정의
if isempty(firstRun)
  A = eye(3) + dt*[ 0 1 0;
                    0 0 0;
                    0 0 0 ];   

  % 잡음의 공분산 행렬을 결정하는 Q와 R 정의
  Q = [ 0  0      0;
        0  0.001  0;
        0  0      0.001 ];
     
  R = 10;
  
  % x의 값은 순서대로 위치 속도 고도의 값임
  x = [0 90 1100]';  
  P = 10*eye(3);
  
  firstRun = 1;  
end


H = Hjacob(x);

xp = A*x;
Pp = A*P*A' + Q;

K = Pp*H'*inv(H*Pp*H' + R);

% 확장 칼만 필터의 알고리즘 
% 기존 칼만 필터에서 비선형으로 변경하였음
x = xp + K*(z - hx(xp)); % x = xp + K*(z - H*xp);
P = Pp - K*H*Pp;

  
pos = x(1);
vel = x(2);
alt = x(3);


%------------------------------
function zp = hx(xhat)
%
%
x1 = xhat(1);
x3 = xhat(3);

zp = sqrt(x1^2 + x3^2);


%------------------------------
function H = Hjacob(xp)
%
%
H = zeros(1, 3);

x1 = xp(1);
x3 = xp(3);

H(1) = x1 / sqrt(x1^2 + x3^2);
H(2) = 0;
H(3) = x3 / sqrt(x1^2 + x3^2);