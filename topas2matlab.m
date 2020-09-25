function Matrix = TOPASto3DMatrix(filename, DoseGrid, dataLines)
% TOPASto3DMatrix converts TOPAS .csv data to a 3D Matrix.
% The following variables are required for proper execution: 
%   varargin{1}: filename of the .csv TOPAS output file
%   varargin{2}: structure containing the dose grid dimensions. Example: 
%                   DoseGrid.Xbins = 50;
%                   DoseGrid.Ybins = 50;
%                   DoseGrid.Zbins = 60;
%   varargin{3}: vector containing the rows of the TOPAS file to import 
%   into the 3D array. The default is [9, Inf].
%% Input handling
% If dataLines is not specified, define defaults
if nargin < 3
    dataLines = [9, Inf];
end
% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 4);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ",";

% Specify column names and types
opts.VariableNames = ["TOPASVersion32", "VarName2", "VarName3", "VarName4"];
opts.VariableTypes = ["double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

%% Import the data
Dij = readtable(filename, opts);

% Convert to output type
Dij = table2array(Dij);
Dij = sortrows(Dij,3);
Dims = GetDims(filename);
Matrix = zeros(Dims(1),Dims(2),Dims(3));
inds = [1:1:numel(Dij(:,1))]';
Matrix(inds) = Dij(inds,4);

function D = GetDims(filename)
% This function gets the dimensions of the binned data. The output, D, has
% the follow format: [XBins,YBins,ZBins]
startRow = 5;
endRow = 7;
formatSpec = '%*6s%3f%[^\n\r]';
%% Open the text file.
fileID = fopen(filename,'r');
%% Read columns of data according to the format.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    dataArray{1} = [dataArray{1};dataArrayBlock{1}];
end
%% Close the text file.
fclose(fileID);
%% Create output variable
D = [dataArray{1:end-1}];
end
end