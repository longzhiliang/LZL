function ok = fs_save_label(lindex, lxyz, lvals, labelfile)

ok = 0;
if(~isempty(lindex) && ~isempty(lxyz))
    npoints1 = length(lindex);
    npoints2 = size(lxyz,1);
    if(npoints1 ~= npoints2)
        fprintf('ERROR: lindex and lxyz have different lengths.\n');
        return;
    end
    npoints = npoints1;
elseif(~isempty(lindex))
    npoints = length(lindex);
    lxyz = zeros(npoints,3);
elseif(~isempty(lxyz))
    npoints = length(lxyz);
    lindex = zeros(npoints,1);
end

if(size(lxyz,2) ~= 3)
    fprintf('ERROR: lxyz does not have 3 columns\n');
    return;
end

if(~isempty(lvals))
    if(npoints ~= length(lvals))
        fprintf('ERROR: length of lvals inconsistent\n');
        return;
    end
else
    lvals  = zeros(npoints,1);
end

% open as an ascii file
fid = fopen(labelfile, 'w') ;
if(fid == -1)
    fprintf('ERROR: could not open %s\n',labelfile);
    return;
end

fprintf(fid,'#!ascii label \n');
fprintf(fid,'%d\n',npoints);

% Make sure they are npoints by 1 %
lindex = reshape(lindex,[npoints 1]);
lxyz   = reshape(lxyz,  [npoints 3]);
lvals  = reshape(lvals, [npoints 1]);

l = [lindex lxyz lvals];
fprintf(fid,'%d %f %f %f %f\n',l') ;

fclose(fid) ;
ok = 1;
return;
