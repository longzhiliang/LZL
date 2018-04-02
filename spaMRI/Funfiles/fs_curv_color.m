function Cdata = fs_curv_color(vertices,v_curv,colorpath)
% This function is to obtain RGB color Cdata for ?h.curv
% vertices     -  surface vertices
% v_curv       -  ?h.curv value
% colorpath    -  path-to-colormap
% Author, Zhiliang Long, 2017-9-13
%%

load(colorpath);
colorname                    = whos('-file',colorpath);
colorname                    = eval(colorname.name);

A                            = colorname(21:end-20,:);
B                            = colorname(21:end-20,:);
B(1:5,:)                     = [];

colorname                    = [A;B];
clear A B

Cdata                        = zeros(length(vertices),3);
A                            = (v_curv - min(v_curv))./(max(v_curv) - min(v_curv));
A                            = ceil(A*size(colorname,1));
A(A>size(colorname,1))       = size(colorname,1);
for i=1:size(colorname,1)
    Cdata(find(A == i),:)    = repmat(colorname(i,:),length(find(A==i)),1);
end
clear A B
end