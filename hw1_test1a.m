function preds = hw1_test1a(params,test)
   prediction = zeros(10,1);
   preds(length(test), 1) = -1;
   
    for i=1:length(test)
        x = test(i,:);
        highest_index = -1;
        for y=1:10
           scale = params(y,1).pi(y)/sqrt(det(params(y,1).pi(y)));
           ex = exp((-1/2)*(x - (params(y,1).mu))*pinv(params(y,1).sigma)*(x - (params(y,1).mu))');
           prediction(y,1) = scale*ex;
        end
        for y=1:10
            if prediction(y,1) > highest_index
                highest_index = y;
        end
        preds(i, 1) = highest_index;
        highest_index = -1;
        prediction = zeros(10,1);
        end
end

