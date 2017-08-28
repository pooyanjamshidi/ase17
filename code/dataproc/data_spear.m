load('../../experiments/spear/toMeasure16April2017/configurations.mat');

parameters = {'spset-old-default','spset-autotuned-fh_1_0','spset-autotuned-fh_1_1','spset-autotuned-fh_1_2','spset-sw-verif',...
    'spset-hw-bmc','sp-var-dec-heur','sp-learned-clause-sort-heur','sp-orig-clause-sort-heur','sp-res-order-heur','sp-clause-del-heur',...
    'sp-phase-dec-heur','sp-resolution','sp-use-pure-literal-rule'};

responses = {'solving_time_feature1_2_7_10286','solving_time_feature8_2_7_10286','solving_time_feature9_1_2_10286'...
    'solving_time_feature10_1_2_8287','solving_time_feature11_2_7_4435','solving_time_feature12_2_7_18830'...
    'solving_time_amazon_micro_2_7_10286','solving_time_azure_2_7_10286','solving_time_amazon_nano_2_7_10286'...
    'solving_time_feature20_2_7_10286'};
num_of_options = length(parameters);


solving_time_feature1_2_7_10286 = preproc_spear('../../experiments/spear/measurements/feature1_2.7.spear.results_SWlin2006.10286.cnf.txt');
solving_time_feature8_2_7_10286 = preproc_spear('../../experiments/spear/measurements/feature8_2.7.spear.results_SWlin2006.10286.cnf.txt');
solving_time_feature9_1_2_10286 = preproc_spear('../../experiments/spear/measurements/feature9_1.2.spear.results_SWlin2006.10286.cnf.txt');
solving_time_feature10_1_2_8287 = preproc_spear('../../experiments/spear/measurements/feature10_1.2.spear.results_SWlin2006.8287.cnf.txt');
solving_time_feature11_2_7_4435 = preproc_spear('../../experiments/spear/measurements/feature11_2.7.spear.results_SWlin2006.4435.cnf.txt');
solving_time_feature12_2_7_18830 = preproc_spear('../../experiments/spear/measurements/feature12_2.7.spear.results_SWlin2006.18830.cnf.txt');
solving_time_amazon_micro_2_7_10286 = preproc_spear('../../experiments/spear/measurements/amazon_micro_2.7.spear.results_SWlin2006.10286.cnf.txt');
solving_time_azure_2_7_10286 = preproc_spear('../../experiments/spear/measurements/azure_spear.results_SWlin2006.10286.cnf.txt');
solving_time_amazon_nano_2_7_10286 = preproc_spear('../../experiments/spear/measurements/amazon_nano166_spear.results_SWlin2006.10286.cnf.txt');
solving_time_feature20_2_7_10286 = preproc_spear('../../experiments/spear/measurements/feature20_2.7.spear.results_SWlin2006.10286.cnf.txt');

spear = [configurations ...
   mean(solving_time_feature1_2_7_10286,2), mean(solving_time_feature8_2_7_10286,2), mean(solving_time_feature9_1_2_10286,2)...
   mean(solving_time_feature10_1_2_8287,2), mean(solving_time_feature11_2_7_4435,2), mean(solving_time_feature12_2_7_18830,2)...
   mean(solving_time_amazon_micro_2_7_10286,2), mean(solving_time_azure_2_7_10286,2), mean(solving_time_amazon_nano_2_7_10286,2)...
   mean(solving_time_feature20_2_7_10286,2)
];

csvwrite_with_headers('spear.csv',spear,[parameters,responses])