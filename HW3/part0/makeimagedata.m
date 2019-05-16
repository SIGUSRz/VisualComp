addpath('part0/');
[originals, masks] = load_all_imgs_mat('data/', 'jpg');

save('part0/savedoriginals.mat','originals');
save('part0/savedmasks.mat','masks');