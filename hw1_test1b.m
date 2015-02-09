function preds = hw1_test1a(params,test)
   class_count = 10;
   preds(length(test), 1) = -1;
   results = zeros(size(test,1), class_count);
   curr_test = test;
   
   for i=1:class_count
        curr_test = test;
        curr_test = bsxfun(@minus, curr_test, params(i, 1).mu);
            
%       l_det = (-1/2)*log(det(params(i, 1).sigma));
        l_pi = log(params(i, 1).pi);
        
        for j=1:size(test,1)
            curr_vec = curr_test(j,:);
            temp = curr_vec*(curr_vec');
            results(j,i) = (-1/2)*temp + l_pi;
        end
   end
   
   for i=1:size(test,1)
        [~,tmp] = max(results(i,:));
        preds(i,1) = tmp-1;
   end

end

  