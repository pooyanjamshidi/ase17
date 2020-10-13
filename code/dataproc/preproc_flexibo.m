function [configurations] = preproc_flexibo(fileIn)
%PREPROC_FLEXIBO extract configurations from flexibo data
%   Extracts columns of 
table = readtable(fileIn);

configurations = table(:,7:15);
end

