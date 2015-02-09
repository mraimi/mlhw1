function preds = hw1_nn(X,Y,test, distances)
    preds = zeros(size(test,1),1);
    n_vals = [1000 2000 4000 8000];
    for i=1;length(n_vals)
        rand = randsample(1:size(X,1), n_vals(i,1),0);
        labels = zeros(n_vals(i,1),1);
        t_data = zeros(n_vals(i,1), size(X,2));
        for i=1:length(rand)
            labels(i,1) = Y(rand(1,i),1);
            t_data(i,:) = X(rand(1,i),:);
        end
        
% ---------------prediction------------- %        
        for i=1:10
            error = 0;
            for j=1:size(rand,1)
                min_dist = bitmax;
                min_index = -1;
                if distances(rand(1,j)) < min_dist
                    min_index = rand(1,j);
                    min_dist = distances(rand(1,j));
                end
                
                
            end
            
        error = 0;    
        end
    end

end