NumMf = 3;
MfType = str2mat('pimf','pimf','pimf','pimf','trimf');
FisMatrix = genfis1(result_wifi(1:5400,:), NumMf, MfType);