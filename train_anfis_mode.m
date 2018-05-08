function [fis_mat,index] = train_anfis_mode(currently_data,NumMf,MfType,numEpochs,towers,records)
    colmin = min(currently_data);
    colmax = max(currently_data);
    train_data = rescale(currently_data,'InputMin',colmin,'InputMax',colmax);
    data_size = size(file_data);
    batch_size = floor(data_size(1)/num_towers);
    index = [];
    parfor i = 1:towers
        start = (records*(i-1))+1;
        last = min([i*batch_size data_size(1)]);
        data = train_data(start:last,:);
        fismat = genfis1(data, NumMf, MfType);
        trndata = data(1:records*0.7,:);        
        chkdata = data(records*0.7+1:records,:);
        [fismat1,trnErr,ss,fismat2,chkErr]=anfis(trndata,fismat,numEpochs,NaN,chkdata);
        fis_mat(i) = fismat1;
        row = [i,start,last,trnErr,chkErr];
        index = [index;row];
        fprintf('ITERACION %d START %d LAST %d ERROR %d \n', i, start, last, trnErr);
    end
    delete(gcp('nocreate'));
end

