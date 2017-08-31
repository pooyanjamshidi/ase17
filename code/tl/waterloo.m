clear

exp = 'sac_nbody';

% load data

switch exp
    
    case 'spear'
        % spear
        data = csvread('../../experiments/data_for_tl/spear.csv',1,0);
        % parameters
        parameters = {'spset-old-default','spset-autotuned-fh_1_0','spset-autotuned-fh_1_1','spset-autotuned-fh_1_2','spset-sw-verif',...
            'spset-hw-bmc','sp-var-dec-heur','sp-learned-clause-sort-heur','sp-orig-clause-sort-heur','sp-res-order-heur','sp-clause-del-heur',...
            'sp-phase-dec-heur','sp-resolution','sp-use-pure-literal-rule'};
        responses = {'solving_time_feature1_2_7_10286','solving_time_feature8_2_7_10286','solving_time_feature9_1_2_10286'...
            'solving_time_feature10_1_2_8287','solving_time_feature11_2_7_4435','solving_time_feature12_2_7_18830'...
            'solving_time_amazon_micro_2_7_10286','solving_time_azure_2_7_10286','solving_time_amazon_nano_2_7_10286'...
            'solving_time_feature20_2_7_10286'};
        exp_pairs = [15 16; 21 16; 16 19; 16 20; 16 17; 17 19; 16 18];
        inv_th = 5;
        
    case 'x264'
        % x264
        data = csvread('../../experiments/data_for_tl/x264.csv',1,0);
        parameters = {'non-deterministic','no-asm','no-mixed-refs','no-chroma-me',...
            'no-8x8dct','no-fast-pskip','no-dct-decimate',...
            'no-scenecut','no-cabac','no-deblock','no-mbtree',...
            'no-weightb','no-psy','no-progress','visualize','dts-compress'};
        responses = {'encoding_time_feature1_2762_8','encoding_time_feature1_2762_32','encoding_time_feature1_2762_128'...
            'encoding_time_feature8_2762_8','encoding_time_feature8_2762_32','encoding_time_feature8_2762_128'...
            'encoding_time_feature9_2389_8','encoding_time_feature9_2389_32','encoding_time_feature9_2389_128'...
            'encoding_time_feature10_2744_8','encoding_time_feature10_2744_32','encoding_time_feature10_2744_128'...
            'encoding_time_azure_2762_8','encoding_time_azure_2762_32','encoding_time_azure_2762_128'...
            'encoding_time_amazon_nano_2762_8','encoding_time_amazon_nano_2762_32','encoding_time_amazon_nano_2762_128'...
            'encoding_time_amazon_amazon_micro_2762_8','encoding_time_amazon_amazon_micro_2762_32','encoding_time_amazon_amazon_micro_2762_128'
            };
        exp_pairs = [19 22; 17 20; 20 21; 20 22; 28 22; 25 22; 26 22; 26 19];
        inv_th = 0;
        
    case 'sqlite'
        % sqlite
        data = csvread('../../experiments/data_for_tl/sqlite.csv',1,0);
        parameters = {'SQLITE_SECURE_DELETE','SQLITE_ENABLE_ATOMIC_WRITE','SQLITE_ENABLE_STAT2','SQLITE_DISABLE_LFS',...
            'SQLITE_DISABLE_DIRSYNC','SQLITE_OMIT_AUTOMATIC_INDEX','SQLITE_OMIT_BETWEEN_OPTIMIZATION',...
            'SQLITE_OMIT_BTREECOUNT','SQLITE_OMIT_LIKE_OPTIMIZATION','SQLITE_OMIT_LOOKASIDE','SQLITE_OMIT_OR_OPTIMIZATION',...
            'SQLITE_OMIT_QUICKBALANCE','SQLITE_OMIT_SHARED_CACHE','SQLITE_OMIT_XFER_OPT'};
        responses = {'operation_time_feature7_3763','operation_time_feature6_3763','operation_time_feature4_3190'...
            'operation_time_feature3_3763','operation_time_feature20_3763','operation_time_feature21_3190',...
            'operation_time_amazon_micro_3763'
            };
        benchmark = {'fillseq','fillseqsync','fillseqbatch','fillrandom','fillrandsync'...
            'fillrandbatch','overwrite','overwritebatch','readrandom','readseq'...
            'fillrand100K','fillseq100K','readseq','readrand100K'};
        exp_pairs = [length(parameters)+4*length(benchmark)+1 length(parameters)+3*length(benchmark)+1;...
            length(parameters)+4*length(benchmark)+3 length(parameters)+3*length(benchmark)+3; ...
            length(parameters)+0*length(benchmark)+1 length(parameters)+0*length(benchmark)+3; ...
            length(parameters)+0*length(benchmark)+9 length(parameters)+0*length(benchmark)+10; ...
            length(parameters)+2*length(benchmark)+1 length(parameters)+1*length(benchmark)+1; ...
            length(parameters)+2*length(benchmark)+3 length(parameters)+1*length(benchmark)+1; ...
            length(parameters)+2*length(benchmark)+3 length(parameters)+4*length(benchmark)+1; ...
            ];
        inv_th = 1000;
        
    case 'sac_srad'
        % sac srad
        data = csvread('../../experiments/data_for_tl/sac_srad_others.csv',1,0);
        dimensions_no = {'ls','dcr','cf','lir','inl','lur','wlur','prfunr','cse','dfr','wlf','ivecyc','ive','ivesli','dl','rco','uip','dr','ipc','wlpg','cp','vp','srf','msca','phm','wls','as','wlsimp','cwle','lro','rnb','rip','sde','wlprop','saa','cyc','scyc','saacyc','wlsd','cts','ucts'};
        dimensions_do = {'lus','wlt','awlf','wlflt','ae','dpa','lao','pra'};
        dimensions_options = {'extrema'};
        dimensions_numerics = {'initmheap','initwheap','maxae','maxlur','maxoptcyc','maxprfur','maxwlur','numthreads'};
        responses_srad_others = {'srad','particle_filter','kmeans','hotspot','nw'};
        responses_nbody_others = {'nbody100','nbody150','nbody750'};
        responses_gc_cg = {'gc','cg'};
        parameters = [dimensions_no dimensions_do dimensions_options];
        exp_pairs = [59 60; 59 61; 59 62; 59 63; 60 61; 60 62; 60 63; 61 62; 61 63; 62 63];
        inv_th = 1200;
        
    case 'sac_cg_gc'
        % sac gc_cg
        data = csvread('../../experiments/data_for_tl/sac_gc_cg.csv',1,0);
        dimensions_no = {'ls','dcr','cf','lir','inl','lur','wlur','prfunr','cse','dfr','wlf','ivecyc','ive','ivesli','dl','rco','uip','dr','ipc','wlpg','cp','vp','srf','msca','phm','wls','as','wlsimp','cwle','lro','rnb','rip','sde','wlprop','saa','cyc','scyc','saacyc','wlsd','cts','ucts'};
        dimensions_do = {'lus','wlt','awlf','wlflt','ae','dpa','lao','pra'};
        dimensions_options = {'extrema'};
        dimensions_numerics = {'initmheap','initwheap','maxae','maxlur','maxoptcyc','maxprfur','maxwlur','numthreads'};
        responses_srad_others = {'srad','particle_filter','kmeans','hotspot','nw'};
        responses_nbody_others = {'nbody100','nbody150','nbody750'};
        responses_gc_cg = {'gc','cg'};
        parameters = [dimensions_no dimensions_do dimensions_options];
        exp_pairs = [58 59];
        inv_th = 1200;
        
    case 'sac_nbody'
        % sac nbody
        data = csvread('../../experiments/data_for_tl/sac_nbody_others.csv',1,0);
        dimensions_no = {'ls','dcr','cf','lir','inl','lur','wlur','prfunr','cse','dfr','wlf','ivecyc','ive','ivesli','dl','rco','uip','dr','ipc','wlpg','cp','vp','srf','msca','phm','wls','as','wlsimp','cwle','lro','rnb','rip','sde','wlprop','saa','cyc','scyc','saacyc','wlsd','cts','ucts'};
        dimensions_do = {'lus','wlt','awlf','wlflt','ae','dpa','lao','pra'};
        dimensions_options = {'extrema'};
        dimensions_numerics = {'initmheap','initwheap','maxae','maxlur','maxoptcyc','maxprfur','maxwlur','numthreads'};
        responses_srad_others = {'srad','particle_filter','kmeans','hotspot','nw'};
        responses_nbody_others = {'nbody100','nbody150','nbody750'};
        responses_gc_cg = {'gc','cg'};
        parameters = [dimensions_no dimensions_do dimensions_options];
        exp_pairs = [58 59; 58 60; 60 58];
        inv_th = 1200;
        
