function [towers, accuracy, error] = train_svm_model(file_data, num_towers, options,random_distribution)
    addpath('progress');
    addpath('libsvm');
    labels = file_data(:,5);
    file_data(1:10,:)
    data = sparse(file_data(:,1:4));
    train_data = data;
    train_label = labels;
    data_size = size(file_data);
    batch_array = distribution_towers(data_size(1),num_towers,random_distribution);
    %hbar = parfor_progressbar(num_towers,'Training Models');
    parfor i = 1:num_towers     
        start = batch_array(i);
        last = batch_array(i+1)-1;
        fprintf('Training data %d - %d\n', start, last);
        model = svmtrain(train_label(start:last,:), train_data(start:last,:), options);
        towers(i) = model;        
        %hbar.iterate(1);
    end
    for i = 1:num_towers
        start = batch_array(i);
        last = batch_array(i+1)-1;
        [lbl, ~, ~] = svmpredict(train_label(start:last,:), train_data(start:last,:), towers(i));
        %accuracy(i) = result(1);
        %error(i) = result(2);
        matrix_svm(start:last,:) = [file_data(start:last,1:4),lbl];
    end
    csvwrite('results_GSMLow10800.csv',matrix_svm);
    close(hbar);
    delete(gcp('nocreate'))
end