function [Matches, Scores] = newMatches(Ds, N, path)

  Matches = {};
  Scores = {};

  for i = 1:N-1
    j = i+1;

    [match, score] = vl_ubcmatch(Ds{i}, Ds{j});

    % score and match are sorted in the descending order of score
    [keys, idx] = sort(score, 'descend');
    match = match(:, idx);
    score = keys;

    % get the mean of min and max if the score is less, remove matches
    % h = histcounts(score, 10);
    % cutoff = 1:sum(h(2:10));
    % match = match(:, cutoff);
    % score = score(cutoff);
    Matches{end+1} = match;
    Scores{end+1} = score;
  end

  filename = strcat(path, 'savedMS.mat');
  save(filename,'Matches', 'Scores');
end
