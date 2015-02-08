function preds = hw1_test1a(params,test)
   %diff = zeros(length(Y),size(X,2));
   
   prediction = zeros(10,1);
   preds(length(test), 1) = -1;
   class_count = 10;
%   sigma_y(784,784);
   
   %{ ------pre-computing inverse sigma----- %}
   
   %inv_sig_y = struct('sigma_y', sigma_y);
   
   %inv_sig_container(class_count,1) = inv_sig_y;
   
 
   
    
    
    %{
    for q=1:length(Y)
        diff(q,:) = X(q,:)- params(1,1).mu((Y(q)+1), :);
    end
    %}
    
    
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

  