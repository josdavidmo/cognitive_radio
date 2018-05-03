NumMf = 3;
MfType = str2mat('pimf','pimf','pimf','pimf','trimf');
results = [];
numEpochs=100;
parfor i = 1:9
    start = (110200*(i-1))+1
    fin = i*110200
    data = result_wifi(start:fin,:);
    fismat = genfis1(data, NumMf, MfType);
    trndata = data(1:77140,:);
    chkdata = data(77141:110200 ,:);
    [fismat1,trnErr,ss,fismat2,chkErr]=anfis(trndata,fismat,numEpochs,NaN,chkdata);
    
    %results(i) = [fismat1,trnErr,ss,fismat2,chkErr];
    results(i,:) = [start,fin]
end

