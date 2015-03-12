function [hists ] = oriPyramid( image )

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
            %hists = vertcat(hists, theseHists/sum(theseHists));
            hists = vertcat(hists, theseHists);
        end
    end
end
hists = hists';

end
