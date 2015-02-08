function preds = hw1_test1b(params,test)
   
   class_count = 10;
   prediction = zeros(10,1);
   preds(length(test), 1) = -1;
   
    for i=1:length(test)
        x = test(i,:);
        highest_index = 1;
        for y=1:class_count
           scale = params(y,1).pi/sqrt(det(params(y,1).sigma));
           ex = exp((-1/2)*(x - (params(y,1).mu))*pinv(params(y,1).sigma)*(x - (params(y,1).mu))');
           prediction(y,1) = scale*ex;
        end
        for y=1:class_count
            if prediction(y,1) > prediction(highest_index,1)
                highest_index = y;
            end
        end
        preds(i, 1) = highest_index-1;
        highest_index = -1;
        prediction = zeros(class_count,1);
    end
        
    
end

  