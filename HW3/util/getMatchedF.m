function [f1match, f2match] = getMatchedF(F, possibleMs, f1, f2)
  indices1 = possibleMs(1,:);
  f1match = f1(1:2, indices1);
  indices2 = possibleMs(2,:);
  f2match = f2(1:2, indices2);
end
