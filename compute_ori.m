function [ ori ] = compute_ori( im )

% manual gradients
% [imh, imw] = size(im);
% x_grad = zeros(imh - 2, imw - 2);
% y_grad = zeros(imh - 2, imw - 2);
% 
% % for each pixel
% for y = 2:imh-1
%     for x = 2:imw-1
%         x_grad(y, x) = im(y, x+1) - im(y, x-1); % [-1, 0, 1] filter
%         y_grad(y, x) = im(y+1, x) - im(y-1, x); % [-1, 0, 1] filter
%     end
% end

% 3x3 tap filter gradients
% x_grad = imfilter(im, [[0,  0, 0]; [-1, 0, 1]; [0, 0, 0]]);
% y_grad = imfilter(im, [[0, -1, 0]; [ 0, 0, 0]; [0, 1, 0]]);

% 3x3 gaussian derivative filter gradients


ori = atan2d(y_grad,x_grad);
ori(isnan(ori)) = 0;
end
