function [NAME pathr] = getname_long(pathname,num)
%% the function is to find name in pathname which is specified by num
[path_1 name_1] = fileparts(pathname);
if num == 1
    NAME = name_1;
    pathr = path_1;
else
    num = num-1;
    [NAME pathr] = getname_long(path_1,num);
end
end