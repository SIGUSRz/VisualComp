function X = triangulate(xL,xR,camL,camR)
  % xL, xR ... 2xN
  % camL, camR ... {K, R, t}
  % X ... 3xN

  KL = camL{1};
  KR = camR{1};

  c1L = KL(1, 3);
  c2L = KL(2, 3);
  f1L = KL(1, 1);
  f2L = KL(2, 2);

  c1R = KR(1, 3);
  c2R = KR(2, 3);
  f1R = KR(1, 1);
  f2R = KR(2, 2);

  RL = camL{2};
  RR = camR{2};
  tL = camL{3};
  tR = camR{3};

  qL(1,:) = (xL(1,:) - c1L) / f1L;
  qL(2,:) = (xL(2,:) - c2L) / f2L;
  qL(3,:) = 1;
  qR(1,:) = (xR(1,:) - c1R) / f1R;
  qR(2,:) = (xR(2,:) - c2R) / f2R;
  qR(3,:) = 1;

  R = inv(RL)*RR;
  t = inv(RL)*(tR – tL);


  XL = zeros(3,npts)
  XR = zeros(3,npts)
  for i = 1:npts
    A = [qL(:,i) -R*qR(:,i)];
    Z = A\t;
    XL(:,i) = Z(1)*qL(:,i);
    XR(:,i) = Z(2)*qR(:,i);
  end

  Xa = RL*XL + repmat(tL,1,npts);
  Xb = RR*XR + repmat(tR,1,npts);

  X = 0.5*(Xa+Xb);
