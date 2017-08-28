

% load data
nbody_a= readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_nbody100_100a_32.csv','Delimiter',',');
nbody_b = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_nbody100_100b_32.csv','Delimiter',',');
nbody_c = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_nbody100_100c_32.csv','Delimiter',',');


srad_pf = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_srad_pf_77.csv');
srad_km = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_srad_km_77.csv');
srad_hot = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_srad_hot_77.csv');
srad_nw = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_srad_nw_77.csv');
pf_km = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_pf_km_77.csv');
pf_hot = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_pf_hot_77.csv');
pf_nw = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_pf_nw_77.csv');
km_hot = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_km_hot_77.csv');
km_nw= readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_km_nw_77.csv');
hot_nw= readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_hot_nw_77.csv');

nbody100_150 = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_nbody100_150_32.csv','Delimiter',',');
nbody100_750 = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_nbody100_750_32.csv','Delimiter',',');
nbody750_150 = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_nbody750_150.csv','Delimiter',',');
gc_cg = readtable('../../experiments/tl/SaC/all/SELECT_t4_CompilerOptions__t3_Configurat_gc_cg_compile_time.csv','Delimiter',',');


nbody100_invalid = readtable('../../experiments/tl/SaC/invalid/SELECT___FROM_MResults_where_NFPID_31___nbody100_run_invalid.csv');
nbody750_invalid = readtable('../../experiments/tl/SaC/invalid/SELECT___FROM_MResults_where_NFPID_31___nbody750_run_invalid.csv');
nbody150_invalid = readtable('../../experiments/tl/SaC/invalid/SELECT___FROM_MResults_where_NFPID_31___nbody150_run_invalid.csv');


% extracting configurations

config_id_srad_others = mintersect(srad_pf{:,2},srad_km{:,2},srad_hot{:,2},srad_nw{:,2},pf_km{:,2},pf_hot{:,2},pf_nw{:,2},km_hot{:,2},km_nw{:,2},hot_nw{:,2});
config_id_nbody_others = mintersect(nbody100_150{:,2},nbody100_750{:,2},nbody750_150{:,2});
config_id_gc_cg = gc_cg{:,2};

[~,~,idx_config_srad] = intersect(config_id_srad_others,srad_pf{:,2});
[~,~,idx_config_nbody] = intersect(config_id_nbody_others,nbody100_150{:,2});

%config_srad_others = db_to_csv_sac(srad_pf(idx_config_srad,:));
%config_nbody = db_to_csv_sac(nbody100_150(idx_config_nbody,:));
%config_gc_cg = db_to_csv_sac(gc_cg);

[~,~,idx_config_srad] = intersect(config_id_srad_others,srad_pf{:,2});
idx_srad_pf=logical(zeros(height(srad_pf),1));
idx_srad_pf(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,srad_km{:,2});
idx_srad_km=logical(zeros(height(srad_km),1));
idx_srad_km(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,srad_hot{:,2});
idx_srad_hot=logical(zeros(height(srad_hot),1));
idx_srad_hot(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,srad_nw{:,2});
idx_srad_nw=logical(zeros(height(srad_nw),1));
idx_srad_nw(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,pf_km{:,2});
idx_pf_km=logical(zeros(height(pf_km),1));
idx_pf_km(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,pf_hot{:,2});
idx_pf_hot=logical(zeros(height(pf_hot),1));
idx_pf_hot(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,pf_nw{:,2});
idx_pf_nw=logical(zeros(height(pf_nw),1));
idx_pf_nw(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,km_hot{:,2});
idx_km_hot=logical(zeros(height(km_hot),1));
idx_km_hot(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,km_nw{:,2});
idx_km_nw=logical(zeros(height(km_nw),1));
idx_km_nw(idx_config_srad)=1;

[~,~,idx_config_srad] = intersect(config_id_srad_others,hot_nw{:,2});
idx_hot_nw=logical(zeros(height(hot_nw),1));
idx_hot_nw(idx_config_srad)=1;

[~,~,idx_config_nbody] = intersect(config_id_nbody_others,nbody100_150{:,2});
idx_nbody100_150=logical(zeros(height(nbody100_150),1));
idx_nbody100_150(idx_config_nbody)=1;

[~,~,idx_config_nbody] = intersect(config_id_nbody_others,nbody100_750{:,2});
idx_nbody100_750=logical(zeros(height(nbody100_750),1));
idx_nbody100_750(idx_config_nbody)=1;

[~,~,idx_config_nbody] = intersect(config_id_nbody_others,nbody750_150{:,2});
idx_nbody750_150=logical(zeros(height(nbody750_150),1));
idx_nbody750_150(idx_config_nbody)=1;


% determining invalid configurations

srad_pf.Properties.VariableNames={'configuration','ID','srad','pf'};
idx_invalid_srad = (srad_pf.srad>=1200);
idx_invalid_pf = (srad_pf.pf>=1200);
idx_valid_srad_pf = ~idx_invalid_srad & ~idx_invalid_pf & idx_srad_pf;

srad_km.Properties.VariableNames={'configuration','ID','srad','km'};
idx_invalid_srad = (srad_km.srad>=1200);
idx_invalid_km = (srad_km.km>=1200);
idx_valid_srad_km = ~idx_invalid_srad & ~idx_invalid_km & idx_srad_km;

srad_hot.Properties.VariableNames={'configuration','ID','srad','hot'};
idx_invalid_srad = (srad_hot.srad>=1200);
idx_invalid_hot = (srad_hot.hot>=1200);
idx_valid_srad_hot = ~idx_invalid_srad & ~idx_invalid_hot & idx_srad_hot;

srad_nw.Properties.VariableNames={'configuration','ID','srad','nw'};
idx_invalid_srad = (srad_nw.srad>=1200);
idx_invalid_nw = (srad_nw.nw>=1200);
idx_valid_srad_nw = ~idx_invalid_srad & ~idx_invalid_nw & idx_srad_nw;

pf_km.Properties.VariableNames={'configuration','ID','pf','km'};
idx_invalid_pf = (pf_km.pf>=1200);
idx_invalid_km = (pf_km.km>=1200);
idx_valid_pf_km = ~idx_invalid_pf & ~idx_invalid_km & idx_pf_km;

pf_hot.Properties.VariableNames={'configuration','ID','pf','hot'};
idx_invalid_pf = (pf_hot.pf>=1200);
idx_invalid_hot = (pf_hot.hot>=1200);
idx_valid_pf_hot = ~idx_invalid_pf & ~idx_invalid_hot & idx_pf_hot;

pf_nw.Properties.VariableNames={'configuration','ID','pf','nw'};
idx_invalid_pf = (pf_nw.pf>=1200);
idx_invalid_nw = (pf_nw.nw>=1200);
idx_valid_pf_nw = ~idx_invalid_pf & ~idx_invalid_nw & idx_pf_nw;

