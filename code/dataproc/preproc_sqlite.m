function operation_time=preproc_sqlite(folder)

number_of_measurements = 1000;
operation_time = [];

for i=1:number_of_measurements
stats = [];
fid = fopen([folder num2str(i) '.log'],'r');
while ~feof(fid)
    line = fgets(fid);
    if ~isempty(regexp(line,'micros/op','match'))
    time_stats = textscan(line,'%s %s %f %s %f %s %s %s');
    stats = [stats time_stats{3}]; 
    end
end
operation_time = [operation_time;stats(end-13:end)];    
fclose(fid);
end
end