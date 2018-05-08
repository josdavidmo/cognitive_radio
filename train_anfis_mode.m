function [fis_mat,start_a,last_a,trn_err,chk_err] = train_anfis_mode(currently_data,NumMf,MfType,numEpochs,towers)
    colmin = min(currently_data);
    colmax = max(currently_data);
    train_data = rescale(currently_data,'InputMin',colmin,'InputMax',colmax);
    data_size = size(train_data);
    batch_size = floor(data_size(1)/towers);
    parfor i = 1:towers
        start = (batch_size*(i-1))+1;
        last = min([i*batch_size data_size(1)]);
        data = train_data(start:last,:);
        fismat = genfis1(data, NumMf, MfType);
        trndata = data(1:last*0.7,:);        
        chkdata = data(last*0.7+1:last,:);
        [fismat1,trnErr,ss,fismat2,chkErr]=anfis(trndata,fismat,numEpochs,NaN,chkdata);
        fis_mat(i) = fismat1;
        start_a(i) = start;
        last_a(i) = last;
        trn_err(i) = trnErr;
        chk_err(i) = chkErr;
    end
    delete(gcp('nocreate'));
end

