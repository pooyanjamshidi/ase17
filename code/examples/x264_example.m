% run from .../ase17/ (the top level directory of this repository)
% see ./doc/x264_example_workflow.pdf for a visualization
addpath('.\code\util\')
addpath('.\code\util\eliduenisch-latexTable-5212622\')
addpath('.\code\util\csv_write_headers\')
addpath('.\code\tl\')
addpath('.\code\dataproc\')
addpath('.\code\analysis\')

% Because x264 has 16 boolean configuration options, with a total of 2^16
% possible configurations, a random sample of possible configurations is
% preferred over measuring the entire population (we chose 4000).
% The function `generate_configurations_x264` takes an integer n, and
% generates n configurations. Output is stored as both the string arguments
% to be passed to parsec for measurement, as well as a configuration.m file
% containing boolean encodings for each configuration.

% NOTE: running this will OVERWRITE the configurations used in the
% original analysis. We will leave this commented out for now:
% generate_configurations_x264(4000)

% Measurements should now be collected using the same generated
% configurations across different environments. For x264, we store these in
% ./data/raw/x264/, where measurements are taken across 2 different
% hardware systems, 3 different benchmark videos (workloads), and for 3
% different versions of parsec. Note that we run every benchmark 3 times
% to account for measurement noise.

% Once measurements are collected, configurations can be joined with
% their average encoding times in each environment and stored in a csv for
% later use. Output will be stored in ./data/processed/x264.csv
data_x264

% Analysis of the metrics used for our research questions can be run with
% `proc_x264`. Output will be a latex table stored in variable `latex`.
proc_x264