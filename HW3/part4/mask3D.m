function X = mask3D(X, LBs, UBs)
% X ... 3xM
% LBs ... 3x1
% UBs ... 3x1
  M = size(X, 2);

  for i = 1:M
    j = M - i + 1;

    if sum(X(:, j) > LBs) ~= 3
      % size(X)
      X = [X(:, 1:j-1)'; X(:, j+1:end)']';
      % size(X)
    elseif sum(X(:, j) < UBs) ~= 3
      X = [X(:, 1:j-1)'; X(:, j+1:end)']';
    end
  end
end