end

dim = length(parameters);

idx_s = [100];
idx_t = [100];

iter = 30;

for ss = 1:length(idx_s)
    training_per_s = 0.01*idx_s(ss);
    for tt = 1:length(idx_t)
        training_per_t = 0.001*idx_t(tt);
        for idx = 1:size(exp_pairs,1)
            for it = 1:iter
                %% init
                idx_source = exp_pairs(idx,1);
                idx_target = exp_pairs(idx,2);
                
                xTest = data(:,1:dim);
                yTest_source = data(:,idx_source)+1;
                yTest_target = data(:,idx_target)+1;
                
                xTest_all = xTest; % keeping all valid and invalid configuration for some baseline sampling
                yTest_target_all = yTest_target;
                n_all = size(xTest,1);
                
                idx_invalid_source = (yTest_source>=inv_th+1);
                idx_invalid_target = (yTest_target>=inv_th+1);
                idx_valid = ~idx_invalid_source & ~idx_invalid_target;
                
                xTest = xTest(idx_valid,:);
                yTest_source = yTest_source(idx_valid,:);
                yTest_target = yTest_target(idx_valid,:);
                
                actual = yTest_target;
                n = size(xTest,1);
                v = randperm(n);
                
                total_tr_size_s = round(n*training_per_s);
                total_tr_size_t = 70;
                
                idx_train_s = v(1:total_tr_size_s);
                %idx_train_t = v(1:init_tr_size);
                
                xTrain_s = xTest(idx_train_s,:);
                %xTrain_t = xTest(idx_train_t,:);
                
                yTrain_s = yTest_source(idx_train_s,:);
                %yTrain_t = yTest_target(idx_train_t,:);
                
                %%
                number_of_samples_in_both = 20; % see c_both waterloo paper
