function subtract = part2LU(img, ratio, limC, nxn, print)
[w, h] = size(img);
I = img;
I=I-mean(I(:)); % Should I take zero-mean?
shiftedF = fftshift(fft2(I));
shiftedM=abs(shiftedF);

minM = min(shiftedM(:))
maxM = max(shiftedM(:))

L = ratio(1);
U = ratio(2);

threshL= maxM * L + minM * (1.0-L)
threshU= maxM * U + minM * (1.0-U)

param = 9;

max3x3 = ordfilt2(shiftedM, 9, ones(nxn, nxn));

where = (shiftedM == max3x3) & (shiftedM > threshL)  & (shiftedM < threshU);;

[r, c] = find(where);
% whos r
for i=1:length(r)
    if (w-r(i))^2+(h-c(i))^2 > limC^2
        if r(i) > limC & c(i) > limC
            shiftedF(r(i)-limC:r(i)+limC,c(i)-limC:c(i)+limC)=0;
        end
    end
end

subtract=real(ifft2(fftshift(shiftedF)));

% subtract = medfilt2(subtract);


if print
    f = figure;
    a = subplot(2, 2, 1);
    imshow(log(shiftedM + 1), []),colormap(gray),title('original magunitude');
    
    a = subplot(2, 2, 2);
    imshow(log(max3x3 + 1), []),colormap(gray), title('max');
    
    a = subplot(2, 2, 3);
    imshow(where>0, []),colormap(gray),title('where to change');

    a = subplot(2, 2, 4);
    imshow(log(abs(shiftedF) + 1), []),colormap(gray),title('new magunitude');
end
end