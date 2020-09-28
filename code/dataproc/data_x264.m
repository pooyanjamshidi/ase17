load('.\experiments\x264\toMeasure\configurations.mat');
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
num_of_options = length(parameters);

encoding_time_feature1_2762_8 = preproc_x264('.\data\raw\x264\feature1\featurewise.results_eledream_640x360_8');
encoding_time_feature1_2762_32 = preproc_x264('.\data\raw\x264\feature1\featurewise.results_eledream_640x360_32');
encoding_time_feature1_2762_128 = preproc_x264('.\data\raw\x264\feature1\featurewise.results_eledream_640x360_128');

encoding_time_feature8_2762_8 = preproc_x264('.\data\raw\x264\feature8\featurewise.results_eledream_640x360_8');
encoding_time_feature8_2762_32 = preproc_x264('.\data\raw\x264\feature8\featurewise.results_eledream_640x360_32');
encoding_time_feature8_2762_128 = preproc_x264('.\data\raw\x264\feature8\featurewise.results_eledream_640x360_128');

encoding_time_feature9_2389_8 = preproc_x264('.\data\raw\x264\feature9\featurewise.results_eledream_640x360_8');
encoding_time_feature9_2389_32 = preproc_x264('.\data\raw\x264\feature9\featurewise.results_eledream_640x360_32');
encoding_time_feature9_2389_128 = preproc_x264('.\data\raw\x264\feature9\featurewise.results_eledream_640x360_128');

encoding_time_feature10_2744_8 = preproc_x264('.\data\raw\x264\feature10\featurewise.results_eledream_640x360_8');
encoding_time_feature10_2744_32 = preproc_x264('.\data\raw\x264\feature10\featurewise.results_eledream_640x360_32');
encoding_time_feature10_2744_128 = preproc_x264('.\data\raw\x264\feature10\featurewise.results_eledream_640x360_128');

encoding_time_azure_2762_8 = preproc_x264('.\data\raw\x264\azure\featurewise.results_eledream_640x360_8');
encoding_time_azure_2762_32 = preproc_x264('.\data\raw\x264\azure\featurewise.results_eledream_640x360_32');
encoding_time_azure_2762_128 = preproc_x264('.\data\raw\x264\azure\featurewise.results_eledream_640x360_128');

encoding_time_amazon_nano_2762_8 = preproc_x264('.\data\raw\x264\amazon_nano\featurewise.results_eledream_640x360_8');
encoding_time_amazon_nano_2762_32 = preproc_x264('.\data\raw\x264\amazon_nano\featurewise.results_eledream_640x360_32');
encoding_time_amazon_nano_2762_128 = preproc_x264('.\data\raw\x264\amazon_nano\featurewise.results_eledream_640x360_128');

encoding_time_amazon_amazon_micro_2762_8 = preproc_x264('.\data\raw\x264\amazon_micro\featurewise.results_eledream_640x360_8');
encoding_time_amazon_amazon_micro_2762_32 = preproc_x264('.\data\raw\x264\amazon_micro\featurewise.results_eledream_640x360_32');
encoding_time_amazon_amazon_micro_2762_128 = preproc_x264('.\data\raw\x264\amazon_micro\featurewise.results_eledream_640x360_128');


x264 = [configurations ...
    mean(encoding_time_feature1_2762_8,2) mean(encoding_time_feature1_2762_32,2) mean(encoding_time_feature1_2762_128,2) ...
    mean(encoding_time_feature8_2762_8,2) mean(encoding_time_feature8_2762_32,2) mean(encoding_time_feature8_2762_128,2) ...
    mean(encoding_time_feature9_2389_8,2) mean(encoding_time_feature9_2389_32,2) mean(encoding_time_feature9_2389_128,2) ...
    mean(encoding_time_feature10_2744_8,2) mean(encoding_time_feature10_2744_32,2) mean(encoding_time_feature10_2744_128,2) ...
    mean(encoding_time_azure_2762_8,2) mean(encoding_time_azure_2762_32,2) mean(encoding_time_azure_2762_128,2) ...
    mean(encoding_time_amazon_nano_2762_8,2) mean(encoding_time_amazon_nano_2762_32,2) mean(encoding_time_amazon_nano_2762_128,2) ...
    mean(encoding_time_amazon_amazon_micro_2762_8,2) mean(encoding_time_amazon_amazon_micro_2762_32,2) mean(encoding_time_amazon_amazon_micro_2762_128,2) ...
    ];

% measurements regarding some of the invalid configurations contains a tiny
% noise that should be removed
for i = 1:length(configurations)
    if x264(i,num_of_options+1) ==0
        x264(i,num_of_options+1:end)=0;
    end
end

csvwrite_with_headers('.\data\processed\new_x264.csv',x264,[parameters,responses])