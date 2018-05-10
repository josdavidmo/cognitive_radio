function [towers, accuracy1, accuracy2] = train_svm_model(file_data, num_towers, options)
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
        [predict_label, accuracy, dec_values] = svmpredict(train_label(start:last,:), train_data(start:last,:), model);
        accuracy1(i) = accuracy(1);
        accuracy2(i) = accuracy(2);
        hbar.iterate(1);
    end
    close(hbar);
    delete(gcp('nocreate'))
end