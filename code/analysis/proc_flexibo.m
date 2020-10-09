% This dataset is significantly different from the other datasets included.
% Here, the configuration space is made up of parameters that we usually
% treat as part of the environmental condition. The TX2 on which this data 
% was collected makes these hardware configurations more user accesible, so
% here we consider transfer learning across workloads and vision models
% (software), where hardware changes take the place of the sofware
% configurations made in other analysis. Also, note that there are no
% invalid configurations for this dataset.

% dependencies
addpath('.\code\util\');

% load configurations and responses (will also write processed data to csv)
data_flexibo

% table -> double as we cannot perform statistical operations on a table
configurations = table2array(configurations);
responses = table2array(responses);

% Manufacture environmental changes:
% [w#, s#] where w#=workload{1,2,3,4} and s#=software{1,2} and arrow
% represents a change. Note again that hardware platform (TX2) remains the
% same.

% all workload changes for a fixed software
% ec1 [w1 -> w2, s1] index 1->2
% ec2 [w1 -> w3, s1] index 1->3
% ec3 [w1 -> w4, s1] index 1->4

% same software change for all workloads
% ec4 [w1, s1 -> s2] index 1->5 
% ec5 [w2, s1 -> s2] index 2->6
% ec6 [w3, s1 -> s2] index 3->7
% ec7 [w4, s1 -> s2] index 4->8

% mixed workload and software changes
% ec8 [w1 -> w2, s1 -> s2] index 1->6
% ec9 [w1 -> w3, s1 -> s2] index 1->7
% ec10[w1 -> w4, s1 -> s2] index 1->8
%%
env_changes = [1,2; 1,3; 1,4;...
               1,5; 2,6; 3,7; 4,8;...
               1,6; 1,7; 1,8];
%generate all env changes
%for i = 1:width(responses)-1
%  for j = i+1:width(responses)
%    env_changes = [env_changes ; [i j]];
%  end
%end
%clear j;

% calculate metrics for each environmental change
metrics = [];
% options for research questions
n_bins = 1000;                                                      % H1.2
n_percentile_conf = round(0.1*height(configurations));              % H1.4

for i = 1:length(env_changes)
  source = responses(:,env_changes(i,1));
  target = responses(:,env_changes(i,2));
  
  % H1.1 - pearson linear correlation
  M1 = corr(source,target);
  
  % H1.2 - performance distribution similarity - KL divergence
  [~,bins_source] = discretize(source, n_bins);
  [~,bins_target] = discretize(target, n_bins);
  pd = fitdist(source,'Kernel');
  pd_source = pdf(pd,bins_source);
  pd = fitdist(target,'Kernel');
  pd_target = pdf(pd,bins_target);
  M2 = KLDiv(pd_source,pd_target+eps); % add eps to avoid zero values
  
  % H1.3 - rank correlation - Spearman correlation
  M3 = corr(source,target,'type','Spearman');
  
  % H1.4 - similarity of top and bottom configurations
  [~,idx_sort_source] = sort(source);
  [~,idx_sort_target] = sort(target);
  top_source_idx = idx_sort_source(1:n_percentile_conf);
  top_target_idx = idx_sort_target(1:n_percentile_conf);
  M4 = length(intersect(top_source_idx,top_target_idx))/...
    n_percentile_conf;
  
  bottom_source_idx = idx_sort_source(end-n_percentile_conf:end);
  bottom_target_idx = idx_sort_target(end-n_percentile_conf:end);
  M5 = length(intersect(bottom_source_idx,bottom_target_idx))/...
    n_percentile_conf;

  % H2.1 - consistency of influential options across environments - ttest
  % M6/M7 - number of influential options in source/target
  % M8/M9 - number of options that are influential in both/one environment
  M6_to_M9 = ttest_proc(configurations, source, target);
  
  % H2.2 - correlation between importance of options across environments -
  % regression tree option importance correlation
  tree_source = ...
    fitrtree(configurations, source, 'CategoricalPredictors','all');
  tree_target = ...
    fitrtree(configurations, target, 'CategoricalPredictors','all');
  predictor_importance_source = predictorImportance(tree_source);
  predictor_importance_target = predictorImportance(tree_target);
  M10 = corr(predictor_importance_source',...
                   predictor_importance_target',...
                   'type','Spearman');
                 
  % H3.1-2 - option interactions are preserved across environments - learn
  % pairwise interactions with step-wise linear regression models and
  % calculate the percentage of common pairwise interactions
  % M11/M12: the number of interactions in the source/target
  
  M11_to_M14 = learn_model(configurations, source, target);
  
  % H4.1 - invalid configurations
  M15_to_M17 = nan(1,3); % we have no invalid configurations to measure
  
  % H4.2 - classifier reusability (for invalid configurations)
  M18 = nan; % we have no invalid configurations to measure
  
  metrics = [metrics ;...
    M1 M2 M3 M4 M5 M6_to_M9 M10 M11_to_M14 M15_to_M17 M18];
end

%% create latex table
input.data = metrics;
% Set column labels (use empty string for no label):
input.tableColLabels = {'M1','M2','M3','M4','M5','M6','M7','M8','M9','M10',...
                        'M11','M12','M13','M14','M15','M16','M17','M18'};
% Set row labels (use empty string for no label):
input.tableRowLabels = {'ec1: [w1 $\rightarrow$ w2, s1]',...
                        'ec2: [w1 $\rightarrow$ w3, s1]',...
                        'ec3: [w1 $\rightarrow$ w4, s1]',...
                        'ec4: [w1, s1 $\rightarrow$ s2]',...
                        'ec5: [w2, s1 $\rightarrow$ s2]',...
                        'ec6: [w3, s1 $\rightarrow$ s2]',...
                        'ec7: [w4, s1 $\rightarrow$ s2]',...
                        'ec8: [w1 $\rightarrow$ w2, s1 $\rightarrow$ s2]',...
                        'ec9: [w1 $\rightarrow$ w3, s1 $\rightarrow$ s2]',...
                        'ec10:[w1 $\rightarrow$ w4, s1 $\rightarrow$ s2]'};
                      
% Switch transposing/pivoting your table:
input.transposeTable = 0;

% Determine whether input.dataFormat is applied column or row based:
input.dataFormatMode = 'column'; % use 'column' or 'row'. if not set 'colum' is used

input.dataFormat = {'%.3f',18}; % three digits precision

% Define how NaN values in input.tableData should be printed in the LaTex table:
input.dataNanString = '-';

% Column alignment in Latex table ('l'=left-justified, 'c'=centered,'r'=right-justified):
input.tableColumnAlignment = 'c';

% Switch table borders on/off (borders are enabled by default):
input.tableBorders = 0;

% LaTex table caption:
input.tableCaption = 'Results';

% LaTex table label:
input.tableLabel = 'results';

% Switch to generate a complete LaTex document or just a table:
input.makeCompleteLatexDocument = 0;

% call latexTable:
latex = latexTable(input);


