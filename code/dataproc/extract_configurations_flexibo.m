function [configurations] = extract_configurations_flexibo(fileIn)
%PREPROC_FLEXIBO extract configurations from flexibo data
%   Given a file for flexibo data yeilds a table of one-hot-encoded 
%   configurations.
table = readtable(fileIn);

configurations = [table(:,7:10) one_hot_enc(table(:,11),'cpu_freq_')       ...cpu status and freq
                  table(:,12)   one_hot_enc(table(:,13),'gpu_freq_')       ...gpu status and freq
                  table(:,14)   one_hot_enc(table(:,15),'emc_freq_')       ...emc status and freq
                  ];
end

