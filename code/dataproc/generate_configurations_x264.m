% generates a random selection of the possible configurations that
% x264 could take. Output is to .\experiments\x264\toMeasure\. Note that
% one file is generated per configuration, as well as a configurations.mat
% file containing binary encodings of all the configurations generated.

function configurations = generate_configurations_x264(number_of_conf)
parameters = {'non-deterministic','no-asm','no-mixed-refs','no-chroma-me',...
    'no-8x8dct','no-fast-pskip','no-dct-decimate',...
    'no-scenecut','no-cabac','no-deblock','no-mbtree',...
    'no-weightb','no-psy','no-progress','visualize','dts-compress'};
number_of_parameters = length(parameters);
dir = '.\experiments\x264\toMeasure\';
formatSpec = ['--%s '];
configurations = [];
for i=1:number_of_conf
    confstr = [];
    configuration = randi([0 1],1,number_of_parameters);
    configurations = [configurations;configuration];
    fid = fopen([dir num2str(i) '.txt'],'w');
    for j=1:number_of_parameters
        if configuration(j)~=0
            confstr = [confstr sprintf(formatSpec,parameters{j})];
        end
    end
    fprintf(fid,confstr);
    fclose(fid);
end
save([dir 'configurations.mat'],'configurations');
end