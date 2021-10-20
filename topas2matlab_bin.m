function [data] = topas2matlab_bin(xbins,ybins,zbins,filename)
fileID = fopen(filename,'r+');
binDoseDouble = fread(fileID,'double');
inds = [1:1:numel(binDoseDouble)];
BinMatrix = zeros(xbins,ybins,zbins);
BinMatrix(inds) = binDoseDouble(inds);
data = BinMatrix;
fclose('all');
end
