function [z, vel] = GetPos()
%
%
persistent Velp Posp


if isempty(Posp)
  Posp = 0;
  Velp = 80;
end

dt = 0.1;

% w -> 측정된 위치와 실제 속도 및 실제 위치를 반환. (시스템 소음)
% v -> 측정된 위치와 실제 속도 및 실제 위치를 반환. (측정 소음)
w  = 0 +  10*randn;
v  = 0 +  10*randn;

% z -> measured position (관찰가능한)
z = Posp + Velp*dt + v;

vel = Velp;
Posp = z - v;     % true position
Velp = 80 + w;    % true speed