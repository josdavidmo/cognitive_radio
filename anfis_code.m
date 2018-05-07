function fis_mat = anfis_code(currently_data,NumMf,MfType,numEpochs,towers,records)
    colmin = min(currently_data);
    colmax = max(currently_data);
    train_data = rescale(currently_data,'InputMin',colmin,'InputMax',colmax);
    fid = fopen('log.txt','wt');
    
    parfor i = 1:towers
        start = (records*(i-1))+1;
        fin = i*records;
        data = train_data(start:fin,:);
        fismat = genfis1(data, NumMf, MfType);
        trndata = data(1:3857,:);        
        chkdata = data(3858:5510,:);
        [fismat1,trnErr,ss,fismat2,chkErr]=anfis(trndata,fismat,numEpochs,NaN,chkdata);
        fis_mat(i) = fismat1;
        fprintf(fid, 'ITERACION %d START %d LAST %d ERROR %d', i, start, fin, trnErr);
    end
    delete(gcp('nocreate'));
    fclose(fid);
end

