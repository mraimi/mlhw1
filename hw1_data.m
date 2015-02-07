function [X,Y] = hw1_data(n)
rng('shuffle');
Y = randsample([0;1;2],n,1);
X = zeros(n,2);
means = [0,0; 2,0; 0,2];
stddevs = [1, 1/2, 1];
for k=1:3
	m = sum(Y==mod(k,3));
	X(Y==mod(k,3),:) = bsxfun(@plus,stddevs(k)*randn(m,2),means(k,:));
end
imagesc(reshape(data(i,:),28,28)');
