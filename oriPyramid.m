function [hists ] = oriPyramid( image, normOris )

[imh, imw] = size(image);
ori = compute_ori(image);
[orih, oriw] = size(ori);

hists = [];
for offset = [4,7]
    for y = 1: offset: orih - offset
        for x = 1: offset: oriw - offset
            window = ori(y: y + offset - 1, x: x + offset - 1);
            binranges = linspace(-180, 180, 9);
            theseHists = histc(window(:), binranges);
            if normOris
                hists = vertcat(hists, theseHists/sum(theseHists));
            else
                hists = vertcat(hists, theseHists);
            end
        end
    end
end
hists = hists';

end
