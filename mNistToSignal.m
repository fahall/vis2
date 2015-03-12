function [ output ] = mNistToSignal( input, usePyramid, usePHOG, normOris )
%Convert mNist data into a form that can be passed into liblinear
%mNist struct should contain:
%A label vector with 1 label per image
%A 3d image matrix, where the 3rd dimension represents unique images

output.labels = input.labels;

[h, w, numIms] = size(input.images);
rawIms = double(input.images/255.0);

if usePHOG
    ori = oriPyramid(rawIms(:,:,1), normOris);
    for i = 2:numIms
        ori = vertcat(ori, oriPyramid(rawIms(:,:,i), normOris));
    end
    flatIms = ori;  
    
else
    flatIms = reshape(rawIms, h * w, numIms)'; %each row is a flattened image
    if usePyramid
        for pyramidSize = [4, 7]
            pyr = spatialPyramid(rawIms(:,:,1), pyramidSize);

            for j = 2:numIms
                pyr = vertcat(pyr, spatialPyramid(rawIms(:,:,j), pyramidSize));
            end

            flatIms = horzcat(flatIms, pyr);
        end
    end
end

flatIms = sparse(flatIms);

output.images = flatIms;


end

