function Cdata = fs_surf_color(vertices,v_surf,colorpath,default_pos_th_up,default_neg_th_up)
% Author, Zhiliang Long, 2017-9-13
%%
load(colorpath);
colorname                    = whos('-file',colorpath);
colorname                    = eval(colorname.name);

Cdata                        = zeros(length(vertices),3);
A                            = (v_surf - default_neg_th_up)/(default_pos_th_up - default_neg_th_up);
A                            = ceil(A*size(colorname,1));
A(A>size(colorname,1))       = size(colorname,1);
for i=1:size(colorname,1)
    Cdata(find(A == i),:)    = repmat(colorname(i,:),length(find(A==i)),1);
end
clear A B
end