km_hot.Properties.VariableNames={'configuration','ID','km','hot'};
idx_invalid_km = (km_hot.km>=1200);
idx_invalid_hot = (km_hot.hot>=1200);
idx_valid_km_hot = ~idx_invalid_km & ~idx_invalid_hot & idx_km_hot;

km_nw.Properties.VariableNames={'configuration','ID','km','nw'};
idx_invalid_km = (km_nw.km>=1200);
idx_invalid_nw = (km_nw.nw>=1200);
idx_valid_km_nw = ~idx_invalid_km & ~idx_invalid_nw & idx_km_nw;

hot_nw.Properties.VariableNames={'configuration','ID','hot','nw'};
idx_invalid_hot = (hot_nw.hot>=1200);
idx_invalid_nw = (hot_nw.nw>=1200);
idx_valid_hot_nw = ~idx_invalid_hot & ~idx_invalid_nw & idx_hot_nw;

nbody100_150.Properties.VariableNames={'configuration','ID','nbody100','nbody150'};
idx_invalid_nbody100 = (nbody100_150.nbody100>=1200);
idx_invalid_nbody150 = (nbody100_150.nbody150>=1200);
idx_valid_nbody100_150 = ~idx_invalid_nbody100 & ~idx_invalid_nbody150 & idx_nbody100_150;

nbody100_750.Properties.VariableNames={'configuration','ID','nbody100','nbody750'};
idx_invalid_nbody100 = (nbody100_750.nbody100>=1200);
idx_invalid_nbody750 = (nbody100_750.nbody750>=1200);
idx_valid_nbody100_750 = ~idx_invalid_nbody100 & ~idx_invalid_nbody750 & idx_nbody100_750;

nbody750_150.Properties.VariableNames={'configuration','ID','nbody750','nbody150'};
idx_invalid_nbody750 = (nbody750_150.nbody750>=1200);
idx_invalid_nbody150 = (nbody750_150.nbody150>=1200);
idx_valid_nbody750_150 = ~idx_invalid_nbody750 & ~idx_invalid_nbody150 & idx_nbody750_150;

gc_cg.Properties.VariableNames={'configuration','ID','gc','cg'};
idx_invalid_gc = (gc_cg.gc>=1200);
idx_invalid_cg = (gc_cg.cg>=1200);
idx_valid_gc_cg = ~idx_invalid_gc & ~idx_invalid_cg;


% H1.2: calculating linear and rank correlations
corr_pear_srad_pf = corr(srad_pf{idx_valid_srad_pf,3},srad_pf{idx_valid_srad_pf,4},'type','Pearson')
corr_pear_srad_km = corr(srad_km{idx_valid_srad_km,3},srad_km{idx_valid_srad_km,4},'type','Pearson')
corr_pear_srad_hot = corr(srad_hot{idx_valid_srad_hot,3},srad_hot{idx_valid_srad_hot,4},'type','Pearson')
corr_pear_srad_nw = corr(srad_nw{idx_valid_srad_nw,3},srad_nw{idx_valid_srad_nw,4},'type','Pearson')
corr_pear_pf_km = corr(pf_km{idx_valid_pf_km,3},pf_km{idx_valid_pf_km,4},'type','Pearson')
corr_pear_pf_hot = corr(pf_hot{idx_valid_pf_hot,3},pf_hot{idx_valid_pf_hot,4},'type','Pearson')
corr_pear_pf_nw = corr(pf_nw{idx_valid_pf_nw,3},pf_nw{idx_valid_pf_nw,4},'type','Pearson')
corr_pear_km_hot = corr(km_hot{idx_valid_km_hot,3},km_hot{idx_valid_km_hot,4},'type','Pearson')
corr_pear_km_nw = corr(km_nw{idx_valid_km_nw,3},km_nw{idx_valid_km_nw,4},'type','Pearson')
corr_pear_hot_nw = corr(hot_nw{idx_valid_hot_nw,3},hot_nw{idx_valid_hot_nw,4},'type','Pearson')
corr_pear_nbody100_150 = corr(nbody100_150{idx_valid_nbody100_150,3},nbody100_150{idx_valid_nbody100_150,4},'type','Pearson')
corr_pear_nbody100_750 = corr(nbody100_750{idx_valid_nbody100_750,3},nbody100_750{idx_valid_nbody100_750,4},'type','Pearson')
corr_pear_nbody750_150 = corr(nbody750_150{idx_valid_nbody750_150,3},nbody750_150{idx_valid_nbody750_150,4},'type','Pearson')
corr_pear_gc_cg = corr(gc_cg{:,3},gc_cg{:,4},'type','Pearson')

corr_spear_srad_pf = corr(srad_pf{idx_valid_srad_pf,3},srad_pf{idx_valid_srad_pf,4},'type','Spear')
corr_spear_srad_km = corr(srad_km{idx_valid_srad_km,3},srad_km{idx_valid_srad_km,4},'type','Spear')
corr_spear_srad_hot = corr(srad_hot{idx_valid_srad_hot,3},srad_hot{idx_valid_srad_hot,4},'type','Spear')
corr_spear_srad_nw = corr(srad_nw{idx_valid_srad_nw,3},srad_nw{idx_valid_srad_nw,4},'type','Spear')
corr_spear_pf_km = corr(pf_km{idx_valid_pf_km,3},pf_km{idx_valid_pf_km,4},'type','Spear')
corr_spear_pf_hot = corr(pf_hot{idx_valid_pf_hot,3},pf_hot{idx_valid_pf_hot,4},'type','Spear')
corr_spear_pf_nw = corr(pf_nw{idx_valid_pf_nw,3},pf_nw{idx_valid_pf_nw,4},'type','Spear')
corr_spear_km_hot = corr(km_hot{idx_valid_km_hot,3},km_hot{idx_valid_km_hot,4},'type','Spear')
corr_spear_km_nw = corr(km_nw{idx_valid_km_nw,3},km_nw{idx_valid_km_nw,4},'type','Spear')
corr_spear_hot_nw = corr(hot_nw{idx_valid_hot_nw,3},hot_nw{idx_valid_hot_nw,4},'type','Spear')
corr_spear_nbody100_150 = corr(nbody100_150{idx_valid_nbody100_150,3},nbody100_150{idx_valid_nbody100_150,4},'type','Spear')
corr_spear_nbody100_750 = corr(nbody100_750{idx_valid_nbody100_750,3},nbody100_750{idx_valid_nbody100_750,4},'type','Spear')
corr_spear_nbody750_150 = corr(nbody750_150{idx_valid_nbody750_150,3},nbody750_150{idx_valid_nbody750_150,4},'type','Spear')
corr_spear_gc_cg = corr(gc_cg{:,3},gc_cg{:,4},'type','Spear')

% H1.2: performance distribution similarity
% adding epsilon in order to avoid zero values in the bins
N = 1000;

