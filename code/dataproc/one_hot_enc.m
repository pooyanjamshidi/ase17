function [output] = one_hot_enc(column,prefix)
%ONE_HOT_ENC Given a (n,1) table with x unique values, produces a (n,x)
% table of one-hot encodings.

[freqs,~,freq_index] = unique(column);
output = array2table(accumarray([(1:length(freq_index)).' freq_index], 1), ...one-hot-encodings
  'VariableNames',strcat(prefix,string(table2array(freqs))));              %  variable names   
end

