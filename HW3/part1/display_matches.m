function display_matches(I1, I2, matches, f1, f2, maxline)

    indices1 = matches(1,:);
    f1match = f1(:,indices1);
    indices2 = matches(2,:);
    f2match = f2(:,indices2);

    imshow([I1,I2],[]);
    o = size(I1,2) ;
    lines = line([f1match(1,:);f2match(1,:)+o], ...
     [f1match(2,:);f2match(2,:)]);
    set(lines,'linewidth', 1, 'color', 'r') ;
    for i=1:size(f1match,2)
     x = f1match(1,i);
     y = f1match(2,i);
     text(x,y,sprintf('%d',i), 'Color', 'r');
    end
    for i=1:size(f2match,2)
     x = f2match(1,i);
     y = f2match(2,i);
     text(x+o,y,sprintf('%d',i), 'Color', 'r');
    end

    drawnow;
end
