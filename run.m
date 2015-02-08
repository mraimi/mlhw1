%load('hw1_data.mat');
load('mnist.mat');
err(hw1_test1a(hw1_train1a(data, labels), testdata), testlabels);
