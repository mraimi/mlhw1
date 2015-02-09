function preds = hw1_nn(X,Y,test,distances)
    preds = zeros(size(test,1),40);
    n_vals = [1000 2000 4000 8000];
    trial_no = 0;
    for x=1:size(n_vals,2)
        for i=1:10
            trial_no = trial_no + 1;
            rand = randsample(1:size(X,1), n_vals(1,x),0);
            labels = zeros(n_vals(1,x),1);
            t_data = zeros(n_vals(1,x), size(X,2));
            for b=1:length(rand)
                labels(b,1) = Y(rand(1,b),1);
                t_data(b,:) = X(rand(1,b),:);
            end
            for k=1:size(test,1)
                 min_dist = 100000000000;
                 min_index = -1;
                for j=1:size(rand,2)  
                    if distances(rand(1,j),k) < min_dist
                        min_index = rand(1,j);
                        min_dist = distances(rand(1,j),k);
                    end
                end
                preds(k,trial_no) = Y(min_index,1);
            end 
        end
    end
end