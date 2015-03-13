trn = load('train_small.mat');
tst = load('test.mat');
trainRaw = trn.train;
testRaw = tst.test;

usePHOG = 1;
usePyramid = 0;
normOris = 1;
hyper = 1;

disp('formatting test data...')
test_signal = mNistToSignal(testRaw, usePyramid, usePHOG, normOris);

acc_output = cell(length(-hyper:hyper));

for i = 1:length(trainRaw)
    disp('formatting training data...')
    output = mNistToSignal(trainRaw{i}, usePyramid, usePHOG, normOris);
    
    % duplicate labels
    disp('training...')
    
    for j = 1:hyper
        model = train(output.labels, output.images, ['-c ', num2str(j)]);

        disp(['testing...hyper = ', num2str(j)])
        [predicted_label, accuracy, ~] = ...
            predict(test_signal.labels, test_signal.images, model);
        acc_output{j}(i) = accuracy(1);
    end
end