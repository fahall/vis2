function [pyrVals ] = spatialPyramid( image, pyramidSize )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

filter = ones(pyramidSize);
values = conv2(image, filter, 'Valid');



%now we need to get the values from the right pixels. 
offset = ceil(pyramidSize/2);

sample = values(1:offset:end, 1:offset:end);
pyrVals = reshape(sample, 1, []);


end

