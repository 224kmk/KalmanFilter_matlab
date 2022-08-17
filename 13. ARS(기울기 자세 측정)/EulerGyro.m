function [phi theta psi] = EulerGyro(p, q, r, dt)
%
%
% 변수 선언
persistent prevPhi prevTheta prevPsi

% 변수 초기화
if isempty(prevPhi)
  prevPhi   = 0;
  prevTheta = 0;
  prevPsi   = 0;
end

% sin cos tan 정의
sinPhi   = sin(prevPhi);    cosPhi   = cos(prevPhi);
cosTheta = cos(prevTheta);  tanTheta = tan(prevTheta);

% Eulergyro를 p, q, r을 통해 수식으로 정리
% phi = Roll(x축), theta =Pitch(y축), psi = Yaw(z축)
phi   = prevPhi   + dt*( p + q*sinPhi*tanTheta + r*cosPhi*tanTheta );
theta = prevTheta + dt*(     q*cosPhi          - r*sinPhi );
psi   = prevPsi   + dt*(     q*sinPhi/cosTheta + r*cosPhi/cosTheta );

% 수식에 대입.
prevPhi   = phi;
prevTheta = theta;
prevPsi   = psi; 