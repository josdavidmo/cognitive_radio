function [accuracy] = eval_anfis_mode(train_data,fis)
    [rows,columns] = size(train_data);
    accuracy = 0;
    for i=1:rows
        output = evalfis(train_data(i,:),fis);        
        if round(output)>=1
            accuracy = accuracy + 1;
        end
    end
    accuracy = accuracy/rows
end