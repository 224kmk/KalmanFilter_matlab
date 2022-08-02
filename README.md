# KalmanFilter_matlab
## Data_science

### KalmanFilter

AvgFilter(평균 필터) : 
1. 재귀식을 사용하는 평균 필터는 직전의 평균값과 데이터의 개수만 알면 쉽게 평균을 구할 수 있음.
2. 데이터가 순차적으로 입력되는 경우에는 데이터를 저장할 필요가 없고 게산 효율도 높음.
3. 데이터를 실시간으로 처리해야 한다면 재귀식 형태의 필터가 필수적임
4. 평균을 내면 잡음이 제거되는 효과도 있음. 
--> 평균 필터를 사용하게 되면 기존 물리적인 센서로 불러왔던 데이터들의 평균을 낼 수 있긴 하지만 동적으로 움직이게 하지는 못함.
--> 그러므로 물리적인 센서의 평균은 낼 수는 있지만 실시간으로 업데이팅하는 것은 힘들 수 있음.