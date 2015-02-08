%load('hw1_data.mat');
load('mnist.mat');
err(hw1_test1b(hw1_train1b(data, labels), testdata), testlabels);