%% Reading Images

close all
fileName = ["4178" "4181" "4183" "4187" "4190"];
fileName2 = ["4195" "4197" "4182" "4184" "4188"];
siz = size(fileName2);
imgs = cell(siz(2), 1);
masks = cell(siz(2), 1);
feats = cell(siz(2), 1);
ds = cell(siz(2), 1);
calib = true;
vSet2 = viewSet;


for i = 1:siz(2) 
    imgs{i} = readIm(strcat('./211HW3/data/DSCF', fileName2(i), '.jpg'));
    m = readIm(strcat('./211HW3/data/DSCF', fileName2(i), 'Mask.jpg'));
    masks{i} = imgs{i}.* m;
    figure
    montage({imgs{i}, m, masks{i}}, 'Size', [1 3])
    [feats{i}, ds{i}] = vl_sift(masks{i});
    if calib == true
        [orientations,locations] = extrinsicsToCameraPose(rotations{i},translations{i});
        vSet2 = addView(vSet2, i,'Points',feats{i}(1:2,:).','Orientation',...
        orientations,'Location',locations);
    end
    
end
%'./211HW3/data/DSCF4177.jpg';


%% Visualize sift frames OPTIONAL
close all

figure
imshow(imgs{2}) %change number to change image

f = feats{2};
h1 = vl_plotframe(f(:,:)) ;
h2 = vl_plotframe(f(:,:)) ;
set(h1,'color','k','linewidth',3) ;
set(h2,'color','y','linewidth',2) ;

%% Create matches of all images.
close all
k = 1;
track = [];
 for i = 1:siz(2)
      for j = i+1:1:siz(2)
          [match, score] = vl_ubcmatch(ds{i}, ds{j}) ;
          showImage(match, score, imgs{i}, imgs{j}, feats{i}, feats{j})
          matches{k} = match;
          scores{k} = score;
          k = k + 1;
          if calib == true
            vSet2 = addConnection(vSet2,i,j,'Matches',match.');
          end

          %track = [track pointTrack([i j], match.')];
      end
      
 end
%%
if calib == true
    tracks2 = findTracks(vSet2);

    cameraPoses2 = poses(vSet2);

    close all
    %%
    intrinsics = cameraIntrinsics(fc, cc, size(imgs{1}));

    [xyzPoints2,errors] = triangulateMultiview(tracks2,cameraPoses2,intrinsics);
    z2 = xyzPoints2(:,3);
    idx = errors < 15;
    figure
    pcshow(xyzPoints2(:, :),[1 0 0], 'VerticalAxis','y','VerticalAxisDir','down','MarkerSize',30);
    hold on
    plotCamera(cameraPoses2, 'Size', 0.1);
    hold off
end