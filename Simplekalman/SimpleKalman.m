% 칼만 필터 알고리즘 예제
% 첫번째 전압 14
% 평균 0 표준편차가 2인 잡음
% 초기 예측값 선정 -> 예측값 14, 오차 공분산 6
function volt = SimpleKalman(z)
%
%
persistent A H Q R
persistent x P
persistent firstRun

if isempty(firstRun)
    A = 1; % 시스템 변수들 입력
    H = 1;

    Q = 0;
    R = 4;

    x = 14; % 초기 예측값
    P = 6;  % 오차 공분산

    firstRun = 1;
end

xp = A*x;                     % I. 추정값 예측
Pp = A*P*A' + Q;              %    오차 공분산 예측

K = Pp*H'*inv(H*Pp*H' + R);   % II. 칼만 이득 계산

x = xp + K*(z - H*xp);        % III. 추정값 계산

P = Pp -K*H*Pp;               % IV. 오차 공분산 계산

volt = x;