function configurations = generate_configurations_sqlite(number_of_conf)
parameters = {'SQLITE_SECURE_DELETE','SQLITE_ENABLE_ATOMIC_WRITE','SQLITE_ENABLE_STAT2','SQLITE_DISABLE_LFS',...
    'SQLITE_DISABLE_DIRSYNC','SQLITE_OMIT_AUTOMATIC_INDEX','SQLITE_OMIT_BETWEEN_OPTIMIZATION',...
    'SQLITE_OMIT_BTREECOUNT','SQLITE_OMIT_LIKE_OPTIMIZATION','SQLITE_OMIT_LOOKASIDE','SQLITE_OMIT_OR_OPTIMIZATION',...
    'SQLITE_OMIT_QUICKBALANCE','SQLITE_OMIT_SHARED_CACHE','SQLITE_OMIT_XFER_OPT'};
number_of_parameters = length(parameters);
dir = '../../experiments/sqlite/toMeasure_14april2017/';
formatSpec = ['#undef %s' '\n' '#define %s 1' '\n'];
configurations = [];

for i=1:number_of_conf
    configuration = randi([0 1],1,number_of_parameters);
    configurations = [configurations;configuration];
    fid = fopen([dir num2str(i) '.h'],'w');
    for j=1:number_of_parameters
        if configuration(j)~=0
            fprintf(fid,formatSpec,parameters{j},parameters{j});
        end
    end
    fclose(fid);
end
save([dir 'configurations.mat'],'configurations');
end