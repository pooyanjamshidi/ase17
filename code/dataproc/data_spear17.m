load('../../experiments/spear/toMeasure18April2017/configurations.mat');

parameters = {'spset-old-default','spset-autotuned-fh_1_0','spset-autotuned-fh_1_1','spset-autotuned-fh_1_2','spset-autotuned-fh_1_3',...
    'spset-sw-verif', 'spset-hw-bmc','spset-graph-coloring','spset-quasigroup','sp-var-dec-heur','sp-learned-clause-sort-heur','sp-orig-clause-sort-heur','sp-res-order-heur','sp-clause-del-heur',...
    'sp-phase-dec-heur','sp-resolution','sp-use-pure-literal-rule'};

responses = {'solving_time_feature8_2_7_10286','solving_time_feature9_2_7_4166','solving_time_amazon_micro_2_7_10286'};
num_of_options = length(parameters);


solving_time_feature8_2_7_10286 = preproc_spear('../../experiments/spear/measurements/feature8_2.7.spear17.results_SWlin2006.10286.cnf.txt');
solving_time_feature9_2_7_4166 = preproc_spear('../../experiments/spear/measurements/feature9_2.7.spear17.results_SWlin2006.4166.cnf.txt');
solving_time_amazon_micro_2_7_10286 = preproc_spear('../../experiments/spear/measurements/amazon_micro_2.7.spear17.results_SWlin2006.10286.cnf.txt');

spear = [configurations ...
   mean(solving_time_feature8_2_7_10286,2), mean(solving_time_feature9_2_7_4166,2), mean(solving_time_amazon_micro_2_7_10286,2)
];

csvwrite_with_headers('spear17.csv',spear,[parameters,responses])