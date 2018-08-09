function [fis_mat,trn_err,chk_err,output] = train_anfis_mode(currently_data,NumMf,MfType,numEpochs,towers,random_distribution)
    addpath('progress');
    colmin = min(currently_data);
    colmax = max(currently_data);
    opt = genfisOptions('GridPartition');
    opt.NumMembershipFunctions = NumMf;
    opt.InputMembershipFunctionType = MfType;
    train_data = rescale(currently_data,'InputMin',colmin,'InputMax',colmax);
    data_size = size(train_data);
    batch_array = distribution_towers(data_size(1),num_towers,random_distribution);
    hbar = parfor_progressbar(towers,'Training Models');
    parfor i = 1:towers
        start = batch_array(i);
        last = batch_array(i+1)-1;
        data = train_data(start:last,:);
        fismat = genfis(data(:,1:4), data(:,5), opt);
        trndata = data(1:batch_size*0.8,:);        
        chkdata = data(batch_size*0.8+1:batch_size,:);
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

