function preds = hw1_test1b(params,test, labels)
   
   class_count = 10;
   prediction = zeros(10,1);
   preds(length(test), 1) = -1;
   diff = test;
   precomp = zeros(size(test,1),1);
   
   for i=1:length(test)
      diff(i,:) = diff(i,:) - params(labels(i)+1, 1).mu; 
   end
   
   for i=1:length(test)
    precomp(i,1) = diff(i,:)*diff(i,:)';
   end
   
    for i=1:length(test)
        x = test(i,:);
        highest_index = 1;
        for y=1:class_count
           scale = (-1/2)*log(det(params(y,1).sigma))+log(params(y,1).pi);
           ex = (-1/2)*precomp(i,1);
           prediction(y,1) = ex + scale;
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

  
