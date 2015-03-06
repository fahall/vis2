function [hist ] = oriPyramid( image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

[imh, imw] = size(image);
ori = compute_ori(image);

hist = [];

for offset = [4,7]
    for y = 1:offset:imh - offset
        for x = 1:offset:imw - offset
            window = ori(y:y+offset, x:x+offset);
            [theseHists, ~] = histc(window, 9);
            hist = horzcat(hist, theseHists );
        end
    end
end



end