data_source = srad_pf{idx_valid_srad_pf,3};
data_target = srad_pf{idx_valid_srad_pf,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_srad_pf = KLDiv(pd_source,pd_target+eps)

data_source = srad_km{idx_valid_srad_km,3};
data_target = srad_km{idx_valid_srad_km,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_srad_km = KLDiv(pd_source,pd_target+eps)

data_source = srad_hot{idx_valid_srad_hot,3};
data_target = srad_hot{idx_valid_srad_hot,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_srad_hot = KLDiv(pd_source,pd_target+eps)

data_source = srad_nw{idx_valid_srad_nw,3};
data_target = srad_nw{idx_valid_srad_nw,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_srad_nw = KLDiv(pd_source,pd_target+eps)

data_source = pf_km{idx_valid_pf_km,3};
data_target = pf_km{idx_valid_pf_km,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_pf_km = KLDiv(pd_source,pd_target+eps)

data_source = pf_hot{idx_valid_pf_hot,3};
data_target = pf_hot{idx_valid_pf_hot,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_pf_hot = KLDiv(pd_source,pd_target+eps)

data_source = pf_nw{idx_valid_pf_nw,3};
data_target = pf_nw{idx_valid_pf_nw,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_pf_nw = KLDiv(pd_source,pd_target+eps)

data_source = km_hot{idx_valid_km_hot,3};
data_target = km_hot{idx_valid_km_hot,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_km_hot = KLDiv(pd_source,pd_target+eps)

data_source = km_nw{idx_valid_km_nw,3};
data_target = km_nw{idx_valid_km_nw,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_km_nw = KLDiv(pd_source,pd_target+eps)

data_source = hot_nw{idx_valid_hot_nw,3};
data_target = hot_nw{idx_valid_hot_nw,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_hot_nw = KLDiv(pd_source,pd_target+eps)

data_source = nbody100_150{idx_valid_nbody100_150,3};
data_target = nbody100_150{idx_valid_nbody100_150,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_nbody100_150 = KLDiv(pd_source,pd_target+eps)

data_source = nbody100_750{idx_valid_nbody100_750,3};
data_target = nbody100_750{idx_valid_nbody100_750,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_nbody100_750 = KLDiv(pd_source,pd_target+eps)

data_source = nbody750_150{idx_valid_nbody750_150,3};
data_target = nbody750_150{idx_valid_nbody750_150,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_nbody750_150 = KLDiv(pd_source,pd_target+eps)

data_source = gc_cg{idx_valid_gc_cg,3};
data_target = gc_cg{idx_valid_gc_cg,4};
[~,bins_source] = discretize(data_source,N);
[~,bins_target] = discretize(data_target,N);
pd = fitdist(data_source,'Kernel');
pd_source = pdf(pd,bins_source);
pd = fitdist(data_target,'Kernel');
pd_target = pdf(pd,bins_target);
kl_gc_cg = KLDiv(pd_source,pd_target+eps)


% H1.3: top configurations
percentile = 0.1;

[~,idx_sort_source_srad_pf] = sort(srad_pf{idx_valid_srad_pf,3});
[~,idx_sort_target_srad_pf] = sort(srad_pf{idx_valid_srad_pf,4});
top_source_srad_pf = idx_sort_source_srad_pf(1:length(idx_sort_source_srad_pf)*percentile);
top_target_srad_pf = idx_sort_target_srad_pf(1:length(idx_sort_target_srad_pf)*percentile);
top_per_intersect_srad_pf = length(intersect(top_source_srad_pf,top_target_srad_pf))/length(top_target_srad_pf)
bottom_source_srad_pf = idx_sort_source_srad_pf(end-length(idx_sort_source_srad_pf)*percentile:end);
bottom_target_srad_pf = idx_sort_target_srad_pf(end-length(idx_sort_target_srad_pf)*percentile:end);
bottom_per_intersect_srad_pf = length(intersect(bottom_source_srad_pf,bottom_target_srad_pf))/length(bottom_target_srad_pf)

[~,idx_sort_source_srad_km] = sort(srad_km{idx_valid_srad_km,3});
[~,idx_sort_target_srad_km] = sort(srad_km{idx_valid_srad_km,4});
top_source_srad_km = idx_sort_source_srad_km(1:length(idx_sort_source_srad_km)*percentile);
top_target_srad_km = idx_sort_target_srad_km(1:length(idx_sort_target_srad_km)*percentile);
top_per_intersect_srad_km = length(intersect(top_source_srad_km,top_target_srad_km))/length(top_target_srad_km)
bottom_source_srad_km = idx_sort_source_srad_km(end-length(idx_sort_source_srad_km)*percentile:end);
bottom_target_srad_km = idx_sort_target_srad_km(end-length(idx_sort_target_srad_km)*percentile:end);
bottom_per_intersect_srad_km = length(intersect(bottom_source_srad_km,bottom_target_srad_km))/length(bottom_target_srad_km)

[~,idx_sort_source_srad_hot] = sort(srad_hot{idx_valid_srad_hot,3});
[~,idx_sort_target_srad_hot] = sort(srad_hot{idx_valid_srad_hot,4});
top_source_srad_hot = idx_sort_source_srad_hot(1:length(idx_sort_source_srad_hot)*percentile);
top_target_srad_hot = idx_sort_target_srad_hot(1:length(idx_sort_target_srad_hot)*percentile);
top_per_intersect_srad_hot = length(intersect(top_source_srad_hot,top_target_srad_hot))/length(top_target_srad_hot)
bottom_source_srad_hot = idx_sort_source_srad_hot(end-length(idx_sort_source_srad_hot)*percentile:end);
bottom_target_srad_hot = idx_sort_target_srad_hot(end-length(idx_sort_target_srad_hot)*percentile:end);
bottom_per_intersect_srad_hot = length(intersect(bottom_source_srad_hot,bottom_target_srad_hot))/length(bottom_target_srad_hot)

[~,idx_sort_source_srad_nw] = sort(srad_nw{idx_valid_srad_nw,3});
[~,idx_sort_target_srad_nw] = sort(srad_nw{idx_valid_srad_nw,4});
top_source_srad_nw = idx_sort_source_srad_nw(1:length(idx_sort_source_srad_nw)*percentile);
top_target_srad_nw = idx_sort_target_srad_nw(1:length(idx_sort_target_srad_nw)*percentile);
top_per_intersect_srad_nw = length(intersect(top_source_srad_nw,top_target_srad_nw))/length(top_target_srad_nw)
bottom_source_srad_nw = idx_sort_source_srad_nw(end-length(idx_sort_source_srad_nw)*percentile:end);
bottom_target_srad_nw = idx_sort_target_srad_nw(end-length(idx_sort_target_srad_nw)*percentile:end);
bottom_per_intersect_srad_nw = length(intersect(bottom_source_srad_nw,bottom_target_srad_nw))/length(bottom_target_srad_nw)

[~,idx_sort_source_pf_km] = sort(pf_km{idx_valid_pf_km,3});
[~,idx_sort_target_pf_km] = sort(pf_km{idx_valid_pf_km,4});
top_source_pf_km = idx_sort_source_pf_km(1:length(idx_sort_source_pf_km)*percentile);
top_target_pf_km = idx_sort_target_pf_km(1:length(idx_sort_target_pf_km)*percentile);
top_per_intersect_pf_km = length(intersect(top_source_pf_km,top_target_pf_km))/length(top_target_pf_km)
bottom_source_pf_km = idx_sort_source_pf_km(end-length(idx_sort_source_pf_km)*percentile:end);
bottom_target_pf_km = idx_sort_target_pf_km(end-length(idx_sort_target_pf_km)*percentile:end);
bottom_per_intersect_pf_km = length(intersect(bottom_source_pf_km,bottom_target_pf_km))/length(bottom_target_pf_km)

[~,idx_sort_source_pf_hot] = sort(pf_hot{idx_valid_pf_hot,3});
[~,idx_sort_target_pf_hot] = sort(pf_hot{idx_valid_pf_hot,4});
top_source_pf_hot = idx_sort_source_pf_hot(1:length(idx_sort_source_pf_hot)*percentile);
top_target_pf_hot = idx_sort_target_pf_hot(1:length(idx_sort_target_pf_hot)*percentile);
top_per_intersect_pf_hot = length(intersect(top_source_pf_hot,top_target_pf_hot))/length(top_target_pf_hot)
bottom_source_pf_hot = idx_sort_source_pf_hot(end-length(idx_sort_source_pf_hot)*percentile:end);
bottom_target_pf_hot = idx_sort_target_pf_hot(end-length(idx_sort_target_pf_hot)*percentile:end);
bottom_per_intersect_pf_hot = length(intersect(bottom_source_pf_hot,bottom_target_pf_hot))/length(bottom_target_pf_hot)

[~,idx_sort_source_pf_nw] = sort(pf_nw{idx_valid_pf_nw,3});
[~,idx_sort_target_pf_nw] = sort(pf_nw{idx_valid_pf_nw,4});
top_source_pf_nw = idx_sort_source_pf_nw(1:length(idx_sort_source_pf_nw)*percentile);
top_target_pf_nw = idx_sort_target_pf_nw(1:length(idx_sort_target_pf_nw)*percentile);
top_per_intersect_pf_nw = length(intersect(top_source_pf_nw,top_target_pf_nw))/length(top_target_pf_nw)
bottom_source_pf_nw = idx_sort_source_pf_nw(end-length(idx_sort_source_pf_nw)*percentile:end);
bottom_target_pf_nw = idx_sort_target_pf_nw(end-length(idx_sort_target_pf_nw)*percentile:end);
bottom_per_intersect_pf_nw = length(intersect(bottom_source_pf_nw,bottom_target_pf_nw))/length(bottom_target_pf_nw)

[~,idx_sort_source_km_hot] = sort(km_hot{idx_valid_km_hot,3});
[~,idx_sort_target_km_hot] = sort(km_hot{idx_valid_km_hot,4});
top_source_km_hot = idx_sort_source_km_hot(1:length(idx_sort_source_km_hot)*percentile);
top_target_km_hot = idx_sort_target_km_hot(1:length(idx_sort_target_km_hot)*percentile);
top_per_intersect_km_hot = length(intersect(top_source_km_hot,top_target_km_hot))/length(top_target_km_hot)
bottom_source_km_hot = idx_sort_source_km_hot(end-length(idx_sort_source_km_hot)*percentile:end);
bottom_target_km_hot = idx_sort_target_km_hot(end-length(idx_sort_target_km_hot)*percentile:end);
bottom_per_intersect_km_hot = length(intersect(bottom_source_km_hot,bottom_target_km_hot))/length(bottom_target_km_hot)

[~,idx_sort_source_km_nw] = sort(km_nw{idx_valid_km_nw,3});
[~,idx_sort_target_km_nw] = sort(km_nw{idx_valid_km_nw,4});
top_source_km_nw = idx_sort_source_km_nw(1:length(idx_sort_source_km_nw)*percentile);
top_target_km_nw = idx_sort_target_km_nw(1:length(idx_sort_target_km_nw)*percentile);
top_per_intersect_km_nw = length(intersect(top_source_km_nw,top_target_km_nw))/length(top_target_km_nw)
bottom_source_km_nw = idx_sort_source_km_nw(end-length(idx_sort_source_km_nw)*percentile:end);
bottom_target_km_nw = idx_sort_target_km_nw(end-length(idx_sort_target_km_nw)*percentile:end);
bottom_per_intersect_km_nw = length(intersect(bottom_source_km_nw,bottom_target_km_nw))/length(bottom_target_km_nw)

[~,idx_sort_source_hot_nw] = sort(hot_nw{idx_valid_hot_nw,3});
[~,idx_sort_target_hot_nw] = sort(hot_nw{idx_valid_hot_nw,4});
top_source_hot_nw = idx_sort_source_hot_nw(1:length(idx_sort_source_hot_nw)*percentile);
top_target_hot_nw = idx_sort_target_hot_nw(1:length(idx_sort_target_hot_nw)*percentile);
top_per_intersect_hot_nw = length(intersect(top_source_hot_nw,top_target_hot_nw))/length(top_target_hot_nw)
bottom_source_hot_nw = idx_sort_source_hot_nw(end-length(idx_sort_source_hot_nw)*percentile:end);
bottom_target_hot_nw = idx_sort_target_hot_nw(end-length(idx_sort_target_hot_nw)*percentile:end);
bottom_per_intersect_hot_nw = length(intersect(bottom_source_hot_nw,bottom_target_hot_nw))/length(bottom_target_hot_nw)

[~,idx_sort_source_nbody100_150] = sort(nbody100_150{idx_valid_nbody100_150,3});
[~,idx_sort_target_nbody100_150] = sort(nbody100_150{idx_valid_nbody100_150,4});
top_source_nbody100_150 = idx_sort_source_nbody100_150(1:length(idx_sort_source_nbody100_150)*percentile);
top_target_nbody100_150 = idx_sort_target_nbody100_150(1:length(idx_sort_target_nbody100_150)*percentile);
top_per_intersect_nbody100_150 = length(intersect(top_source_nbody100_150,top_target_nbody100_150))/length(top_target_nbody100_150)
bottom_source_nbody100_150 = idx_sort_source_nbody100_150(end-length(idx_sort_source_nbody100_150)*percentile:end);
bottom_target_nbody100_150 = idx_sort_target_nbody100_150(end-length(idx_sort_target_nbody100_150)*percentile:end);
bottom_per_intersect_nbody100_150 = length(intersect(bottom_source_nbody100_150,bottom_target_nbody100_150))/length(bottom_target_nbody100_150)

[~,idx_sort_source_nbody100_750] = sort(nbody100_750{idx_valid_nbody100_750,3});
[~,idx_sort_target_nbody100_750] = sort(nbody100_750{idx_valid_nbody100_750,4});
top_source_nbody100_750 = idx_sort_source_nbody100_750(1:length(idx_sort_source_nbody100_750)*percentile);
top_target_nbody100_750 = idx_sort_target_nbody100_750(1:length(idx_sort_target_nbody100_750)*percentile);
top_per_intersect_nbody100_750 = length(intersect(top_source_nbody100_750,top_target_nbody100_750))/length(top_target_nbody100_750)
bottom_source_nbody100_750 = idx_sort_source_nbody100_750(end-length(idx_sort_source_nbody100_750)*percentile:end);
bottom_target_nbody100_750 = idx_sort_target_nbody100_750(end-length(idx_sort_target_nbody100_750)*percentile:end);
bottom_per_intersect_nbody100_750 = length(intersect(bottom_source_nbody100_750,bottom_target_nbody100_750))/length(bottom_target_nbody100_750)

[~,idx_sort_source_nbody750_150] = sort(nbody750_150{idx_valid_nbody750_150,3});
[~,idx_sort_target_nbody750_150] = sort(nbody750_150{idx_valid_nbody750_150,4});
top_source_nbody750_150 = idx_sort_source_nbody750_150(1:length(idx_sort_source_nbody750_150)*percentile);
top_target_nbody750_150 = idx_sort_target_nbody750_150(1:length(idx_sort_target_nbody750_150)*percentile);
top_per_intersect_nbody750_150 = length(intersect(top_source_nbody750_150,top_target_nbody750_150))/length(top_target_nbody750_150)
bottom_source_nbody750_150 = idx_sort_source_nbody750_150(end-length(idx_sort_source_nbody750_150)*percentile:end);
bottom_target_nbody750_150 = idx_sort_target_nbody750_150(end-length(idx_sort_target_nbody750_150)*percentile:end);
bottom_per_intersect_nbody750_150 = length(intersect(bottom_source_nbody750_150,bottom_target_nbody750_150))/length(bottom_target_nbody750_150)

[~,idx_sort_source_gc_cg] = sort(gc_cg{idx_valid_gc_cg,3});
[~,idx_sort_target_gc_cg] = sort(gc_cg{idx_valid_gc_cg,4});
top_source_gc_cg = idx_sort_source_gc_cg(1:length(idx_sort_source_gc_cg)*percentile);
top_target_gc_cg = idx_sort_target_gc_cg(1:length(idx_sort_target_gc_cg)*percentile);
top_per_intersect_gc_cg = length(intersect(top_source_gc_cg,top_target_gc_cg))/length(top_target_gc_cg)
bottom_source_gc_cg = idx_sort_source_gc_cg(end-length(idx_sort_source_gc_cg)*percentile:end);
bottom_target_gc_cg = idx_sort_target_gc_cg(end-length(idx_sort_target_gc_cg)*percentile:end);
bottom_per_intersect_gc_cg = length(intersect(bottom_source_gc_cg,bottom_target_gc_cg))/length(bottom_target_gc_cg)

% H2.1: t-test
ttest_srad_pf = ttest_proc(config_srad_others(idx_srad_pf(idx_srad_pf),1:50), srad_pf{idx_srad_pf,3},srad_pf{idx_srad_pf,4})
ttest_srad_km = ttest_proc(config_srad_others(idx_srad_km(idx_srad_km),1:50), srad_km{idx_srad_km,3},srad_km{idx_srad_km,4})
ttest_srad_hot = ttest_proc(config_srad_others(idx_srad_hot(idx_srad_hot),1:50), srad_hot{idx_srad_hot,3},srad_hot{idx_srad_hot,4})
ttest_srad_nw = ttest_proc(config_srad_others(idx_srad_nw(idx_srad_nw),1:50), srad_nw{idx_srad_nw,3},srad_nw{idx_srad_nw,4})
ttest_pf_km = ttest_proc(config_srad_others(idx_pf_km(idx_pf_km),1:50), pf_km{idx_pf_km,3},pf_km{idx_pf_km,4})
ttest_pf_hot = ttest_proc(config_srad_others(idx_pf_hot(idx_pf_hot),1:50), pf_hot{idx_pf_hot,3},pf_hot{idx_pf_hot,4})
ttest_pf_nw = ttest_proc(config_srad_others(idx_pf_nw(idx_pf_nw),1:50), pf_nw{idx_pf_nw,3},pf_nw{idx_pf_nw,4})
ttest_km_hot = ttest_proc(config_srad_others(idx_km_hot(idx_km_hot),1:50), km_hot{idx_km_hot,3},km_hot{idx_km_hot,4})
ttest_hot_nw = ttest_proc(config_srad_others(idx_hot_nw(idx_hot_nw),1:50), hot_nw{idx_hot_nw,3},hot_nw{idx_hot_nw,4})
ttest_nbody100_150 = ttest_proc(config_nbody(idx_nbody100_150(idx_nbody100_150),1:50), nbody100_150{idx_nbody100_150,3},nbody100_150{idx_nbody100_150,4})
ttest_nbody100_750 = ttest_proc(config_nbody(idx_nbody100_750(idx_nbody100_750),1:50), nbody100_750{idx_nbody100_750,3},nbody100_750{idx_nbody100_750,4})
ttest_nbody750_150 = ttest_proc(config_nbody(idx_nbody750_150(idx_nbody750_150),1:50), nbody750_150{idx_nbody750_150,3},nbody750_150{idx_nbody750_150,4})
ttest_gc_cg = ttest_proc(config_gc_cg(:,1:50), gc_cg{:,3},gc_cg{:,4})


% H3.1-2: feature interactions

[results_model_srad_pf,results_stepwise_srad_pf] = learn_model(config_srad_others(idx_srad_pf(idx_srad_pf),1:50),srad_pf{idx_srad_pf,3},srad_pf{idx_srad_pf,4})
[results_model_srad_km,results_stepwise_srad_km] = learn_model(config_srad_others(idx_srad_km(idx_srad_km),1:50), srad_km{idx_srad_km,3},srad_km{idx_srad_km,4})
[results_model_srad_hot,results_stepwise_srad_hot] = learn_model(config_srad_others(idx_srad_hot(idx_srad_hot),1:50), srad_hot{idx_srad_hot,3},srad_hot{idx_srad_hot,4})
[results_model_srad_nw,results_stepwise_srad_nw] = learn_model(config_srad_others(idx_srad_nw(idx_srad_nw),1:50), srad_nw{idx_srad_nw,3},srad_nw{idx_srad_nw,4})
[results_model_pf_km,results_stepwise_pf_km] = learn_model(config_srad_others(idx_pf_km(idx_pf_km),1:50), pf_km{idx_pf_km,3},pf_km{idx_pf_km,4})
[results_model_pf_hot,results_stepwise_pf_hot] = learn_model(config_srad_others(idx_pf_hot(idx_pf_hot),1:50), pf_hot{idx_pf_hot,3},pf_hot{idx_pf_hot,4})
[results_model_pf_nw,results_stepwise_pf_nw] = learn_model(config_srad_others(idx_pf_nw(idx_pf_nw),1:50), pf_nw{idx_pf_nw,3},pf_nw{idx_pf_nw,4})
[results_model_km_hot,results_stepwise_km_hot] = learn_model(config_srad_others(idx_km_hot(idx_km_hot),1:50), km_hot{idx_km_hot,3},km_hot{idx_km_hot,4})
[results_model_km_nw,results_stepwise_km_nw] = learn_model(config_srad_others(idx_km_nw(idx_km_nw),1:50), km_nw{idx_km_nw,3},km_nw{idx_km_nw,4})
[results_model_hot_nw,results_stepwise_hot_nw] = learn_model(config_srad_others(idx_hot_nw(idx_hot_nw),1:50), hot_nw{idx_hot_nw,3},hot_nw{idx_hot_nw,4})
[results_model_nbody100_150,results_stepwise_nbody100_150] = learn_model(config_nbody(idx_nbody100_150(idx_nbody100_150),1:50), nbody100_150{idx_nbody100_150,3},nbody100_150{idx_nbody100_150,4})
[results_model_nbody100_750,results_stepwise_nbody100_750] = learn_model(config_nbody(idx_nbody100_750(idx_nbody100_750),1:50), nbody100_750{idx_nbody100_750,3},nbody100_750{idx_nbody100_750,4})
[results_model_nbody750_150,results_stepwise_nbody750_150] = learn_model(config_nbody(idx_nbody750_150(idx_nbody750_150),1:50), nbody750_150{idx_nbody750_150,3},nbody750_150{idx_nbody750_150,4})
[results_model_gc_cg,results_stepwise_gc_cg] = learn_model(config_gc_cg(:,1:50), gc_cg{:,3},gc_cg{:,4})

% H2.2: tree
tree_s = fitrtree(config_srad_others(idx_srad_pf(idx_srad_pf),1:50),srad_pf{idx_srad_pf,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_srad_pf(idx_srad_pf),1:50),srad_pf{idx_srad_pf,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_srad_pf = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_srad_km(idx_srad_km),1:50),srad_km{idx_srad_km,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_srad_km(idx_srad_km),1:50),srad_km{idx_srad_km,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_srad_km = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_srad_hot(idx_srad_hot),1:50),srad_hot{idx_srad_hot,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_srad_hot(idx_srad_hot),1:50),srad_hot{idx_srad_hot,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_srad_hot = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_srad_nw(idx_srad_nw),1:50),srad_nw{idx_srad_nw,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_srad_nw(idx_srad_nw),1:50),srad_nw{idx_srad_nw,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_srad_nw = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_pf_km(idx_pf_km),1:50),pf_km{idx_pf_km,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_pf_km(idx_pf_km),1:50),pf_km{idx_pf_km,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_pf_km = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_pf_hot(idx_pf_hot),1:50),pf_hot{idx_pf_hot,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_pf_hot(idx_pf_hot),1:50),pf_hot{idx_pf_hot,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_pf_hot = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_pf_nw(idx_pf_nw),1:50),pf_nw{idx_pf_nw,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_pf_nw(idx_pf_nw),1:50),pf_nw{idx_pf_nw,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_pf_nw = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_km_hot(idx_km_hot),1:50),km_hot{idx_km_hot,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_km_hot(idx_km_hot),1:50),km_hot{idx_km_hot,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_km_hot = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_km_nw(idx_km_nw),1:50),km_nw{idx_km_nw,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_km_nw(idx_km_nw),1:50),km_nw{idx_km_nw,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_km_nw = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_srad_others(idx_hot_nw(idx_hot_nw),1:50),hot_nw{idx_hot_nw,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_srad_others(idx_hot_nw(idx_hot_nw),1:50),hot_nw{idx_hot_nw,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_hot_nw = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_nbody(idx_nbody100_150(idx_nbody100_150),1:50),nbody100_150{idx_nbody100_150,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_nbody(idx_nbody100_150(idx_nbody100_150),1:50),nbody100_150{idx_nbody100_150,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_nbody100_150 = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_nbody(idx_nbody100_750(idx_nbody100_750),1:50),nbody100_750{idx_nbody100_750,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_nbody(idx_nbody100_750(idx_nbody100_750),1:50),nbody100_750{idx_nbody100_750,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_nbody100_750 = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_nbody(idx_nbody750_150(idx_nbody750_150),1:50),nbody750_150{idx_nbody750_150,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_nbody(idx_nbody750_150(idx_nbody750_150),1:50),nbody750_150{idx_nbody750_150,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_nbody750_150 = corr(imp_tree_s',imp_tree_t','type','Spearman')

tree_s = fitrtree(config_gc_cg(:,1:50), gc_cg{:,3},'CategoricalPredictors','all');
tree_t = fitrtree(config_gc_cg(:,1:50), gc_cg{:,4},'CategoricalPredictors','all');
imp_tree_s = predictorImportance(tree_s);
imp_tree_t = predictorImportance(tree_t);
corr_tree_gc_cg = corr(imp_tree_s',imp_tree_t','type','Spearman')


% H4.1: invalid configurations
idx_invalid_srad = (srad_pf.srad>=1200);
idx_invalid_pf = (srad_pf.pf>=1200);
ratio_invalid_source_srad_pf = length(find(idx_invalid_srad))/height(srad_pf(idx_srad_pf,:))
ratio_invalid_target_srad_pf = length(find(idx_invalid_pf))/height(srad_pf(idx_srad_pf,:))
ratio_invalid_srad_pf = length(find(idx_invalid_srad & idx_invalid_pf))/length(find((idx_invalid_srad | idx_invalid_pf) & idx_srad_pf))

idx_invalid_srad = (srad_km.srad>=1200);
idx_invalid_km = (srad_km.km>=1200);
ratio_invalid_source_srad_km = length(find(idx_invalid_srad))/height(srad_km(idx_srad_km,:))
ratio_invalid_target_srad_km = length(find(idx_invalid_km))/height(srad_km(idx_srad_km,:))
ratio_invalid_srad_km = length(find(idx_invalid_srad & idx_invalid_km))/length(find((idx_invalid_srad | idx_invalid_km) & idx_srad_km))

idx_invalid_srad = (srad_hot.srad>=1200);
idx_invalid_hot = (srad_hot.hot>=1200);
ratio_invalid_source_srad_hot = length(find(idx_invalid_srad))/height(srad_hot(idx_srad_hot,:))
ratio_invalid_target_srad_hot = length(find(idx_invalid_hot))/height(srad_hot(idx_srad_hot,:))
ratio_invalid_srad_hot = length(find(idx_invalid_srad & idx_invalid_hot))/length(find((idx_invalid_srad | idx_invalid_hot) & idx_srad_hot))

idx_invalid_srad = (srad_nw.srad>=1200);
idx_invalid_nw = (srad_nw.nw>=1200);
ratio_invalid_source_srad_nw = length(find(idx_invalid_srad))/height(srad_nw(idx_srad_nw,:))
ratio_invalid_target_srad_nw = length(find(idx_invalid_nw))/height(srad_nw(idx_srad_nw,:))
ratio_invalid_srad_nw = length(find(idx_invalid_srad & idx_invalid_nw))/length(find((idx_invalid_srad | idx_invalid_nw) & idx_srad_nw))

idx_invalid_pf = (pf_km.pf>=1200);
idx_invalid_km = (pf_km.km>=1200);
ratio_invalid_source_pf_km = length(find(idx_invalid_pf))/height(pf_km(idx_pf_km,:))
ratio_invalid_target_pf_km = length(find(idx_invalid_km))/height(pf_km(idx_pf_km,:))
ratio_invalid_pf_km = length(find(idx_invalid_pf(idx_pf_km) & idx_invalid_km(idx_pf_km) ))/length(find((idx_invalid_pf | idx_invalid_km) & idx_pf_km))

idx_invalid_pf = (pf_hot.pf>=1200);
idx_invalid_hot = (pf_hot.hot>=1200);
ratio_invalid_source_pf_hot = length(find(idx_invalid_pf))/height(pf_hot(idx_pf_hot,:))
ratio_invalid_target_pf_hot = length(find(idx_invalid_hot))/height(pf_hot(idx_pf_hot,:))
ratio_invalid_pf_hot = length(find(idx_invalid_pf & idx_invalid_hot))/length(find((idx_invalid_pf | idx_invalid_hot) & idx_pf_hot))

idx_invalid_pf = (pf_nw.pf>=1200);
idx_invalid_nw = (pf_nw.nw>=1200);
ratio_invalid_source_pf_nw = length(find(idx_invalid_pf))/height(pf_nw(idx_pf_nw,:))
ratio_invalid_target_pf_nw = length(find(idx_invalid_nw))/height(pf_nw(idx_pf_nw,:))
ratio_invalid_pf_nw = length(find(idx_invalid_pf & idx_invalid_nw))/length(find((idx_invalid_pf | idx_invalid_nw) & idx_pf_nw))

idx_invalid_km = (km_hot.km>=1200);
idx_invalid_hot = (km_hot.hot>=1200);
ratio_invalid_source_km_hot = length(find(idx_invalid_km))/height(km_hot(idx_km_hot,:))
ratio_invalid_target_km_hot = length(find(idx_invalid_hot))/height(km_hot(idx_km_hot,:))
ratio_invalid_km_hot = length(find(idx_invalid_km & idx_invalid_hot))/length(find((idx_invalid_km | idx_invalid_hot) & idx_km_hot))

idx_invalid_km = (km_nw.km>=1200);
idx_invalid_nw = (km_nw.nw>=1200);
ratio_invalid_source_km_nw = length(find(idx_invalid_km))/height(km_nw(idx_km_nw,:))
ratio_invalid_target_km_nw = length(find(idx_invalid_nw))/height(km_nw(idx_km_nw,:))
ratio_invalid_km_nw = length(find(idx_invalid_km & idx_invalid_nw))/length(find((idx_invalid_km | idx_invalid_nw) & idx_km_nw))

idx_invalid_hot = (hot_nw.hot>=1200);
idx_invalid_nw = (hot_nw.nw>=1200);
ratio_invalid_source_hot_nw = length(find(idx_invalid_hot))/height(hot_nw(idx_hot_nw,:))
ratio_invalid_target_hot_nw = length(find(idx_invalid_nw))/height(hot_nw(idx_hot_nw,:))
ratio_invalid_hot_nw = length(find(idx_invalid_hot & idx_invalid_nw))/length(find((idx_invalid_hot | idx_invalid_nw) & idx_hot_nw))


% H4.2: classifier reusability
dim = 1:20;

idx_invalid_srad = (srad_pf.srad>=1200);
idx_invalid_pf = (srad_pf.pf>=1200);
[B_source_srad_pf] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_srad(idx_srad_pf)));
[B_target_srad_pf] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_pf(idx_srad_pf)));
corr_class_srad_pf = corr(B_source_srad_pf,B_target_srad_pf)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_srad(idx_srad_pf)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_pf(idx_srad_pf)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_srad_pf_importance = corr(imp_s',imp_t','type','Pearson')

idx_invalid_srad = (srad_km.srad>=1200);
idx_invalid_km = (srad_km.km>=1200);
[B_source_srad_km] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_srad(idx_srad_km)));
[B_target_srad_km] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_km(idx_srad_km)));
corr_class_srad_km = corr(B_source_srad_km,B_target_srad_km)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_srad(idx_srad_km)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_km(idx_srad_km)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_srad_km_importance = corr(imp_s',imp_t','type','Pearson')

idx_invalid_srad = (srad_hot.srad>=1200);
idx_invalid_hot = (srad_hot.hot>=1200);
[B_source_srad_hot] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_srad(idx_srad_hot)));
[B_target_srad_hot] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_hot(idx_srad_hot)));
corr_class_srad_hot = corr(B_source_srad_hot,B_target_srad_hot)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_srad(idx_srad_hot)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_hot(idx_srad_hot)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_srad_hot_importance = corr(imp_s',imp_t','type','Pearson')

idx_invalid_srad = (srad_nw.srad>=1200);
idx_invalid_nw = (srad_nw.nw>=1200);
[B_source_srad_nw] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_srad(idx_srad_nw)));
[B_target_srad_nw] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_nw(idx_srad_nw)));
corr_class_srad_nw = corr(B_source_srad_nw,B_target_srad_nw)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_srad(idx_srad_nw)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_nw(idx_srad_nw)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_srad_nw_importance = corr(imp_s',imp_t','type','Pearson')


idx_invalid_pf = (pf_km.pf>=1200);
idx_invalid_km = (pf_km.km>=1200);
[B_source_pf_km] = mnrfit(config_srad_others(:,1:10),categorical(idx_invalid_pf(idx_pf_km)));
[B_target_pf_km] = mnrfit(config_srad_others(:,1:10),categorical(idx_invalid_km(idx_pf_km)));
corr_class_pf_km = corr(B_source_pf_km,B_target_pf_km)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_pf(idx_pf_km)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_km(idx_pf_km)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_pf_km_importance = corr(imp_s',imp_t','type','Pearson')

idx_invalid_pf = (pf_hot.pf>=1200);
idx_invalid_hot = (pf_hot.hot>=1200);
[B_source_pf_hot] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_pf(idx_pf_hot)));
[B_target_pf_hot] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_hot(idx_pf_hot)));
corr_class_pf_hot = corr(B_source_pf_hot,B_target_pf_hot)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_pf(idx_pf_hot)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_hot(idx_pf_hot)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_pf_hot_importance = corr(imp_s',imp_t','type','Pearson')

idx_invalid_pf = (pf_nw.pf>=1200);
idx_invalid_nw = (pf_nw.nw>=1200);
[B_source_pf_nw] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_pf(idx_pf_nw)));
[B_target_pf_nw] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_nw(idx_pf_nw)));
corr_class_pf_nw = corr(B_source_pf_nw,B_target_pf_nw)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_pf(idx_pf_nw)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_nw(idx_pf_nw)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_pf_nw_importance = corr(imp_s',imp_t','type','Pearson')

