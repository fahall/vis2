trn = load('train_small.mat');
tst = load('test.mat');
trainRaw = trn.train;
testRaw = tst.test;

usePyramid = 0;
usePHOG = 0;

disp('formatting test data...')
test_signal = mNistToSignal(testRaw, usePyramid, usePHOG);

output{length(trainRaw)} = [];
model{length(trainRaw)} = [];
acc_output = zeros(length(trainRaw),1);

for i = 1:length(trainRaw)
    disp('formatting training data...')
    output{i} = mNistToSignal(trainRaw{i}, usePyramid, usePHOG);
    
    % duplicate labels
    disp('training...')
    model{i} = train(output{i}.labels, output{i}.images);
    
    disp('testing...')
    [predicted_label, accuracy, ~] = ...
        predict(test_signal.labels, test_signal.images, model{i});
    acc_output(i) = accuracy(1);
end