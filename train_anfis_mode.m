function [fis_mat,trn_err,chk_err,output] = train_anfis_mode(currently_data,NumMf,MfType,numEpochs,towers)
    addpath('progress');
    colmin = min(currently_data);
    colmax = max(currently_data);
    train_data = rescale(currently_data,'InputMin',colmin,'InputMax',colmax);
    data_size = size(train_data);
    batch_size = floor(data_size(1)/towers);
    hbar = parfor_progressbar(towers,'Training Models');
    parfor i = 1:towers
        start = (batch_size*(i-1))+1;
        last = min([i*batch_size data_size(1)]);
        data = train_data(start:last,:);
        fismat = genfis1(data, NumMf, MfType);
        trndata = data(1:batch_size*0.7,:);        
        chkdata = data(batch_size*0.7+1:batch_size,:);
        [fismat1,trnErr,ss,fismat2,chkErr]=anfis(trndata,fismat,numEpochs,NaN,chkdata);
        output(i) = eval_anfis_mode(chkdata(:,1:4),fismat1);
        fis_mat(i) = fismat1;
        trn_err(i) = trnErr(numEpochs);
        chk_err(i) = chkErr(numEpochs);
        hbar.iterate(1);
    end
    close(hbar);
    delete(gcp('nocreate'));
end

