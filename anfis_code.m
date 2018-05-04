NumMf = 3;
MfType = str2mat('pimf','pimf','pimf','pimf','trimf');
results = [];
numEpochs=50;
train_data = result_wifi(1:27550,:);

if isempty(gcp('nocreate'))
    parpool('local', 2)
end

parfor i = 1:5
    start = (5510*(i-1))+1
    fin = i*5510
    data = train_data(start:fin,:);
    fismat = genfis1(data, NumMf, MfType);
    trndata = data(1:3857,:);
    chkdata = data(3858:5510,:);
    [fismat1,trnErr,ss,fismat2,chkErr]=anfis(trndata,fismat,numEpochs,NaN,chkdata);
    
    %results(i) = [fismat1,trnErr,ss,fismat2,chkErr];
    results(i,:) = [start,fin]
end

