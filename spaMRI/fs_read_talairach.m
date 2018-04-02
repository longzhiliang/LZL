function xfm = fs_read_talairach(matname)
% read talairach transform matrix
% matname   -  path-to talairach transform matrix
% xfm       - talairach transform matrix
%%

fid                  = fopen(matname, 'r');
if fid == -1
    message          = sprintf('Cannot open the file %s',matname);
    disp(message);
else
    while feof(fid) == 0
        linef        = fgetl(fid);
        nb=findstr(linef, 'Linear_Transform');
        if nb == 1
            pos      = ftell(fid);
            break
        end
    end
    A                = (fscanf(fid, '%g',12))';
    xfm              = [A(1) A(2) A(3) A(4); A(5) A(6) A(7) A(8);A(9) A(10) A(11) A(12)];
    clear A
end
end