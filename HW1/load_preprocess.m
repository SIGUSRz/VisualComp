function ret = load_preprocess(path, suffix, size)

addpath('preprocessing')
imgs = load_all_imgs(path, suffix);
ret = preprocess(imgs, size);

end
