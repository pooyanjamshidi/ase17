function solving_time = preproc_spear(file)
solving_time = [];
stats = [];
fid = fopen(file,'r');
repeated_measurements = 2;
while ~feof(fid)
    line = fgets(fid);
    time_stats = sscanf(line,'%f');
    
    if length(time_stats)==5
        stats = [stats time_stats(1)];
        if mod(length(stats),repeated_measurements)==0
        solving_time = [solving_time;stats];
        stats = [];
        end
    end    
end
fclose(fid);

end