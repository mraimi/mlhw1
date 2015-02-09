function preds = hw1_test1a(params,test)
   class_count =3;
   preds(length(test), 1) = -1;
   results = zeros(size(test,1), class_count);
   curr_test = test;
   
%    diff = test;
%    for i=1:length(test)
%       mu_y = params(labels(i,1)+1, 1).mu;
%       diff(i,:) = diff(i,:) - mu_y; 
%    end
   
   for i=1:class_count
       curr_test = test;
        curr_test = bsxfun(@minus, curr_test, params(i, 1).mu);
            
        l_det = (-1/2)*log(det(params(i, 1).sigma));
        l_pi = log(params(i, 1).pi);
        
        for j=1:size(test,1)
            curr_vec = curr_test(j,:);
            temp = curr_vec*pinv(params(i,1).sigma)*(curr_vec');
            results(j,i) = (-1/2)*temp + l_det + l_pi;
        end
   end
   
   for i=1:size(test,1)
        [~,tmp] = max(results(i,:));
        preds(i,1) = tmp-1;
   end
%{    
    for i=1:length(test)
        x = test(i,:);
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
        
  %}  
end

  