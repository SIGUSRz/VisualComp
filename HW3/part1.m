% % no need to load pictures
% 
addpath('part1/');

load('part0/savedmasks.mat')
load('part0/savedoriginals.mat')
% 
[n, r, c] = size(originals);
% 
% % for test
% % n = 2
% 
Ds = {};
Fs = {};

for i=1:n
    img = singlePic(originals, i);
    msk = singlePic(masks, i);
    
    I = single(img .* msk);
    
    [f,d] = vl_sift(I);
    % note f is 4 x num features
    % rows = [x, y, s, TH] where center coords, scale, orientation
    Ds{end+1} = d;
    Fs{end+1} = f;
    

    fig = figure(1);
    display_features(img, f);
    savefile = strcat("part1/part1_f1_", num2str(i) ,".png");
    saveas(fig,savefile);
end
% 
save('part1/savedDs.mat','Ds');
save('part1/savedFs.mat','Fs');

Matches = {};
Scores = {};

for i=1:n-1
    j = i+1;
    di = Ds{i};
    dj=  Ds{j};

    fi = Fs{i};
    fj=  Fs{j};

    [match, score] = vl_ubcmatch(di, dj);

    fig = figure(2);
    Ii = singlePic(originals, i);
    Ij = singlePic(originals, j);
    display_matches(Ii, Ij, match, fi, fj);
    savefile = strcat("part1/part1_f2_", num2str(i), num2str(j) ,".png");
    saveas(fig,savefile);

    [keys, idx] = sort(score, 'descend');
    match = match(:, idx);
    score = keys;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%% THIS THRESH MAY NEED TO BE MODIFIED DEPENDS ON PART 2~4 %%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % method 2: get first 20
    f(3) = figure;
    histogram(score);
    drawnow;

    h = histcounts(score, 10);
%     [maxh, maxidx] = max(h);
%     cutoff_idx = maxidx;
    cutoff_idx = 5;
    
    cutoff = 1:sum(h(cutoff_idx:10));
    match = match(:, cutoff);
    score = score(cutoff);

    fig = figure(4);
    display_matches(Ii, Ij, match(:, 1:10), fi, fj);
    drawnow;
    savefile = strcat("part1/part1_f4_", num2str(i), num2str(j) ,".png");
    saveas(fig,savefile);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
    Matches{end+1} = match;
    Scores{end+1} = score;

end

save('part1/savedMatches.mat','Matches');
save('part1/savedScores.mat','Scores');