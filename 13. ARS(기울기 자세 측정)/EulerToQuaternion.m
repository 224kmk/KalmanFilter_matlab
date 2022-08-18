function z = EulerToQuaternion(phi, theta, psi)
%
% 기존에 변수 설정
sinPhi   = sin(phi/2);    cosPhi   = cos(phi/2);
sinTheta = sin(theta/2);  cosTheta = cos(theta/2);
sinPsi   = sin(psi/2);    cosPsi   = cos(psi/2);

% 쿼터니언 변수로 변경.
z = [ cosPhi*cosTheta*cosPsi + sinPhi*sinTheta*sinPsi;
      sinPhi*cosTheta*cosPsi - cosPhi*sinTheta*sinPsi;
      cosPhi*sinTheta*cosPsi + sinPhi*cosTheta*sinPsi;
      cosPhi*cosTheta*sinPsi - sinPhi*sinTheta*cosPsi;
    ];