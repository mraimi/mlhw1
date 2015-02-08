function count = error( preds, testlabels )
    count = 0;
    for i=1:length(preds)
        if testlabels(i) ~= preds(i,1)
            count = count + 1;
        end
    end
    count = count/length(preds);
end

