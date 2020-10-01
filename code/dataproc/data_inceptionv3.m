addpath('./code/dataproc/');
addpath('./data/raw/inceptionv3');

workload_files = ["tx2_sampled_output_inceptionv3_200x200.csv",...
  "tx2_sampled_output_inceptionv3_400x400.csv",...
  "tx2_sampled_output_inceptionv3_600x600.csv",...
  "tx2_sampled_output_inceptionv3_800x800.csv"
  ];

% get one-hot-encoded configurations (all workloads have same configuration)
configurations = extract_configurations_inceptionv3(workload_files(1));

% extract inference time for each workload
responses = [];
for i = 1:length(workload_files)
  % read file
  workload = readtable(workload_files(i));
  % table variable: inference_time -> inference_time_w(i)
  workload.Properties.VariableNames{'inference_time'} = ...
    ['inference_time_w' int2str(i)];
  responses = [responses workload(:,16)];
end

% write processed data to csv with headers
writetable([configurations responses], '.\data\processed\inceptionv3.csv', ...
  'WriteRowNames',true);