function img = singlePic(imgset, idx)
    img = imgset(idx, :, :);
    [n, w, c] = size(img);
    img = reshape(img, [w, c]);
end