idx_invalid_km = (km_hot.km>=1200);
idx_invalid_hot = (km_hot.hot>=1200);
[B_source_km_hot] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_km(idx_km_hot)));
[B_target_km_hot] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_hot(idx_km_hot)));
corr_class_km_hot = corr(B_source_km_hot,B_target_km_hot)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_km(idx_km_hot)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_hot(idx_km_hot)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_km_hot_importance = corr(imp_s',imp_t','type','Pearson')

idx_invalid_km = (km_nw.km>=1200);
idx_invalid_nw = (km_nw.nw>=1200);
[B_source_km_nw] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_km(idx_km_nw)));
[B_target_km_nw] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_nw(idx_km_nw)));
corr_class_km_nw = corr(B_source_km_nw,B_target_km_nw)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_km(idx_km_nw)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_nw(idx_km_nw)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_km_nw_importance = corr(imp_s',imp_t','type','Pearson')

idx_invalid_hot = (hot_nw.hot>=1200);
idx_invalid_nw = (hot_nw.nw>=1200);
[B_source_hot_nw] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_hot(idx_hot_nw)));
[B_target_hot_nw] = mnrfit(config_srad_others(:,dim),categorical(idx_invalid_nw(idx_hot_nw)));
corr_class_hot_nw = corr(B_source_hot_nw,B_target_hot_nw)

