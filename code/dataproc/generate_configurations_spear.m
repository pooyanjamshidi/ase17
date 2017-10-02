function configurations = generate_configurations_spear(number_of_conf)
parameters = {'spset-old-default','spset-autotuned-fh_1_0','spset-autotuned-fh_1_1','spset-autotuned-fh_1_2','spset-autotuned-fh_1_3',...
    'spset-sw-verif', 'spset-hw-bmc','spset-graph-coloring','spset-quasigroup'};
parameters_cat = {'sp-var-dec-heur','sp-learned-clause-sort-heur','sp-orig-clause-sort-heur','sp-res-order-heur','sp-clause-del-heur',...
    'sp-phase-dec-heur','sp-resolution','sp-use-pure-literal-rule'};
number_of_parameters = length(parameters);
number_of_cat_parameters = length(parameters_cat);

dir = '../../experiments/spear/toMeasure18April2017/';
formatSpec = ['--%s '];
configurations = [];

design = doeFullFactorial(repmat([0 1],number_of_parameters+number_of_cat_parameters,1));

for i=1:number_of_conf
    confstr = [];
    configuration = design(i,:); %randi([0 1],1,number_of_parameters);
    configurations = [configurations;configuration];
    fid = fopen([dir num2str(i) '.txt'],'w');
    for j=1:number_of_parameters
        if configuration(j)~=0
            confstr = [confstr sprintf(formatSpec,parameters{j})];
        end
    end
    for j=1:number_of_cat_parameters
        if configuration(j)~=0
            confstr = [confstr sprintf(formatSpec,parameters_cat{j}) '1 '];
        else
            confstr = [confstr sprintf(formatSpec,parameters_cat{j}) '0 '];
        end
    end
    fprintf(fid,confstr);
    fclose(fid);
end
save([dir 'configurations.mat'],'configurations');
end