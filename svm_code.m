file_data = result_wifi;
labels = file_data(:,5);
data = sparse(file_data(:,1:4));
train_data = data(1:40000,:);
train_label = labels(1:40000,:);
parfor i = 1:8
    start = (5000*(i-1))+1;
    last = i*5000;
    model = svmtrain(train_label(start:last,:), train_data(start:last,:), '-t 0');
end
delete(gcp('nocreate'));