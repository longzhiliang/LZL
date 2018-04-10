function s = fs_white_surface(nvt,hemi)

num  = nvt+1;
filename = [hemi,'.white.asc'];
fid = fopen(filename);
for ii = 1:num
    if ii == 1
        for is = 1:3
            s = fgetl(fid);
        end
    else
        s = fgetl(fid);
    end
end
s = str2num(s);
s = s(1:3);
end