% plot results
%results = load('results.mat');
labels = {'raw pixels only', 'raw pixels + pyramid', ...
          'Tap filter ori (non-normed)', 'Tap filter ori (normed)',...
          'Gauss filter ori (normed)'};

x = [100, 200, 500, 1000, 2000, 5000, 10000];

plot(x, pixOnly, 'b', ...
     x, pixAndPyr, 'g', ...
     x, nonNormedTap, 'r', ...
     x, normedTap, 'k',...
     x, normedGauss, 'Magenta')
title('Comparison of SVM feature vectors')
xlabel('Number of training points')
ylabel('Accuracy (%)')
legend(labels,'Location','southeast')