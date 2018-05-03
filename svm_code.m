file_data = csvread('data.csv');
labels = file_data(:,5);
data = sparse(file_data(:,1:4));
train_data = data(1:5000,:);
train_label = labels(1:5000,:);

if isempty(gcp('nocreate'))
    parpool('local', 2)
end

idx = 1:500:length(train_data);
parfor (block = 1:numel(idx))
    start = block(1);
    last = block(2);
    block_data = train_data(start:last,:);
    block_label = train_label(start:last,:);
    model_linear = fitcsvm(block_label, block_data, '-t 0');
end
delete(gcp('nocreate'))
libsvmwrite('data.txt', labels, data);