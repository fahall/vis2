function [ output ] = mNistToSignal( input, usePyramid, usePHOG )
%Convert mNist data into a form that can be passed into liblinear
%mNist struct should contain:
%A label vector with 1 label per image
%A 3d image matrix, where the 3rd dimension represents unique images

output.labels = input.labels;

[h, w, numIms] = size(input.images);

ims = double(reshape(input.images, h * w, numIms))'; %each row is a flattened image

if usePyramid
    pyramidSize = 4;
    for i = 1:2
        pyr = spatialPyramid(input.images(:,:,1), pyramidSize);

        for j = 2:numIms
            pyr = vertcat(pyr, spatialPyramid(input.images(:,:,j), pyramidSize));
        end

        ims = horzcat(ims, pyr);
        pyramidSize = 7; %set to 7 for second round. 
    end
end

if usePHOG
    
    
end

ims = sparse(ims);

output.images = ims;


end