Mdl_s = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_hot(idx_hot_nw)))
Mdl_t = fitctree(config_srad_others(:,1:50),categorical(idx_invalid_nw(idx_hot_nw)))
imp_s = predictorImportance(Mdl_s);
imp_t = predictorImportance(Mdl_t);
corr_class_hot_nw_importance = corr(imp_s',imp_t','type','Pearson')




% results
input.data=[
corr_pear_srad_pf corr_spear_srad_pf top_per_intersect_srad_pf  bottom_per_intersect_srad_pf ratio_invalid_source_srad_pf ratio_invalid_target_srad_pf ratio_invalid_srad_pf corr_class_srad_pf corr_tree_srad_pf results_stepwise_srad_pf
corr_pear_srad_km corr_spear_srad_km top_per_intersect_srad_km	bottom_per_intersect_srad_km ratio_invalid_source_srad_km ratio_invalid_target_srad_km ratio_invalid_srad_km corr_class_srad_km corr_tree_srad_km results_stepwise_srad_km
corr_pear_srad_hot corr_spear_srad_hot top_per_intersect_srad_hot	bottom_per_intersect_srad_hot ratio_invalid_source_srad_hot ratio_invalid_target_srad_hot ratio_invalid_srad_hot corr_class_srad_hot corr_tree_srad_hot results_stepwise_srad_hot
corr_pear_srad_nw corr_spear_srad_nw top_per_intersect_srad_nw	bottom_per_intersect_srad_nw ratio_invalid_source_srad_nw ratio_invalid_target_srad_nw ratio_invalid_srad_nw corr_class_srad_nw corr_tree_srad_nw results_stepwise_srad_nw
corr_pear_pf_km corr_spear_pf_km top_per_intersect_pf_km	bottom_per_intersect_pf_km ratio_invalid_source_pf_km ratio_invalid_target_pf_km ratio_invalid_pf_km corr_class_pf_km corr_tree_pf_km results_stepwise_pf_km
corr_pear_pf_hot corr_spear_pf_hot top_per_intersect_pf_hot	bottom_per_intersect_pf_hot ratio_invalid_source_pf_hot ratio_invalid_target_pf_hot ratio_invalid_pf_hot corr_class_pf_hot corr_tree_pf_hot results_stepwise_pf_hot
corr_pear_pf_nw corr_spear_pf_nw top_per_intersect_pf_nw	bottom_per_intersect_pf_nw ratio_invalid_source_pf_nw  ratio_invalid_target_pf_nw ratio_invalid_pf_nw corr_class_pf_nw corr_tree_pf_nw results_stepwise_pf_nw
corr_pear_km_hot corr_spear_km_hot top_per_intersect_km_hot	bottom_per_intersect_km_hot ratio_invalid_source_km_hot ratio_invalid_target_km_hot ratio_invalid_km_hot corr_class_km_hot corr_tree_km_hot results_stepwise_km_hot
corr_pear_km_nw corr_spear_km_nw top_per_intersect_km_nw	bottom_per_intersect_km_nw ratio_invalid_source_km_nw ratio_invalid_target_km_nw ratio_invalid_km_nw corr_class_km_nw corr_tree_km_nw results_stepwise_km_nw
corr_pear_hot_nw corr_spear_hot_nw top_per_intersect_hot_nw	bottom_per_intersect_hot_nw ratio_invalid_source_hot_nw  ratio_invalid_target_hot_nw ratio_invalid_hot_nw corr_class_hot_nw corr_tree_hot_nw results_stepwise_hot_nw
corr_pear_nbody100_150 corr_spear_nbody100_150 top_per_intersect_nbody100_150	bottom_per_intersect_nbody100_150 0 0 0 0 corr_tree_nbody100_150 results_stepwise_nbody100_150
corr_pear_nbody100_750 corr_spear_nbody100_750 top_per_intersect_nbody100_750	bottom_per_intersect_nbody100_750 0 0 0 0 corr_tree_nbody100_750 results_stepwise_nbody100_750
corr_pear_nbody750_150 corr_spear_nbody750_150 top_per_intersect_nbody750_150	bottom_per_intersect_nbody750_150 0 0 0 0 corr_tree_nbody750_150 results_stepwise_nbody750_150 
corr_pear_gc_cg corr_spear_gc_cg top_per_intersect_gc_cg	bottom_per_intersect_gc_cg 0 0 0 0 corr_tree_gc_cg results_stepwise_gc_cg
];


