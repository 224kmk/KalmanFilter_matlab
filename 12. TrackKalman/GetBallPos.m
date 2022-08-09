function [xc, yc] = GetBallPos(index)
%
%
persistent imgBg
persistent firstRun

if isempty(firstRun)
  imgBg = imread('Img/bg.jpg'); % 배경 이미지를 불러옴
  
  firstRun = 1;
end

xc = 0;
yc = 0;
  
% 해당하는 파일명 이미지를 읽어온 다음 plot함.
imgWork = imread(['Img/', int2str(index), '.jpg']); 
imshow(imgWork)

fore = imabsdiff(imgWork, imgBg);
fore = (fore(:,:,1) > 10) | (fore(:,:,2) > 10) | (fore(:,:,3) > 10);

L     = logical(fore);
stats = regionprops(L, 'area', 'centroid');
area_vector = [stats.Area];
[tmp, idx] = max(area_vector);

% 공의 중심 좌표를 의미
centroid = stats(idx(1)).Centroid;
  
% 좌표에 x, y 축으로 약 15 픽셀 정도의 잡음을 추가함.
xc = centroid(1) + 15*randn;
yc = centroid(2) + 15*randn;