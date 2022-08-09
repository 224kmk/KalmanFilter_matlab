function [pos vel] = DvKalman(z)
%
%
persistent A H Q R 
persistent x P
persistent firstRun


if isempty(firstRun)
  firstRun = 1;
  
  % 저장되는 시간
  dt = 0.1;
  
  % 행렬을 정의해서 위치 추정하기
  A = [ 1 dt;
        0 1  ];
  H = [1 0];
  
  Q = [ 1 0;
        0 3 ];
  R = 10;
    
  x = [ 0 20 ]';
  P = 5*eye(2);  % 스칼라 5인 2*2 단위행렬로 반환
end

% x는 위치
% xp = x_pred // Pp = P_pred
xp = A*x;           % 추정값 예측
Pp = A*P*A' + Q;    % 오차 공분산 예측

% K = kalman gain 
K = Pp*H'*inv(H*Pp*H' + R);

% x = Estimation
% p = Error Covaiance
x = xp + K*(z - H*xp);  % 추정값 계산
P = Pp - K*H*Pp;        % 오차 공분산 계산

  
pos = x(1);
vel = x(2);