function [Dose] = readBinHeader(filename, dataLines)
%IMPORTFILE Import data from a text file
%  DIJ = IMPORTFILE(FILENAME) reads data from text file FILENAME for the
%  default selection.  Returns the numeric data.
%
%  DIJ = IMPORTFILE(FILE, DATALINES) reads data for the specified row
%  interval(s) of text file FILENAME. Specify DATALINES as a positive
%  scalar integer or a N-by-2 array of positive scalar integers for
%  dis-contiguous row intervals.
%
%  Example:
%  Dij = importfile("C:\Users\nnelson\OneDrive - UW-Madison\Graduate School\Research\DCS Project\Monte Carlo\Dosimetry\3D Dosimetry\Analysis\BinaryScorerTesting\Dij.binheader", [5, 7]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 18-Oct-2021 10:53:11

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [5, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 8);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ["\t", " ", ",", ";"];

% Specify column names and types
opts.VariableNames = ["Var1", "Var2", "Var3", "scorer", "Var5", "Var6", "VarName7", "Var8"];
opts.SelectedVariableNames = ["scorer", "VarName7"];
opts.VariableTypes = ["string", "string", "string", "double", "string", "string", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";

% Specify variable properties
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var5", "Var6", "Var8"], "WhitespaceRule", "preserve");
opts = setvaropts(opts, ["Var1", "Var2", "Var3", "Var5", "Var6", "Var8"], "EmptyFieldRule", "auto");

% Import the data
Dij = readtable(filename, opts);

%% Convert to output type
Dij = table2array(Dij);
Dose.xbins = Dij(1);
Dose.ybins = Dij(2);
Dose.zbins = Dij(3);
Dose.xRes = Dij(1,2);
Dose.yRes = Dij(2,2);
Dose.zRes = Dij(3,2);
end