function doubled = part3_double(img)
    extension1 = zeros(size(img));
    doubled = cat(1, img, extension1);
    extension2 = zeros(size(doubled));
    doubled = cat(2, doubled, extension2);
end