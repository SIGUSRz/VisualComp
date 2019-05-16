% manually typed data, save into mat files under part2/

pts3 = [...
    [[0 0 0]; [64 0 0]; [64 64 0]; [0 64 0]]; ... %blue
%     [[0 0 19]; [64 0 19]; [64 64 19]; [0 64 19]]; ... %blue/red
    [[0 0 29]; [64 0 29]; [64 64 29]; [0 64 29]]; ... %red
%     [[16 16 29]; [48 16 29]; [48 48 29]; [16 48 29]]; ... %red/green
    [[16 16 48]; [48 16 48]; [48 48 48]; [16 48 48]]; ... %green
%     [[0 48 29]; [32 48 29]; [32 80 29]; [0 80 29]]; ... %green
    [[0 48 48]; [32 48 48]; [32 80 48]; [0 80 48]]; ... %green/yellow
    [[0 48 67]; [32 48 67]; [32 80 67]; [0 80 67]]; ... %yellow
    [[20 20 0]; [180 20 0]; [180 180 0]; [180 20 0]]]; %corner
save("part2/pts3.mat", "pts3")

where1 = [...
    1 1 1 0; ... %blue
%     1 1 1 0; ... %blue/red
    1 1 1 0; ... %red
%     0 0 0 0; ... %red/gren
    1 1 1 0; ... %green
%     0 0 1 0; ... %green
    1 0 1 0; ... %green/yellow
    1 1 1 0; ... %yellow
    0 1 1 1]; ... %corners

where2 = [...
    1 1 0 0; ... %blue
%     1 1 0 0; ... %blue/red
    1 1 0 0; ... %red
%     1 1 0 0; ... %red/gren
    1 1 1 1; ... %green
%     1 0 0 0; ... %green
    1 1 0 0; ... %green/yellow
    1 1 1 1; ... %yellow
    0 1 1 0]; ... %corners

where3 = [...
    1 0 0 1; ... %blue
%     1 0 0 1; ... %blue/red
    1 0 0 1; ... %red
%     1 1 0 1; ... %red/gren
    1 0 0 1; ... %green
%     1 0 0 1; ... %green
    1 1 0 1; ... %green/yellow
    1 1 0 1; ... %yellow
    0 1 0 1]; ... %corners

where4 = [...
    1 0 0 1; ... %blue
%     1 0 0 1; ... %blue/red
    1 0 0 1; ... %red
%     1 0 0 0; ... %red/gren
    1 0 0 0; ... %green
%     1 0 0 1; ... %green
    1 0 0 0; ... %green/yellow
    1 0 0 1; ... %yellow
    0 1 1 1]; ... %corners
    
where5 = [...
    1 0 0 1; ... %blue
%     1 0 1 1; ... %blue/red
    1 0 1 0; ... %red
%     0 0 0 0; ... %red/gren
    1 0 0 0; ... %green
%     1 0 1 1; ... %green
    1 0 1 1; ... %green/yellow
    1 0 1 1; ... %yellow
    0 1 1 1]; ... %corners
    
where6 = [...
    0 0 1 1; ... %blue
%     0 0 1 1; ... %blue/red
    1 0 1 0; ... %red
%     0 0 0 0; ... %red/gren
    0 0 1 0; ... %green
%     0 0 1 1; ... %green
    0 0 1 1; ... %green/yellow
    0 0 1 1; ... %yellow
    0 0 1 1]; ... %corners
    
where7 = [...
    0 0 0 1; ... %blue
%     0 0 0 1; ... %blue/red
    0 0 0 0; ... %red
%     0 0 0 0; ... %red/gren
    0 0 0 0; ... %green
%     0 0 1 1; ... %green
    0 0 1 1; ... %green/yellow
    0 0 1 1; ... %yellow
    0 1 1 0]; ... %corners
    
where8 = [...
    0 1 0 0; ... %blue
%     0 1 0 0; ... %blue/red
    0 1 0 0; ... %red
%     0 0 0 0; ... %red/gren
    0 0 0 0; ... %green
%     0 0 0 0; ... %green
    0 0 0 0; ... %green/yellow
    0 1 1 1; ... %yellow
    0 1 1 1]; ... %corners
    
where9 = [...
    0 1 0 1; ... %blue
%     0 1 1 0; ... %blue/red
    0 1 1 0; ... %red
%     0 0 0 0; ... %red/gren
    0 1 1 0; ... %green
%     0 0 1 1; ... %green
    0 1 1 1; ... %green/yellow
    0 1 1 0; ... %yellow
    0 1 1 1]; ... %corners
    
where10 = [...
    0 1 0 0; ... %blue
%     0 1 1 0; ... %blue/red
    0 1 1 0; ... %red
%     0 0 0 0; ... %red/gren
    0 1 1 0; ... %green
%     0 0 1 0; ... %green
    0 1 1 0; ... %green/yellow
    0 1 1 0; ... %yellow
    0 1 0 1]; ... %corners
    
where11 = [...
    0 1 0 0; ... %blue
%     0 1 1 0; ... %blue/red
    1 1 1 0; ... %red
%     0 1 0 0; ... %red/gren
    1 1 1 0; ... %green
%     0 0 1 0; ... %green
    0 0 1 0; ... %green/yellow
    1 1 1 0; ... %yellow
    0 1 0 1]; ... %corner

wheres = {where1, where2, where3, where4, where5, where6, where7, where8, where9, where10, where11};
filename = strcat("part2/wheres.mat")
save(filename, 'wheres');
numpoints = [];
for i=1:length(wheres)
    which = wheres{i};
    numpoints = [numpoints; sum(which(:))]
end

pts2_set = {};
for i=8:8
% for i=1:length(wheres)
    img = singlePic(originals, i);
    figure, imshow(img);
    numpts = numpoints(i);
    title(num2str(numpts));
    hold on
    [x, y] = ginput(numpts);
    hold off
    filename = strcat("part2/calib", num2str(i), ".mat")
    save(filename, 'x', 'y');
end