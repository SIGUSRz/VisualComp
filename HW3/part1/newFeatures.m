function [Ds, Fs] = newFeatures(originals, masks, N, path)
  % run if you have not find features from the subset.
  %
  % This function finds and save features of your subset

  Ds = {};
  Fs = {};

  for i = 1:N
    img = singlePic(originals, i);
    msk = singlePic(masks, i);
    img = single(img .* msk);

    % f has 4xM features where rows = [x, y, s, TH]
    [f,d] = vl_sift(img);
    Ds{end+1} = d;
    Fs{end+1} = f;
  end

  filename = strcat(path, 'savedDFs.mat');
  save(filename, 'Ds','Fs');
end
