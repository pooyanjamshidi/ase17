function encoding_time = preproc_x264(file)
encoding_time = [];
stats = [];
fid = fopen(file,'r');
while ~feof(fid)
    line = fgets(fid);
    time_stats = sscanf(line,'%f');
    
    if length(time_stats)==5
        stats = [stats time_stats(3)];
        if mod(length(stats),3)==0
        encoding_time = [encoding_time;stats];
        stats = [];
        end
    end    
end
fclose(fid);

end