function [accuracy] = eval_anfis_mode(train_data,fis)
    [rows,columns] = size(train_data);
    accuracy = 0;
    for i=1:rows
        output = evalfis(train_data(i,:),fis);  
        matrix_anfis(i,:) = [train_data(i,:),output]
        if round(output)>=1
            accuracy = accuracy + 1;
        end
    end
    csvwrite('results_svm.csv',matrix_anfis);
    accuracy = accuracy/rows
end