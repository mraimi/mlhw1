function preds = hw1_nn(preds,distances)
    preds = zeros(size(test,1),40);
    n_vals = [1000 2000 4000 8000];
    error_vals = zeros(4,1);
    error = 0;
    trial_no = 0;
    for x=1;length(n_vals)
        for i=1:10
            trial_no = trial_no + 1;
            rand = randsample(1:size(X,1), n_vals(i,1),0);
            labels = zeros(n_vals(i,1),1);
            t_data = zeros(n_vals(i,1), size(X,2));
            for i=1:length(rand)
                labels(i,1) = Y(rand(1,i),1);
                t_data(i,:) = X(rand(1,i),:);
            end
            for k=1:size(test,1)
                for j=1:size(rand,1)
                    min_dist = bitmax;
                    min_index = -1;
                    if distances(rand(1,j)) < min_dist
                        min_index = rand(1,j);
                        min_dist = distances(rand(1,j));
                    end
                end
                preds(k,trial_no) = Y(min_index,1);
                if Y(min_index,1) ~= Y(min_index,1)
                    error = error + 1;
                end
            end
        end
        error = error/10*size(test,1);
        error_vals(x,1) = error;
        error = 0;   
    end
end