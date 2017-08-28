function [results_model,results_stepwise]=learn_model(xTrain,source,target)

yTrain_source = source;
yTrain_target = target;

% polynomial prediction (interaction)

% learn model
mdl_source = fitlm(xTrain,yTrain_source,'interactions');
mdl_target = fitlm(xTrain,yTrain_target,'interactions');

% learn stepwise model
mdl_const_source = stepwiselm(xTrain,yTrain_source);
mdl_const_target = stepwiselm(xTrain,yTrain_target);

% evaluate results
source_terms = cell2table(mdl_source.Coefficients.Row(mdl_source.Coefficients.Estimate~=0));
target_terms = cell2table(mdl_target.Coefficients.Row(mdl_target.Coefficients.Estimate~=0));
[common_terms,idx_source,idx_target] = innerjoin(source_terms,target_terms);
results_model = [height(source_terms),...
height(target_terms),...
height(common_terms),...
corr(mdl_source.Coefficients.Estimate(idx_source),mdl_target.Coefficients.Estimate(idx_target),'type','Pearson')];

% evaluate results stepwise
source_terms = cell2table(mdl_const_source.Coefficients.Row);
target_terms = cell2table(mdl_const_target.Coefficients.Row);
idx_significant_terms_source = (mdl_const_source.Coefficients.pValue<0.05);
idx_significant_terms_target = (mdl_const_target.Coefficients.pValue<0.05);

[common_terms,idx_source,idx_target] = innerjoin(source_terms,target_terms);
results_stepwise = [height(source_terms),...
height(target_terms),...
height(common_terms),...
corr(mdl_const_source.Coefficients.Estimate(idx_source),mdl_const_target.Coefficients.Estimate(idx_target),'type','Spearman'),...
length(find(idx_significant_terms_source)),length(find(idx_significant_terms_target))];

end