%                 p = sobolset(dim);
%                 samples_both_source_target = round(net(p,number_of_samples_in_both*100)); %since half of them are invalid
%                 idx_both = [];
%                 i = 1;
%                 j = 1;
%                 while i <= number_of_samples_in_both
%                     idx_temp = find(ismember(xTest, samples_both_source_target(j,:),'rows'));
%                     j = j + 1;
%                     if ~isempty(idx_temp)
%                         i = i + 1;
%                         idx_both = [idx_both idx_temp];
%                     end
%                 end
                idx_both = v(1:number_of_samples_in_both);
                
                num_samples = 5*dim; % according to the Waterloo paper
%                 design_source_wt = round(lhsdesign(num_samples,dim));
%                 idx_train_wt = [];
%                 for i = 1:size(design_source_wt)
%                     idx_temp = find(ismember(xTest, design_source_wt(i,:),'rows'));
%                     if ~isempty(idx_temp)
%                         idx_train_wt = [idx_train_wt idx_temp];
%                     end
%                 end
                idx_train_wt = v(1:num_samples);
                
                xTrain_s = xTest(idx_train_wt,:);
                yTrain_s = yTest_source(idx_train_wt,:);
                
                mdl_source = fitrtree(xTrain_s,yTrain_s,'PredictorNames',parameters);
                predicted = predict(mdl_source,xTest);
                
                for idx_tr = 2:number_of_samples_in_both
                    
                    X = [ones(length(yTest_source(idx_both(1:idx_tr))),1) yTest_source(idx_both(1:idx_tr))];
                    b = X\yTest_target(idx_both(1:idx_tr));
                    predicted_shifted = b(1)+ predicted*b(2);
                    
                    scoreNMSE_wt(idx_tr) = nmse(actual, predicted_shifted);
                    scoreMSE_wt(idx_tr) = mse(actual, predicted_shifted);
                    scoreAE = ae(actual, predicted_shifted);
                    scoreAP = abs(scoreAE./(actual)*100); % absolute percentage error
                    scoreMAP_wt(idx_tr) = mean(scoreAP);
                end
                err_wt_map{:,:,it,idx,tt,ss} = [scoreMAP_wt'];
                err_wt_nmse{:,:,it,idx,tt,ss} = [scoreNMSE_wt'];
                err_wt_mse{:,:,it,idx,tt,ss} = [scoreMSE_wt'];
                
                result.idx_train_wt{:,it,idx} = idx_train_wt; % saving results
                result.idx_both{:,it,idx} = idx_both; % saving results
            end
        end
    end
end

save(['results/ase/tl/waterloo_' exp '.mat'],'err*','result')


% analysis
for idx = 1:8
for i = 1:iter
err_all = err_wt_map{:,:,i,idx};
err(i) = mean(err_all(10:20));
end
e_mean(idx,1) = mean(err);
e_std(idx,1) = std(err);
end