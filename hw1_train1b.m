function params = hw1_train1b(X,Y)
    class_count = 10;
    pi = zeros(class_count,1);
    fixed_sig = eye(size(X, 2));
    
    for q=1:length(Y)
            pi((Y(q)+1),1) = pi((Y(q)+1),1) + 1;
    end
    pi = pi/length(Y);
 
    mu = zeros(class_count,size(X,2));
    for q=1:length(Y)
            mu((Y(q)+1),:) =  mu((Y(q)+1),:) + X(q,:)/pi((Y(q)+1),1);
    end
    mu = mu/length(Y);
    
    diff = zeros(length(Y),size(X,2));
    %sig = zeros(size(X,2), size(X,2));
    mu_y = zeros(1,size(X,2));
    pi_y = zeros(1,1);
    class = struct('pi', pi_y, 'mu', mu_y, 'sigma', fixed_sig);
    params(class_count,1) = class;

    for q=1:class_count-1
        params(q,1) = class;
    end
    
    for q=1:length(Y)
        diff(q,:) = X(q,:)- mu((Y(q)+1), :);
    end
    
    for q=1:length(Y)
        %params((Y(q)+1),1).sigma = params((Y(q)+1),1).sigma + diff(q, :)'*(diff(q,:));
        params((Y(q)+1),1).sigma = fixed_sig;
    end
    
    for q=1:class_count
        params(q,1).pi = params(q,1).pi + pi(q);
        params(q,1).mu = params(q,1).mu + mu(q,:);
        params(q,1).sigma = params(q,1).sigma/(pi(q,1)*length(Y));
    end
    
    %sig_inv = pinv(params(1,1).sigma);
    
end