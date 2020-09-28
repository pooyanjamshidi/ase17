function [summary_results, ss, tt] = ttest_proc(config, source, target)

number_of_treatment_agreed = 0;
number_of_treatment_disagreed = 0;

number_of_significant_source = 0;
number_of_significant_target = 0;
%number_of_significant_insignificant = 0;

ss = zeros(1,size(config,2));
tt = zeros(1,size(config,2));

d = size(config,2);

for i = 1:d
    % set the variables
    xi=i;
    
    idx_xi_enabled = (config(:,xi)==1);
    idx_xi_disabled = (config(:,xi)==0);
    if isempty(find((idx_xi_enabled))) || isempty(find((idx_xi_disabled)))
        continue
    end
    
    % pairing process
    paired_configs = [];
    for c=1:length(config)
        if idx_xi_disabled(c)==1
            conf = config(c,:);
            feature_status = conf(:,xi);
            flipped = [conf(:,1:xi-1),~feature_status,conf(:,xi+1:end)];
            pair_conf_idx = find(ismember(config,flipped,'rows'));
            if ~isempty(pair_conf_idx)
                paired_configs = [paired_configs; pair_conf_idx(1) c ];
            end
        end
    end
    
    if isempty(paired_configs)
        continue
    end
    
    delta_source = source(paired_configs(:,1),:)-source(paired_configs(:,2),:);
    delta_target = target(paired_configs(:,1),:)-target(paired_configs(:,2),:);
    effect_on_source = median(delta_source);
    effect_on_target = median(delta_target);
    
    
    [h_source,p_source,ci_source,stats_source] = ttest(source(paired_configs(:,1),:),source(paired_configs(:,2),:));
    [h_target,p_target,ci_target,stats_target] = ttest(target(paired_configs(:,1),:),target(paired_configs(:,2),:));
    
    
    if h_source==1
        number_of_significant_source = number_of_significant_source+1;
        ss(xi) = 1;
    end
    
    if h_target==1
        number_of_significant_target = number_of_significant_target+1;
        tt(xi) = 1;
    end
    
%     if (h_source==1 && h_target==0) || (h_source==0 && h_target==1)
%         number_of_significant_insignificant=number_of_significant_insignificant+1;
%     end
    
    if  h_source==1 && h_target==1 % significant on both source and target
        if sign(effect_on_source)==sign(effect_on_target)
            number_of_treatment_agreed = number_of_treatment_agreed+1;
        else
            number_of_treatment_disagreed = number_of_treatment_disagreed+1;
        end
    end    
end

summary_results = [number_of_significant_source, number_of_significant_target,...#number_of_significant_insignificant,...
    number_of_treatment_agreed, number_of_treatment_disagreed];