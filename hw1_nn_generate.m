function [] = hw1_nn_generate(X,test)
    m = matfile('myFile.mat','Writable',true);
    results = zeros(size(X,1), size(test,1));
    count = 0;
    for i=1:size(test,1)
        if count == 100
            display(i);
            count = 0;
        end
        vec = test(i,:);
        res = bsxfun(@minus, X, vec);
        res = bsxfun(@times, res, res);
        sum_vec = sum(res, 2);
        sum_vec = sqrt(sum_vec);
        results(:,i) = sum_vec; 
        vec = zeros(size(vec));
        res = zeros(size(res));
        sum_vec = zeros(size(sum_vec));
        count = count + 1;
    end
    m.y = results;
end

