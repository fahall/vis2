% plot results
%results = load('results.mat');

labels = {'raw pixels only'};

x = [100, 200, 500, 1000, 2000, 5000, 10000];

plot(x, pixOnly, 'b');
title('Comparison of SVM feature vectors')
xlabel('Number of training points')
ylabel('Accuracy (%)')
legend(labels,'Location','southeast')
ylim([0, 100])
fig = gcf;
saveas(fig, 'pixOnly.eps', 'epsc')

%%%%%%%%%%%%

labels = {'raw pixels only', 'raw pixels + pyramid'};

x = [100, 200, 500, 1000, 2000, 5000, 10000];

plot(x, pixOnly, 'b', x, pixAndPyr, 'g');
title('Comparison of SVM feature vectors')
xlabel('Number of training points')
ylabel('Accuracy (%)')
legend(labels,'Location','southeast')
ylim([0, 100])
fig = gcf;
saveas(fig, 'pixAndPyr.eps', 'epsc')

%%%%%%%%%%%%

labels = {'raw pixels only', 'raw pixels + pyramid', ...
          'Tap filter ori (normed)'};

x = [100, 200, 500, 1000, 2000, 5000, 10000];

plot(x, pixOnly, 'b', ...
     x, pixAndPyr, 'g', ...
     x, normedTap, 'k')
title('Comparison of SVM feature vectors')
xlabel('Number of training points')
ylabel('Accuracy (%)')
legend(labels,'Location','southeast')
ylim([0, 100])
fig = gcf;
saveas(fig, 'normedTap.eps', 'epsc')

%%%%%%%%%%%%

labels = {'raw pixels only', 'raw pixels + pyramid', ...
          'Tap filter ori (non-normed)', 'Tap filter ori (normed)'};

x = [100, 200, 500, 1000, 2000, 5000, 10000];

plot(x, pixOnly, 'b', ...
     x, pixAndPyr, 'g', ...
     x, nonNormedTap, 'r', ...
     x, normedTap, 'k')
title('Comparison of SVM feature vectors')
xlabel('Number of training points')
ylabel('Accuracy (%)')
legend(labels,'Location','southeast')
ylim([0, 100])
fig = gcf;
saveas(fig, 'nonNormedTap.eps', 'epsc')

%%%%%%%%%%%%

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
ylim([0, 100])
fig = gcf;
saveas(fig, 'normedGauss.eps', 'epsc')