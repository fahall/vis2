function [ ori ] = compute_ori( im )
%compute gradients
[imh, imw] = size(im);
x_grad = zeros(imh - 2, imw - 2);
y_grad = zeros(imh - 2, imw - 2);

% for each pixel
for y = 2:imh-1
    for x = 2:imw-1
        x_grad(y, x) = im(y, x+1) - im(y, x-1);
        y_grad(y, x) = im(y+1, x) - im(y-1, x);
    end
end
% x_grad = abs(x_grad);
% y_grad = abs(y_grad);

ori = atan2d(y_grad,x_grad);
ori(find(isnan(ori))) = 0;
end
