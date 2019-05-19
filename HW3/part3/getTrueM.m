function trueMs = getTrueM(F, possibleMs, f1, f2)
  % possibleMs ... 2xL

  % f has 4xL features where rows = [x, y, s, TH]
  indices1 = possibleMs(1,:);
  f1match = f1(1:2, indices1);
  indices2 = possibleMs(2,:);
  f2match = f2(1:2, indices2);

  thres = 0.05;
  L = size(f1match, 2);

  % homogeneous 3xL
  onesL = ones(1, L);
  f1match = [f1match; onesL];
  f2match = [f2match; onesL];

  trueM_ind = ones(2, L);

  for i = 1:size(f1match, 2)
    x1 = f1match(:, i);
    x2 = f2match(:, i);

    if abs(x2' * F * x1) > thres
      trueM_ind(:, i) = 0;
    end
  end

  % size(possibleMs)
  trueMs = possibleMs .* trueM_ind;
  trueMs = reshape(nonzeros(trueMs), 2, []);
end
