NumMf = 3;
MfType = str2mat('pimf','pimf','pimf','trimf');
results = [];
numEpochs=20;
currently_data= result_wifi(1:27550,:);
colmin = min(currently_data);
colmax = max(currently_data);
train_data = rescale(currently_data,'InputMin',colmin,'InputMax',colmax);

if isempty(gcp('nocreate'))
    parpool('local', 2)
end

fid = fopen('log.txt','wt');

parfor i = 1:5
    start = (5510*(i-1))+1
    fin = i*5510
    data = train_data(start:fin,:);
    fismat = genfis1(data, NumMf, MfType);
    trndata = data(1:3857,:);
    
    chkdata = data(3858:5510,:);
    [fismat1,trnErr,ss,fismat2,chkErr]=anfis(trndata,fismat,numEpochs,NaN,chkdata);
    fprintf(fid, 'ITERACION %d START %d LAST %d ERROR %d', i, start, fin, trnErr);
    %results(i) = [fismat1,trnErr,ss,fismat2,chkErr];
    results(i,:) = [start,fin]
end

delete(gcp('nocreate'));
fclose(fid);