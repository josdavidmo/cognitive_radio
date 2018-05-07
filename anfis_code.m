function [fis_mat,index] = anfis_code(currently_data,NumMf,MfType,numEpochs,towers,records)
    colmin = min(currently_data);
    colmax = max(currently_data);
    train_data = rescale(currently_data,'InputMin',colmin,'InputMax',colmax);
    fid = fopen('log.txt','wt');
    index = [];
    parfor i = 1:towers
        start = (records*(i-1))+1;
        fin = i*records;
        data = train_data(start:fin,:);
        fismat = genfis1(data, NumMf, MfType);
        trndata = data(1:records*0.7,:);        
        chkdata = data(records*0.7+1:records,:);
        [fismat1,trnErr,ss,fismat2,chkErr]=anfis(trndata,fismat,numEpochs,NaN,chkdata);
        fis_mat(i) = fismat1;
        row = [i,start,fin,trnErr,chkErr];
        index = [index;row];
        fprintf(fid, 'ITERACION %d START %d LAST %d ERROR %d', i, start, fin, trnErr);
    end
    delete(gcp('nocreate'));
    fclose(fid);
end

