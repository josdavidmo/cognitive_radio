function [towers, accuracy, error] = train_svm_model(file_data, num_towers, options)
    addpath('progress');
    addpath('libsvm');
    labels = file_data(:,5);
    data = sparse(file_data(:,1:4));
    train_data = data;
    train_label = labels;
    data_size = size(file_data);
    batch_size = floor(data_size(1)/num_towers);
    hbar = parfor_progressbar(num_towers,'Training Models');
    parfor i = 1:num_towers     
        start = (batch_size*(i-1))+1;
        last = min([i*batch_size data_size(1)]);
        fprintf('Training data %d - %d\n', start, last);
        model = svmtrain(train_label(start:last,:), train_data(start:last,:), options);
        towers(i) = model;        
        hbar.iterate(1);
    end
    for i = 1:num_towers
        start = (batch_size*(i-1))+1;
        last = min([i*batch_size data_size(1)]);
        [lbl, result, ~] = svmpredict(train_label(start:last,:), train_data(start:last,:), towers(i));
        accuracy(i) = result(1);
        error(i) = result(2);
        fprintf('Results');
        matrix_svm(start:last,:) = [file_data(start:last,1:4),lbl]
    end
    csvwrite('results_svm.csv',matrix_svm);
    close(hbar);
    delete(gcp('nocreate'))
end