% plot performance distribution

data_source = srad_pf{idx_valid_srad_pf,3};
data_target = srad_pf{idx_valid_srad_pf,4};
figure(1)
h=histfit(data_source,50);
xlim([0 400]);
h(1).FaceColor = [.8 .8 1];
h(2).Color = [.2 .2 .2];
xlabel('Runtime [s]');
ylabel('Frequency');
fontset

figure(2)
h=histfit(data_target,50);
xlim([0 400]);
h(1).FaceColor = [.8 .8 1];
h(2).Color = [.2 .2 .2];
xlabel('Runtime [s]');
ylabel('Frequency');
fontset


data_source = nbody750_150{idx_valid_nbody750_150,3};
data_target = nbody750_150{idx_valid_nbody750_150,4};
figure(1)
h=histfit(data_source,50);
xlim([0 10]);
ylim([0 4100]);
h(1).FaceColor = [.8 .8 1];
h(2).Color = [.2 .2 .2];
xlabel('Runtime [s]');
ylabel('Frequency');
fontset

figure(4)
h=histfit(data_target,50);
xlim([0 10]);
ylim([0 4100]);
h(1).FaceColor = [.8 .8 1];
h(2).Color = [.2 .2 .2];
xlabel('Runtime [s]');
ylabel('Frequency');
fontset