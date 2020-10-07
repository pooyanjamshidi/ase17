addpath('./code/dataproc/');
addpath('./data/raw/flexibo');

data = ["tx2_sampled_output_inceptionv3_200x200.csv",                   ...[s1,w1]
  "tx2_sampled_output_inceptionv3_400x400.csv",                         ...[s1,w2]
  "tx2_sampled_output_inceptionv3_600x600.csv",                         ...[s1,w3]
  "tx2_sampled_output_inceptionv3_800x800.csv",                         ...[s1,w4]
  "tx2_sampled_output_xception_200x200.csv",                            ...[s2,w1]
  "tx2_sampled_output_xception_400x400.csv",                            ...[s2,w2]
  "tx2_sampled_output_xception_600x600.csv",                            ...[s2,w3]
  "tx2_sampled_output_xception_800x800.csv"                               %[s2,w4]
  ];

response_names = strcat("tx2", extractBetween(data,"output",".csv"));

% get one-hot-encoded configurations (all files have same configurations in
% the same order)
configurations = extract_configurations_flexibo(data(1));

% extract inference time for each model and workload
responses = [];
for i = 1:length(data)
  % read file
  table = readtable(data(i));
  % rename response: inference_time -> inference_time_*file name*
  table.Properties.VariableNames{'inference_time'} = ...
    ['inference_time_' convertStringsToChars(response_names(i))];
  responses = [responses table(:,16)];
end
% remove unused variables
clear i
clear data
clear response_names
clear table

% write processed data to csv with headers
writetable([configurations responses], '.\data\processed\flexibo.csv', ...
  'WriteRowNames',true);