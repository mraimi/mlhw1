function preds = hw1_test1a(params,test,labels)
   class_count =3;
   prediction = zeros(10,1);
   preds(length(test), 1) = -1;
   
   diff = test;
   for i=1:length(test)
      mu_y = params(labels(i,1)+1, 1).mu;
      diff(i,:) = diff(i,:) - mu_y; 
   end
   
    
    for i=1:length(test)
        highest_index = 1;
        for y=1:class_count
%            scale = params(y,1).pi/sqrt(det(params(y,1).sigma));
%            ex = exp((-1/2)*(x - (params(y,1).mu))*pinv(params(y,1).sigma)*(x - (params(y,1).mu))');
%            prediction(y,1) = ex * scale;
          
           s_pi = log(params(y,1).pi);
           scale = (-1/2)*log(det(params(y,1).sigma)); 
           ex = (-1/2)*(diff(i,:)*pinv(params(y,1).sigma)*diff(i,:)');
           prediction(y,1) = ex + scale + s_pi;
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

  