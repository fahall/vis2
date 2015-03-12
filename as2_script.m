trn = load('train_small.mat');
tst = load('test.mat');
trainRaw = trn.train;
testRaw = tst.test;

usePyramid = 1;
usePHOG = 1;
hyper = 0;

disp('formatting test data...')
test_signal = mNistToSignal(testRaw, usePyramid, usePHOG);

acc_output = cell(length(-hyper:hyper));

for i = 1:length(trainRaw)
    disp('formatting training data...')
    output = mNistToSignal(trainRaw{i}, usePyramid, usePHOG);
    
    % duplicate labels
    disp('training...')
    
    for j = -hyper:hyper
        model = train(output.labels, output.images, ['-c ', num2str(10^j)]);

        disp(['testing...hyper = ', num2str(j)])
        [predicted_label, accuracy, ~] = ...
            predict(test_signal.labels, test_signal.images, model);
        acc_output{j + hyper + 1}(i) = accuracy(1);
    end
end