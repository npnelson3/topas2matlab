%% topas2matlab tester
% The test data consists of 1D, 2D, and 3D binned TOPAS outputs. This
% script can be used to test the functionality of topas2matlab
clear all; close all;
addpath('TestData')
file = 'TestData/3D.csv'

topas2matlab(file)