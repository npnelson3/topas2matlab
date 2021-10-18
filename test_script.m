clear all; close all;
% Load Bin data
[Dose] = readBinHeader('TestData/Dij.binheader');
Dose.Data = topas2matlab_bin(Dose.xbins,Dose.ybins,Dose.zbins,'Dij.bin');
% Load CSV data
[dose_csv] = topas2matlab('TestData/Dij.csv','Rectilinear');


figure
imagesc(Dose.Data(:,:,end))
title('Binary dose')


figure
imagesc(dose_csv(:,:,end))
title('CSV dose')