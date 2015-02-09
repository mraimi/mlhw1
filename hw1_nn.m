function preds = hw1_nn(X,Y,test)
    results = zeros(size(X,1), size(test,1));
    for i=1:size(test,1)
        vec = test(i,:);
        res = bsxfun(@minus, X, vec);
        res2 = arrayfun
    end
end

