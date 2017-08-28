dimensions_no = {'ls','dcr','cf','lir','inl','lur','wlur','prfunr','cse','dfr','wlf','ivecyc','ive','ivesli','dl','rco','uip','dr','ipc','wlpg','cp','vp','srf','msca','phm','wls','as','wlsimp','cwle','lro','rnb','rip','sde','wlprop','saa','cyc','scyc','saacyc','wlsd','cts','ucts'};
dimensions_do = {'lus','wlt','awlf','wlflt','ae','dpa','lao','pra'};
dimensions_options = {'extrema'};
dimensions_numerics = {'initmheap','initwheap','maxae','maxlur','maxoptcyc','maxprfur','maxwlur','numthreads'};


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


config_id_srad_others = mintersect(srad_pf{:,2},srad_km{:,2},srad_hot{:,2},srad_nw{:,2},pf_km{:,2},pf_hot{:,2},pf_nw{:,2},km_hot{:,2},km_nw{:,2},hot_nw{:,2});
config_id_nbody_others = mintersect(nbody100_150{:,2},nbody100_750{:,2},nbody750_150{:,2});
config_id_gc_cg = gc_cg{:,2};

[~,idx_tab_srad_others,~]=intersect(srad_pf{:,2},config_id_srad_others);
[~,idx_tab_nbody_others,~]=intersect(nbody100_150{:,2},config_id_nbody_others);
[~,idx_tab_gc_cg,~]=intersect(gc_cg{:,2},config_id_gc_cg);


config_srad_others = db_to_csv_sac(srad_pf{idx_tab_srad_others,1});
config_nbody_others = db_to_csv_sac(nbody100_150{idx_tab_nbody_others,1});
config_gc_cg = db_to_csv_sac(gc_cg{idx_tab_gc_cg,1});



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

sac_srad_others = [config_srad_others,srad_pf{idx_srad_pf,3},srad_pf{idx_srad_pf,4},srad_km{idx_srad_km,4},srad_hot{idx_srad_hot,4},srad_nw{idx_srad_nw,4}];
sac_nbody_others = [config_nbody_others,nbody100_150{idx_nbody100_150,3},nbody100_150{idx_nbody100_150,4},nbody100_750{idx_nbody100_750,4}];
sac_gc_cg = [config_gc_cg,gc_cg{:,3},gc_cg{:,4}];

responses_srad_others = {'srad','particle_filter','kmeans','hotspot','nw'};
responses_nbody_others = {'nbody100','nbody150','nbody750'};
responses_gc_cg = {'gc','cg'};

csvwrite_with_headers('sac_srad_others.csv',sac_srad_others,[dimensions_no,dimensions_do,dimensions_options,dimensions_numerics,responses_srad_others])
csvwrite_with_headers('sac_nbody_others.csv',sac_nbody_others,[dimensions_no,dimensions_do,dimensions_options,dimensions_numerics(1:end-1),responses_nbody_others])
csvwrite_with_headers('sac_gc_cg.csv',sac_gc_cg,[dimensions_no,dimensions_do,dimensions_options,dimensions_numerics(1:end-1),responses_gc_cg])
