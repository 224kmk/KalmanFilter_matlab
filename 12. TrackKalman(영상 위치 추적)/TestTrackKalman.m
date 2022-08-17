clear all

NoOfImg = 24; % 이미지 개수를 의미함

Xmsaved = zeros(2, NoOfImg);
Xhsaved = zeros(2, NoOfImg);

for k = 1:NoOfImg
  [xm, ym] = GetBallPos(k);         % 공의 측정 좌표
  [xh, yh] = TrackKalman(xm, ym);   % 공의 다음 추정 좌표
      
  hold on
  plot(xm, ym, 'r*')
  plot(xh, yh, 'bs')
  
  pause(1)
  
  Xmsaved(:, k) = [xm ym]';
  Xhsaved(:, k) = [xh yh]';

end


figure
hold on
plot(Xmsaved(1,:), Xmsaved(2,:), '*')
plot(Xhsaved(1,:), Xhsaved(2,:), 's')
xlabel('Horizonal [pixel]')
ylabel('Vertical [pixel]')
legend('Measured', 'Kalman Filter')
